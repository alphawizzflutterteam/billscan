import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Services/allApiEndPoint.dart';
import '../../Helper/app_colors.dart';
import '../../Helper/constant.dart';
import '../../Model/getQrdataModel.dart';
import '../../Model/getUserDataModel.dart';
import '../Auth Screen/loginScreen.dart';
import '../about_us.dart';
import '../privecy_policy.dart';
import '../scannerHistory.dart';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../terms_and_contition.dart';
import '../user_Profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getuserId();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: AppColors.primery),
                    child: Text("YES"),
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: AppColors.primery),
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
        return true;
      },
      child: SafeArea(
          child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profile(),
                    ));
              },
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColors.SigninCardBackgroundColor)),
                  color: AppColors.primery,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.SigninCardBackgroundColor,
                      backgroundImage:
                          NetworkImage(getUserData?.data[0].staffImg ?? ''),
                      radius: 45,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.SigninCardBackgroundColor),
                        ),
                        Text(
                          '${getUserData?.data[0].username ?? ''}',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: AppColors.SigninCardBackgroundColor),
                        ),
                      ],
                    ),
                    // SizedBox(width: 50,),
                    Spacer(),
                    Icon(Icons.edit,color: AppColors.SplashBackgroundColor,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: drawerList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });

                    Navigator.pop(context);
                    if (currentIndex == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calssList[index],
                          ));
                    } else if (currentIndex == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calssList[index],
                          ));
                    } else if (currentIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calssList[index],
                          ));
                    } else if (currentIndex == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calssList[index],
                          ));
                    } else if (currentIndex == 4) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => calssList[index],
                          ));
                    } else if (currentIndex == 5) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Sign Out"),
                              content: Text("Are you sure to sign out?"),
                              actions: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColors.primery),
                                  child: Text("YES"),
                                  onPressed: () async {
                                    setState(() {
                                      sessonRemove();
                                    });
                                    Navigator.pop(context);
                                    // SystemNavigator.pop();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                  },
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: AppColors.primery),
                                  child: Text("NO"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: currentIndex == index
                          ? AppColors.primery
                          : Colors.transparent,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          currentIndex == index
                              ? Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage(drawerList[index]['image1']),
                                    fit: BoxFit.cover,
                                  )),
                                )
                              : Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage(drawerList[index]['image']),
                                    fit: BoxFit.cover,
                                  )),
                                ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '${drawerList[index]['titlee']}',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: currentIndex == index
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: currentIndex == index
                                    ? AppColors.SigninCardBackgroundColor
                                    : AppColors.primery),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ]),
        ),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primery,
            elevation: 3,
            shadowColor: AppColors.primery,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13)),
            ),
            flexibleSpace: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(13)),
              height: 80,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Container(
                            height: 20,
                            width: 25,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/menu icon.png'),
                                    fit: BoxFit.fill)),
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.9,
                      ),
                      Text(
                        'Scan item',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.SigninCardBackgroundColor),
                      ),
                      SizedBox(),
                    ],
                  )),
            ),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundColor: AppColors.primery,
                child: CircleAvatar(
                  backgroundColor: AppColors.gray,
                  backgroundImage:
                      NetworkImage(getUserData?.data[0].staffImg ?? ''),
                  radius: 54,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${getUserData?.data[0].username ?? ''}',
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: AppColors.blackTemp),
          ),
          const SizedBox(
            height: 50,
          ),
          Card(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/qr-code.png',
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.height / 3.5,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Lorem ipsum dolor sit amet, consectetur',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.gray),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'adipiscing elit, sed do eiusmod',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.gray),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          InkWell(
            onTap: () async {
              //  Scannerr(context);

              qrresult = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>

                        //QRViewExample

                      ScanPay(),
                  ));

              if (qrresult != null) {
                print('scancode====================${qrresult}');
                //await ScannqrCodeApi(qrresult);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.primery,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.SplashBackgroundColor,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    'Scan QR Code',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.SplashBackgroundColor),
                  ),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var currentIndex;

  List calssList = [
    HomeScreen(),
    ScannerHistory(),
    TerAndCondition(),
    AboutUs(),
    Privecy_Policy(),
  ];

  List<Map<String, dynamic>> drawerList = [
    {
      'titlee': 'Home',
      'image': 'assets/images/Icon awesome-home.png',
      'image1': 'assets/images/home.png',
    },
    {
      'titlee': 'Scan History',
      'image': 'assets/images/Scan History.png',
      'image1': 'assets/images/Scan HistoryW.png',
    },
    {
      'titlee': 'Terms & Conditions',
      'image': 'assets/images/Terms & Conditions.png',
      'image1': 'assets/images/Terms & ConditionsW.png',
    },
    {
      'titlee': 'About Us',
      'image': 'assets/images/About Us.png',
      'image1': 'assets/images/About UsW.png',
    },
    {
      'titlee': 'Privacy Policy',
      'image': 'assets/images/Privacy Policy.png',
      'image1': 'assets/images/Privacy PolicyW.png',
    },
    {
      'titlee': 'Logout',
      'image': 'assets/images/Logout.png',
      'image1': 'assets/images/LogoutW.png',
    },
  ];

  var qrresult;
  Future<void> sessonRemove() async {
    print('session remove success');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('userId');

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
  }

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

  void getUserDtaApi(String userId) {
    print('get user data api');
    var data = {'user_id': userId.toString()};

    apiBaseHelper
        .postAPICall(Uri.parse(ApiService.getUserDataApiUrl), data)
        .then(
      (getdata) async {
        print('${getdata}');

        bool error = getdata["error"];
        String? msge = getdata["message"];
        print('${error}');
        if (!error) {
          var finalresult = GetUserData.fromJson(getdata);
          setState(() {
            getUserData = finalresult;
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

  QrDataModel? qrDataModel;
  Future<void> ScannqrCodeApi(String scanid) async {
    print('get qrdata api');
    print('${scanid}');
    print('${useriddd}');

    var headers = {
      'Cookie': 'ci_session=f86367d664b412351a587dfc1b283720d4fa9666'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ConstScreen.baseUrl}get_qr/${scanid}'));
    request.fields.addAll({'user_id': useriddd.toString()});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalresult1 = jsonDecode(result);
      if (finalresult1['error'] == false) {
        var finalresult = QrDataModel.fromJson(jsonDecode(result));
        setState(() {
          qrDataModel = finalresult;
          print('===========getqr  data  success');
          Fluttertoast.showToast(msg: finalresult1['massage']);
        });
      }
    } else {
      print(response.reasonPhrase);
    }
  }
}

class ScanPay extends StatefulWidget {
  const ScanPay({Key? key}) : super(key: key);

  @override
  State<ScanPay> createState() => _ScanPayState();
}

class _ScanPayState extends State<ScanPay> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller ;

  @override
  void initState() {
    super.initState();
    getuserId();
    _onQRViewCreated;


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primery,
      body: Column(
        children: <Widget>[
          SizedBox(height: 200,),
          Container(
            padding: EdgeInsets.all(10),
            width: 326,
            height: 326,
            decoration: BoxDecoration(
                color: AppColors.primery,
                border: Border.all(color: AppColors.primery),
                borderRadius: BorderRadius.circular(10)
            ),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: () {

              },
              child: Container(

                height: 45,
                width: MediaQuery.of(context).size.width-150,

              ),
            ),
          ),

        ],
      ),
    );
  }

  _onQRViewCreated( QRViewController controller) {

    this.controller = controller;
    controller.resumeCamera();
    controller.scannedDataStream.listen((scanData) async {
      setState(() {
        result = scanData;
      });
      if(result != null){
        await ScannqrCodeApi(result!.code.toString());
        controller.dispose();
      }
      else{
        Fluttertoast.showToast(msg: 'Please Again Scan QR Code');
        Navigator.pop(context);

      }

    });

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  var useriddd;

  Future<void> getuserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    useriddd = prefs.getString('userId');
    print(
        'use id in scan screen-=========================${useriddd.runtimeType}');
    print('user id in scan screen-=========================${useriddd}');
  }

  QrDataModel? qrDataModel;
  Future<void> ScannqrCodeApi(String scanid) async {
    var headers = {
      'Cookie': 'ci_session=f86367d664b412351a587dfc1b283720d4fa9666'
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${ConstScreen.baseUrl}get_qr/${scanid}'));
    request.fields.addAll({'user_id': useriddd.toString()});
    print('${request.fields}');
    print('${request.url}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var finalresult1 = jsonDecode(result);
      if (finalresult1['error'] == false) {
        var finalresult = QrDataModel.fromJson(jsonDecode(result));
        setState(() {
          qrDataModel = finalresult;
          Fluttertoast.showToast(msg: 'QR Successfully Scanned');
        });

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerHistory(),
              ));

      }
    } else {
      print(response.reasonPhrase);
    }
  }
}