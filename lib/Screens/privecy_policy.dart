import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Api Services/allApiEndPoint.dart';
import '../Custom Widget/customAppbar.dart';
import '../Helper/app_colors.dart';
import '../Model/getSetting Model.dart';
import 'package:http/http.dart' as http;

class Privecy_Policy extends StatefulWidget {
  const Privecy_Policy({Key? key}) : super(key: key);

  @override
  State<Privecy_Policy> createState() => _Privecy_PolicyState();
}

class _Privecy_PolicyState extends State<Privecy_Policy> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTermconditionApi();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppbar(titlee: 'Privacy Policy')),

      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children:
          [

            getsettingModel==null?Container(

              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Center(child: CircularProgressIndicator(color: AppColors.primery,),),
            ):


            Html(data: "${getsettingModel?.data.privacyPolicy.first}"),


          ]),
        ),
      ),
    ));
  }
  GetsettingModel?getsettingModel;


  Future<void> getTermconditionApi() async {
    var headers = {
      'Cookie': 'ci_session=2f78742ec5f2ef7842360abb768240939bdb4d5a'
    };
    var request = http.Request('POST', Uri.parse(ApiService.getSettingApiUrl));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var result =await response.stream.bytesToString();
      var finalresult1=jsonDecode(result);
      if(finalresult1['error']==false){

        var finalresult =GetsettingModel.fromJson(jsonDecode(result));
        setState(() {
          getsettingModel=finalresult;
        });

      }
    }
    else {
      print(response.reasonPhrase);
    }


  }



}
