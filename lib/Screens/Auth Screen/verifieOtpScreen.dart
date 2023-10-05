import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Api Services/allApiEndPoint.dart';
import '../../Custom Widget/customAppbar.dart';
import '../../Helper/app_colors.dart';
import '../homepage/homeScreen.dart';

class VerifieScreen extends StatefulWidget {
  String? mobile;
  String? otp;
  VerifieScreen({Key? key, this.mobile, this.otp}) : super(key: key);

  @override
  State<VerifieScreen> createState() => _VerifieScreenState();
}

class _VerifieScreenState extends State<VerifieScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppbar(titlee: 'Verification')),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Code has sent to',
                  style: TextStyle(fontSize: 13, color: AppColors.blackTemp),
                ),
              ],
            ),
            Text(
              '+' + '${widget.mobile}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColors.blackTemp),
            ),

                Text(
                  'OTP : ' + '${widget.otp}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: AppColors.blackTemp),
                ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(color: AppColors.gray),
                textFieldAlignment: MainAxisAlignment.spaceEvenly,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);

                  setState(() {
                    otpInput=pin;
                    print(otpInput);
                  });
                },
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Haven't received the verification code?",
              style: TextStyle(fontSize: 13, color: AppColors.gray),
            ),
            const Text(
              "Resend",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: AppColors.blackTemp),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {

                if(otpInput==widget.otp)
                  {

                    verifieOtpApi();
                    setState(() {
                      selectt=true;
                    });
                  }
                else{

                  Fluttertoast.showToast(msg: 'Please Enter Correct Otp');
                }
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: AppColors.primery,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child:
                  selectt==false?
                  Text(
                    'Verify',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.SplashBackgroundColor),
                  ):
                  Text(
                    'Waiting...',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: AppColors.SplashBackgroundColor),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  OtpFieldController otpController = OtpFieldController();
  var otpInput;
  bool selectt =false;


  void verifieOtpApi(){
    var data = {
      'mobile':widget.mobile.toString(),
      'otp':otpInput.toString(),

    };


    apiBaseHelper.postAPICall(Uri.parse(ApiService.verifieOtpApiUrl),data).then(
          (getdata) async {
        bool error = getdata["error"];
        String? msge = getdata["message"];
        String? idd = getdata['data'][0]["id"];
print('user id ============${idd}');
print('${error}');
        if (!error) {
          setState(() {
            selectt=false;
          });
         setpreferencee(idd??'');

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
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

  Future<void> setpreferencee(String id)
  async {
         final SharedPreferences prefs = await SharedPreferences.getInstance();
         await prefs.setString('userId', id.toString());


  }


}
