
import '../Helper/constant.dart';
import 'apiFunction.dart';

class ApiService {
  static const String UserregistrationApiUrl = "${ConstScreen.baseUrl}register";
  static const String UserLoginApiUrl = "${ConstScreen.baseUrl}send_otp_staff";
  static const String verifieOtpApiUrl = "${ConstScreen.baseUrl}verify_otp_staff";
  static const String getUserDataApiUrl = "${ConstScreen.baseUrl}profile";
  static const String scannerHistoryApiUrl = "${ConstScreen.baseUrl}get_scanned_qrs";
  static const String getSettingApiUrl = "${ConstScreen.baseUrl}get_settings";

}
// global api constructor
ApiBaseHelper apiBaseHelper=ApiBaseHelper();