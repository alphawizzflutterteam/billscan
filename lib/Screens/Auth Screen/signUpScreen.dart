import 'dart:convert';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../Api Services/allApiEndPoint.dart';
import '../../Custom Widget/costomTextfield.dart';
import '../../Helper/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'assets/images/create account.png',
                      height: 170,
                      width: 170,
                    ),
                  ),
                  Image.asset(
                    'assets/images/bg shap.png',
                  ),
                ]),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 3.7,
              left: 20,
              right: 20,
              child: Card(
                elevation: 2,
                color: AppColors.SigninCardBackgroundColor,
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.6,
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'Create Account',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.primery),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3.2,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                CustomTextField(
                                    controller: nameController,
                                    maxleanthh: 60,
                                    hintt: 'Name',
                                    validation: 'Please Enter Your Name',
                                    icon: Icons.person),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                // TextFormField(
                                //   maxLength: 50,
                                //   controller: emailController,
                                //   cursorColor: AppColors.gray,
                                //   style: const TextStyle(color: AppColors.gray),
                                //   decoration: const InputDecoration(
                                //     prefixIcon: Icon(
                                //       Icons.email,
                                //       color: AppColors.gray,
                                //     ),
                                //     border: OutlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.grey, width: 0.5)),
                                //     hintText: 'Email Id',
                                //     suffixStyle: TextStyle(color: AppColors.gray),
                                //     counterText: '',
                                //   ),
                                //   validator: (value) {
                                //     if (value == null || value.isEmpty) {
                                //       return 'Please Enter Email Id';
                                //     } else if (!value.contains("@") &&
                                //         !value.contains(".com")) {
                                //       return 'Please Enter Valid  Email Id';
                                //     }
                                //   },
                                // ),
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
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                        width: 1,
                                        color: AppColors.textfieldColor),
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
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          //isExpanded: true,

                                          hint: SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.1,
                                              child: Text(
                                                'Choose a Technician Type',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    color: AppColors.gray),
                                              )), // Not necessary for Option 1
                                          value: _selectedLocation,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _selectedLocation =
                                                  newValue.toString();
                                              if (_selectedLocation ==
                                                  'Electrician') {
                                                setState(() {
                                                  technicianTypeController
                                                      .text = 'electrician';
                                                  print(technicianTypeController
                                                      .text);
                                                });
                                              } else if (_selectedLocation ==
                                                  'Plumber') {
                                                setState(() {
                                                  technicianTypeController
                                                      .text = 'plumber';
                                                  print(technicianTypeController
                                                      .text);
                                                });
                                              } else {
                                                setState(() {
                                                  technicianTypeController
                                                      .text = 'both';
                                                  print(technicianTypeController
                                                      .text);
                                                });
                                              }
                                            });
                                          },
                                          items: technician_typeList
                                              .map((location) {
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
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  maxLength: 10,
                                  controller: pannumberController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.credit_card,
                                      color: AppColors.gray,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textfieldColor),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: panImg == null
                                                ? Image.asset(
                                                    'assets/images/pan.png',
                                                    height: 150.0,
                                                    width: 100.0,
                                                  )
                                                : Image.file(panImg!),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primery),
                                        child: Center(
                                            child: Text(
                                          'Upload Pan Card',
                                          style: TextStyle(
                                              color: AppColors
                                                  .SplashBackgroundColor,
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
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textfieldColor),
                                        ),
                                        child: Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: adharfronImg == null
                                                  ? Image.asset(
                                                      'assets/images/adhar.png',
                                                      height: 150.0,
                                                      width: 100.0,
                                                    )
                                                  : Image.file(adharfronImg!)),
                                        ),
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppColors.primery),
                                            child: Center(
                                              child: Text(
                                                'Upload Aadhar Card',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .SplashBackgroundColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '  Front Image',
                                                style: TextStyle(
                                                    color: AppColors.gray,
                                                    fontSize: 10),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textfieldColor),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: adharbackImg == null
                                                ? Image.asset(
                                                    'assets/images/backadhar.png',
                                                    height: 150.0,
                                                    width: 100.0,
                                                  )
                                                : Image.file(adharbackImg!),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.2,
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppColors.primery),
                                            child: Center(
                                              child: Text(
                                                'Upload Aadhar Card',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .SplashBackgroundColor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '  Back Image',
                                                style: TextStyle(
                                                    color: AppColors.gray,
                                                    fontSize: 10),
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
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textfieldColor),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: passbookImg == null
                                                ? Image.asset(
                                                    'assets/images/passbook.png',
                                                    height: 150.0,
                                                    width: 100.0,
                                                  )
                                                : Image.file(passbookImg!),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primery),
                                        child: Center(
                                            child: Text(
                                          'Upload Passbook/Cheque',
                                          style: TextStyle(
                                              color: AppColors
                                                  .SplashBackgroundColor,
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
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  maxLength: 11,
                                  controller: ifscController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.account_balance_sharp,
                                      color: AppColors.gray,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.textfieldColor),
                                        ),
                                        child: Center(
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: userImg == null
                                                  ? Image.asset(
                                                      'assets/images/Group 72514.png',
                                                      height: 150.0,
                                                      width: 150.0,
                                                    )
                                                  : Image.file(userImg!)),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.2,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.primery),
                                        child: Center(
                                            child: Text(
                                          'Upload Your Image',
                                          style: TextStyle(
                                              color: AppColors
                                                  .SplashBackgroundColor,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      )
                                    ],
                                  ),
                                ),

                                // SizedBox(height: 300,),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                if (technicianTypeController.text == null ||
                                    technicianTypeController.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Please Select Technician Type');
                                } else if (panImg == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Please Upload Pan Image');
                                } else if (adharfronImg == null) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please Upload Aadhar Card Front Image');
                                } else if (adharbackImg == null) {
                                  Fluttertoast.showToast(
                                      msg:
                                          'Please Upload Aadhar Card Back Image');
                                } else if (passbookImg == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Please Upload Passbook Image');
                                } else if (userImg == null) {
                                  Fluttertoast.showToast(
                                      msg: 'Please Upload Your Profile Image');
                                } else {
                                  setState(() {
                                    selectt = true;
                                  });
                                  staffRegistrationApi();
// Future.delayed(Duration(seconds: 20),(){
//
//   setState(() {
//   selectt=false;
//   });
//
// });
                                }
                              }
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: AppColors.primery,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: selectt == true
                                    ? Text(
                                        'Waiting...',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: AppColors
                                                .SplashBackgroundColor),
                                      )
                                    : Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: AppColors
                                                .SplashBackgroundColor),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height / 1.1,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Don't have an account? Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.SplashBackgroundColor,
                          ))),
                ],
              )),
        ],
      ),
    )));
  }

  bool selectt = false;
  final _formKey = GlobalKey<FormState>();
  String? _selectedLocation;
  List<String> technician_typeList = ['Electrician', 'Plumber', 'Both'];

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

  Future<void> staffRegistrationApi() async {
    print('api call');

    print(nameController.text);
    print(mobileController.text);
    print(technicianTypeController.text);
    print(addressController.text);
    print(dateofController.text);
    print(adharController.text);
    print(pannumberController.text);
    print(accountController.text);
    print(panImg!.path);
    print(adharfronImg!.path);
    print(adharbackImg!.path);
    print(passbookImg!.path);
    print(userImg!.path);

    var request = http.MultipartRequest(
        'POST', Uri.parse(ApiService.UserregistrationApiUrl));

    request.fields.addAll({
      'name': nameController.text,
      'mobile': mobileController.text,
      'technician_type': technicianTypeController.text,
      'address': addressController.text,
      'dob': dateofController.text,
      'aadhar_no': adharController.text,
      'pan_card': pannumberController.text,
      'account_number': accountController.text,
      'ifsc_code': ifscController.text
    });

    request.files.add(await http.MultipartFile.fromPath(
        'adhar_back_img', adharbackImg!.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'pancard_img', panImg!.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'bank_passbook', passbookImg!.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'staff_img', userImg!.path.toString()));
    request.files.add(await http.MultipartFile.fromPath(
        'adhar_front_img', adharfronImg!.path.toString()));

    print('this is files request ${request.fields.toString()}');
    print('this is files request ${request.files.toString()}');
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalresult = jsonDecode(result);
      var error = finalresult['error'];
      if (error == false) {
        setState(() {
          selectt = false;
        });
        Navigator.pop(context);
        Fluttertoast.showToast(msg: finalresult['message']);
      } else {
        setState(() {
          selectt = false;
        });

        Fluttertoast.showToast(msg: finalresult['message']);
      }
    } else {
      print('166');

      print(response.reasonPhrase);
    }
  }

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
}
