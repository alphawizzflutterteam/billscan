import 'package:billscan/Screens/Auth%20Screen/signUpScreen.dart';
import 'package:billscan/Screens/Auth%20Screen/verifieOtpScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Api Services/allApiEndPoint.dart';
import '../../Custom Widget/costomTextfield.dart';
import '../../Helper/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Image.asset(
                              'assets/images/login.png',
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
                      top: MediaQuery.of(context).size.height/3,
                      left: 20,
                      right: 20,
                      child: Card(
                        elevation: 2,
                        color: AppColors.SigninCardBackgroundColor,
                        child: Container(
                          height: 300,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Form(
                              key: _formKey,
                              child: Column(children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.primery),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  maxLength: 10,
                                  keyboardType: TextInputType.number,
                                  controller: loginController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.call,
                                      color: AppColors.gray,
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey)),
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
                                  height: 20,
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        selectt=true;
                                      });
                                      loginApi();
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.primery,
                                        borderRadius: BorderRadius.circular(5)),
                                    child:  Center(
                                      child:
                                      selectt==false?
                                      Text(
                                        'Send OTP',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: AppColors
                                                .SplashBackgroundColor),
                                      ):

                                      Text(
                                      'Sending...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: AppColors
                                              .SplashBackgroundColor),
                                    ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: MediaQuery
                          .of(context)
                          .size
                          .height / 1.1,
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 4,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (
                                          context) => const SignupScreen(),
                                    ));
                              },
                              child: const Text(
                                  "Don't have an account? Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: AppColors.SplashBackgroundColor,
                                  ))),
                        ],
                      ))
                ],
              ),
            )));
  }

  bool selectt =false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController loginController = TextEditingController();

void loginApi(){
  var data = {
    'mobile': loginController.text.toString(),

  };


  apiBaseHelper.postAPICall(Uri.parse(ApiService.UserLoginApiUrl),data).then(
        (getdata) async {
          print('login======');
      bool error = getdata["error"];
      String? msge = getdata["message"];
      String? mobileNumber=getdata["mobile"];
int? otp=getdata["otp"];

      if (!error) {
        setState(() {
          selectt=false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  VerifieScreen(otp: otp.toString(),
                      mobile:mobileNumber
                          ),
            ));

      } else {

        setState(() {
          selectt=false;
        });
        Fluttertoast.showToast(
            msg: '${msge}',

        );
      }
    },
    onError: (error) {

    },


  );


}




}
