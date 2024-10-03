import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Services/allApiEndPoint.dart';
import '../../Custom Widget/costomTextfield.dart';
import '../../Helper/app_colors.dart';
import '../Custom Widget/customAppbar.dart';
import '../Model/getUserDataModel.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuserId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: CustomAppbar(titlee: 'Your Profile')),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomTextField(
                        controller: nameController,
                        maxleanthh: 60,
                        hintt: 'Name',
                        validation: 'Please Enter Your Name',
                        icon: Icons.person),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 50,
                      controller: emailController,
                      cursorColor: AppColors.gray,
                      style: const TextStyle(color: AppColors.gray),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5)),
                        hintText: 'Email Id',
                        suffixStyle: TextStyle(color: AppColors.gray),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email Id';
                        } else if (!value.contains("@") &&
                            !value.contains(".com")) {
                          return 'Please Enter Valid  Email Id';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      controller: mobileController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.call,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Mobile No.',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Mobile Number';
                        } else if (value.length < 10) {
                          return 'Please Enter Valid Mobile Number';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            width: 1, color: AppColors.textfieldColor),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 13,
                          ),
                          Icon(
                            Icons.ac_unit_outlined,
                            color: AppColors.gray,
                            size: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.6,
                            child: Text(
                              technicianType,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  color: AppColors.gray, fontSize: 16),
                            ),
                          ), // Not necessary for Option 1
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              //isExpanded: true,

                              // hint: SizedBox(
                              //     width:
                              //     MediaQuery.of(context).size.width /
                              //         1.7,
                              //     child:
                              //     Text(
                              //       'Choose a Technician Type',
                              //       overflow: TextOverflow.ellipsis,
                              //       maxLines: 1,
                              //       style:
                              //       TextStyle(color: AppColors.gray),
                              //     )), // Not necessary for Option 1
                              // //value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue.toString();
                                  technicianType = _selectedLocation.toString();
                                  if (_selectedLocation == 'Electrician') {
                                    setState(() {
                                      technicianTypeController.text =
                                          'electrician';
                                      print(technicianTypeController.text);
                                    });
                                  } else {
                                    setState(() {
                                      technicianTypeController.text = 'plumber';
                                      print(technicianTypeController.text);
                                    });
                                  }
                                });
                              },
                              items: technician_typeList.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(location),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: addressController,
                        maxleanthh: 100,
                        hintt: 'Address',
                        validation: 'Please Enter Your Address',
                        icon: Icons.location_on_outlined),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      readOnly: true,
                      onTap: () {
                        _selectDate(context);
                      },
                      keyboardType: TextInputType.number,
                      controller: dateofController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.calendar_month_sharp,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Date Of Birth',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Select Date Of Birth';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 10,
                      controller: pannumberController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Pan Number',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Pan Number';
                        } else if (value.length < 10) {
                          return 'Please Enter Valid Pan Number';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context, 'pan');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textfieldColor),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: getUserData?.data == null
                                      ? Image.asset(
                                          'assets/images/pan.png',
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                      : panImg == null
                                          ? Image.network(
                                              '${getUserData?.data.first.pancardImg.toString()}')
                                          : Image.file(panImg!)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primery),
                            child: Center(
                                child: Text(
                              'Upload Pan Card',
                              style: TextStyle(
                                  color: AppColors.SplashBackgroundColor,
                                  fontWeight: FontWeight.w500),
                            )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 12,
                      controller: adharController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.credit_card,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Aadhar Number',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Aadhar Number';
                        } else if (value.length < 12) {
                          return 'Please Enter Valid Aadhar Number';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context, 'aadharfront');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textfieldColor),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: getUserData?.data == null
                                      ? Image.asset(
                                          'assets/images/adhar.png',
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                      : adharfronImg == null
                                          ? Image.network(
                                              '${getUserData?.data.first.adharFrontImg.toString()}')
                                          : Image.file(adharbackImg!)),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.primery),
                                child: Center(
                                  child: Text(
                                    'Upload Aadhar Card',
                                    style: TextStyle(
                                        color: AppColors.SplashBackgroundColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '  Front Image',
                                    style: TextStyle(
                                        color: AppColors.gray, fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context, 'aadharback');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textfieldColor),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: getUserData?.data == null
                                    ? Image.asset(
                                        'assets/images/backadhar.png',
                                        height: 150.0,
                                        width: 100.0,
                                      )
                                    : adharbackImg == null
                                        ? Image.network(
                                            '${getUserData?.data.first.adharBackImg.toString()}')
                                        : Image.file(adharbackImg!),
                              ),
                            ),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.primery),
                                child: Center(
                                  child: Text(
                                    'Upload Aadhar Card',
                                    style: TextStyle(
                                        color: AppColors.SplashBackgroundColor,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '  Back Image',
                                    style: TextStyle(
                                        color: AppColors.gray, fontSize: 10),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 20,
                      controller: accountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_balance_sharp,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'Account Number',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Account Number';
                        } else if (value.length < 5) {
                          return 'Please Enter Valid Account Number';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context, 'account');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textfieldColor),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: getUserData?.data == null
                                      ? Image.asset(
                                          'assets/images/passbook.png',
                                          height: 150.0,
                                          width: 100.0,
                                        )
                                      : passbookImg == null
                                          ? Image.network(
                                              '${getUserData?.data.first.bankPassbook.toString()}')
                                          : Image.file(passbookImg!)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primery),
                            child: Center(
                                child: Text(
                              'Upload Passbook/Cheque',
                              style: TextStyle(
                                  color: AppColors.SplashBackgroundColor,
                                  fontWeight: FontWeight.w500),
                            )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      maxLength: 11,
                      controller: ifscController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_balance_sharp,
                          color: AppColors.gray,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: 'IFSC Code',
                        suffixStyle: TextStyle(color: Colors.grey),
                        counterText: '',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter IFSC Code';
                        } else if (value.length < 11) {
                          return 'Please Enter Valid IFSC Code';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context, 'profile');
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColors.textfieldColor),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: getUserData?.data == null
                                      ? Image.asset(
                                          'assets/images/Group 72514.png',
                                          height: 150.0,
                                          width: 150.0,
                                        )
                                      : userImg == null
                                          ? Image.network(
                                              '${getUserData?.data.first.staffImg.toString()}')
                                          : Image.file(userImg!)),
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.primery),
                            child: Center(
                                child: Text(
                              'Upload Your Image',
                              style: TextStyle(
                                  color: AppColors.SplashBackgroundColor,
                                  fontWeight: FontWeight.w500),
                            )),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    // InkWell(
                    //   onTap: () {
                    //
                    //
                    //         setState(() {
                    //           selectt=true;
                    //         });
                    //
                    //         Future.delayed(Duration(seconds: 10),(){
                    //
                    //           setState(() {
                    //             selectt=false;
                    //           });
                    //
                    //         });
                    //
                    //
                    //
                    //
                    //   },
                    //   child: Container(
                    //     height: 50,
                    //     decoration: BoxDecoration(
                    //         color: AppColors.primery,
                    //         borderRadius: BorderRadius.circular(5)),
                    //     child:  Center(
                    //       child:
                    //       selectt==true?
                    //       Text(
                    //
                    //         'Waiting...',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 13,
                    //             color: AppColors.SplashBackgroundColor),
                    //       ):
                    //       Text(
                    //
                    //         'Update Profile',
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 13,
                    //             color: AppColors.SplashBackgroundColor),
                    //       ),
                    //     ),
                    //   ),
                    //
                    // ),
                  ],
                ),
              ),
            )));
  }

  bool selectt = false;
  final _formKey = GlobalKey<FormState>();
  String? _selectedLocation;
  List<String> technician_typeList = ['Electrician', 'Plumber'];

  Future<void> pickImage(ImageSource source, String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 100,
      maxWidth: 100,
      imageQuality: 50, // You can adjust the image quality here
    );

    if (pickedFile != null) {
      setState(() {
        if (type == 'pan') {
          panImg = File(pickedFile.path);
          print(panImg);
        } else if (type == 'aadharfront') {
          adharfronImg = File(pickedFile.path);
          print(adharfronImg);
        } else if (type == 'aadharback') {
          adharbackImg = File(pickedFile.path);
          print(adharbackImg);
        } else if (type == 'account') {
          passbookImg = File(pickedFile.path);
          print(passbookImg);
        } else if (type == 'profile') {
          userImg = File(pickedFile.path);
          print('============${userImg!.path}');
        }
      });
    }
  }

  File? panImg;
  File? adharfronImg;
  File? adharbackImg;
  File? passbookImg;
  File? userImg;
  showAlertDialog(BuildContext context, String type) {
    AlertDialog alert = AlertDialog(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Container(
            height: 250,
            color: Colors.transparent, //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 5,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Select Any One Option',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        print(type);
                        Navigator.of(context).pop();
                        pickImage(ImageSource.gallery, type);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text('Select From Gallery')),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        print(type);
                        Navigator.of(context).pop();
                        pickImage(ImageSource.camera, type);
                      },
                      child: Card(
                        elevation: 5,
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: Text('Select From Camera')),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: selectedDate,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateofController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
        print("==================${dateofController.text}");
      });
  }

  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController technicianTypeController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController dateofController = TextEditingController();
  TextEditingController pannumberController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  var useriddd;
  Future<void> getuserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useriddd = prefs.getString('userId');
    print(
        'use id in home screen-=========================${useriddd.runtimeType}');
    print('user id in home screen-=========================${useriddd}');
    getUserDtaApi(useriddd ?? '');
  }

  GetUserData? getUserData;
  var technicianType = '';
  void getUserDtaApi(String userId) {
    print('get user data api');
    var data = {'user_id': userId.toString()};

    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getUserDataApiUrl), data)
        .then(
      (getdata) async {
        print('$getdata');
        bool error = getdata["error"];
        String? msge = getdata["message"];
        print('${error}');
        if (!error) {
          var finalresult = GetUserData.fromJson(getdata);
          setState(() {
            getUserData = finalresult;
            nameController.text = getUserData!.data.first.username;
            mobileController.text = getUserData!.data.first.mobile;
            emailController.text = getUserData!.data.first.email ?? "";
            dateofController.text =
                DateFormat('yyyy-MM-dd').format(getUserData!.data.first.dob);
            if (getUserData!.data.first.technicianType == 'electrician') {
              setState(() {
                technicianTypeController.text = 'Electrician';
              });
            } else {
              setState(() {
                technicianTypeController.text = 'Plumber';
              });
            }
            technicianType = technicianTypeController.text.toString();
            addressController.text = getUserData!.data.first.address;
            pannumberController.text = getUserData!.data.first.pancardNumber;
            adharController.text = getUserData!.data.first.adharNumber;
            accountController.text = getUserData!.data.first.accountNumber;
            ifscController.text = getUserData!.data.first.ifscCode;
          });
        } else {
          Fluttertoast.showToast(
            msg: '${msge}',
          );
        }
      },
      onError: (error) {},
    );
  }
}
