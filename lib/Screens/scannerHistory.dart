import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api Services/allApiEndPoint.dart';
import '../Custom Widget/customAppbar.dart';
import '../Helper/app_colors.dart';
import '../Model/getScanHistoryModel.dart';

class ScannerHistory extends StatefulWidget {
  const ScannerHistory({Key? key}) : super(key: key);

  @override
  State<ScannerHistory> createState() => _ScannerHistoryState();

}

class _ScannerHistoryState extends State<ScannerHistory> {

  @override
  void initState() {
    // TODO: implement initState

    gettimer();

  }

  void gettimer(){


    Future.delayed(Duration(seconds: 4),(){
      getuserId();

    });
  }

  @override
  Widget build(BuildContext context) {
    return

      SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppbar(titlee: 'Scan History')),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child:

        scannHistory?.data==null?Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: CircularProgressIndicator(color: AppColors.primery,),),
        ):

        scannHistory!.data.isEmpty?
        Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text('No Data Found',style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.primery,fontSize: 20),),),
        ):


        ListView.builder(
          itemCount:  scannHistory!.data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 23, right: 23, bottom: 13),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Group 72515.png'),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [



                            Row(
                              children: [

                                Text(
                                  'Invoice Number : ${scannHistory!.data[index].invoiceNumber}',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blackTemp),
                                ),

                              ],
                            ),
                            Row(
                              children:[
                                Text(
                                  'Created At : ${DateFormat('yyyy-MM-dd').format(scannHistory!.data[index].createdAt)}',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blackTemp),
                                ),
                              ],
                            ),
                            Row(
                              children:[
                                Text(
                                  'Updated At : ${DateFormat('yyyy-MM-dd').format(scannHistory!.data[index].updatedAt)}',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blackTemp),
                                ),
                              ],
                            ),

                            Row(
                              children:[
                                Text(
                                  'Qr Id : ${scannHistory!.data[index].qrId}',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blackTemp),
                                ),
                              ],
                            ),

                            Row(
                              children:[
                                // Text(
                                //   'Qr generate Date : ${scannHistory!.data[index].generatedDate}',
                                //   style: TextStyle(
                                //       fontSize: 12, color: AppColors.blackTemp),
                                // ),
                                Text(
                                  'Qr generate Date : ${DateFormat('yyyy-MM-dd').format(scannHistory!.data[index].generatedDate)}',
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blackTemp),
                                ),
                              ],
                            ),
                          ]),

                      Container(height: 100,width: 100,

                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),image: DecorationImage(image: NetworkImage('${scannHistory!.data[index].qr}'))),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));


  }



  Future<void> getuserId() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var useriddd = prefs.getString('userId');
    print('use id in home screen-=========================${useriddd.runtimeType}');
    print('user id in home screen-=========================${useriddd}');
    getscanHistoryApi(useriddd??'');

  }

  ScannHistory?scannHistory;
  void getscanHistoryApi(String userId){

    var data = {
      'user_id':userId.toString()
    };


    apiBaseHelper.postAPICall(Uri.parse(ApiService.scannerHistoryApiUrl),data).then(
          (getdata) async {
        bool error = getdata["error"];
        String? msge = getdata["message"];
        print('${error}');
        // if (!error) {
         var finalresult=ScannHistory.fromJson(getdata);
          setState(() {
setState(() {
  scannHistory=finalresult;
});
          });

        //
        // } else {
        //
        //
        //   Fluttertoast.showToast(
        //     msg: '${msge}',
        //
        //   );
       // }
      },
      onError: (error) {

      },


    );


  }

}

