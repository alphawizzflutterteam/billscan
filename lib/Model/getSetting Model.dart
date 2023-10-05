// To parse this JSON data, do
//
//     final getsettingModel = getsettingModelFromJson(jsonString);

import 'dart:convert';

GetsettingModel getsettingModelFromJson(String str) => GetsettingModel.fromJson(json.decode(str));

String getsettingModelToJson(GetsettingModel data) => json.encode(data.toJson());

class GetsettingModel {
  bool error;
  String message;
  Data data;

  GetsettingModel({
    required this.error,
    required this.message,
    required this.data,
  });

  factory GetsettingModel.fromJson(Map<String, dynamic> json) => GetsettingModel(
    error: json["error"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  List<String> logo;
  List<String> privacyPolicy;
  List<String> termsConditions;
  List<String> fcmServerKey;
  List<String> contactUs;
  List<String> aboutUs;
  List<String> currency;
  List<TimeSlotConfig> timeSlotConfig;
  List<String> userData;
  List<SystemSetting> systemSettings;
  List<dynamic> shippingPolicy;
  List<dynamic> returnPolicy;
  List<dynamic> tags;

  Data({
    required this.logo,
    required this.privacyPolicy,
    required this.termsConditions,
    required this.fcmServerKey,
    required this.contactUs,
    required this.aboutUs,
    required this.currency,
    required this.timeSlotConfig,
    required this.userData,
    required this.systemSettings,
    required this.shippingPolicy,
    required this.returnPolicy,
    required this.tags,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    logo: List<String>.from(json["logo"].map((x) => x)),
    privacyPolicy: List<String>.from(json["privacy_policy"].map((x) => x)),
    termsConditions: List<String>.from(json["terms_conditions"].map((x) => x)),
    fcmServerKey: List<String>.from(json["fcm_server_key"].map((x) => x)),
    contactUs: List<String>.from(json["contact_us"].map((x) => x)),
    aboutUs: List<String>.from(json["about_us"].map((x) => x)),
    currency: List<String>.from(json["currency"].map((x) => x)),
    timeSlotConfig: List<TimeSlotConfig>.from(json["time_slot_config"].map((x) => TimeSlotConfig.fromJson(x))),
    userData: List<String>.from(json["user_data"].map((x) => x)),
    systemSettings: List<SystemSetting>.from(json["system_settings"].map((x) => SystemSetting.fromJson(x))),
    shippingPolicy: List<dynamic>.from(json["shipping_policy"].map((x) => x)),
    returnPolicy: List<dynamic>.from(json["return_policy"].map((x) => x)),
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "logo": List<dynamic>.from(logo.map((x) => x)),
    "privacy_policy": List<dynamic>.from(privacyPolicy.map((x) => x)),
    "terms_conditions": List<dynamic>.from(termsConditions.map((x) => x)),
    "fcm_server_key": List<dynamic>.from(fcmServerKey.map((x) => x)),
    "contact_us": List<dynamic>.from(contactUs.map((x) => x)),
    "about_us": List<dynamic>.from(aboutUs.map((x) => x)),
    "currency": List<dynamic>.from(currency.map((x) => x)),
    "time_slot_config": List<dynamic>.from(timeSlotConfig.map((x) => x.toJson())),
    "user_data": List<dynamic>.from(userData.map((x) => x)),
    "system_settings": List<dynamic>.from(systemSettings.map((x) => x.toJson())),
    "shipping_policy": List<dynamic>.from(shippingPolicy.map((x) => x)),
    "return_policy": List<dynamic>.from(returnPolicy.map((x) => x)),
    "tags": List<dynamic>.from(tags.map((x) => x)),
  };
}

class SystemSetting {
  String systemConfigurations;
  String systemTimezoneGmt;
  String systemConfigurationsId;
  String appName;
  String supportNumber;
  String supportEmail;
  String currentVersion;
  String currentVersionIos;
  String isVersionSystemOn;
  String areaWiseDeliveryCharge;
  String currency;
  String deliveryCharge;
  String minAmount;
  String systemTimezone;
  String isReferEarnOn;
  String minReferEarnOrderAmount;
  String referEarnBonus;
  String referEarnMethod;
  String maxReferEarnAmount;
  String referEarnBonusTimes;
  String welcomeWalletBalanceOn;
  String walletBalanceAmount;
  String minimumCartAmt;
  String lowStockLimit;
  String maxItemsCart;
  String deliveryBoyBonusPercentage;
  String maxProductReturnDays;
  String isDeliveryBoyOtpSettingOn;
  String isSingleSellerOrder;
  String isCustomerAppUnderMaintenance;
  String inspectElement;
  String isSellerAppUnderMaintenance;
  String isDeliveryBoyAppUnderMaintenance;
  String messageForCustomerApp;
  String messageForSellerApp;
  String messageForDeliveryBoyApp;
  String cartBtnOnList;
  String expandProductImages;
  String taxName;
  String taxNumber;
  String companyName;
  String companyUrl;
  String supportedLocals;
  String decimalPoint;

  SystemSetting({
    required this.systemConfigurations,
    required this.systemTimezoneGmt,
    required this.systemConfigurationsId,
    required this.appName,
    required this.supportNumber,
    required this.supportEmail,
    required this.currentVersion,
    required this.currentVersionIos,
    required this.isVersionSystemOn,
    required this.areaWiseDeliveryCharge,
    required this.currency,
    required this.deliveryCharge,
    required this.minAmount,
    required this.systemTimezone,
    required this.isReferEarnOn,
    required this.minReferEarnOrderAmount,
    required this.referEarnBonus,
    required this.referEarnMethod,
    required this.maxReferEarnAmount,
    required this.referEarnBonusTimes,
    required this.welcomeWalletBalanceOn,
    required this.walletBalanceAmount,
    required this.minimumCartAmt,
    required this.lowStockLimit,
    required this.maxItemsCart,
    required this.deliveryBoyBonusPercentage,
    required this.maxProductReturnDays,
    required this.isDeliveryBoyOtpSettingOn,
    required this.isSingleSellerOrder,
    required this.isCustomerAppUnderMaintenance,
    required this.inspectElement,
    required this.isSellerAppUnderMaintenance,
    required this.isDeliveryBoyAppUnderMaintenance,
    required this.messageForCustomerApp,
    required this.messageForSellerApp,
    required this.messageForDeliveryBoyApp,
    required this.cartBtnOnList,
    required this.expandProductImages,
    required this.taxName,
    required this.taxNumber,
    required this.companyName,
    required this.companyUrl,
    required this.supportedLocals,
    required this.decimalPoint,
  });

  factory SystemSetting.fromJson(Map<String, dynamic> json) => SystemSetting(
    systemConfigurations: json["system_configurations"],
    systemTimezoneGmt: json["system_timezone_gmt"],
    systemConfigurationsId: json["system_configurations_id"],
    appName: json["app_name"],
    supportNumber: json["support_number"],
    supportEmail: json["support_email"],
    currentVersion: json["current_version"],
    currentVersionIos: json["current_version_ios"],
    isVersionSystemOn: json["is_version_system_on"],
    areaWiseDeliveryCharge: json["area_wise_delivery_charge"],
    currency: json["currency"],
    deliveryCharge: json["delivery_charge"],
    minAmount: json["min_amount"],
    systemTimezone: json["system_timezone"],
    isReferEarnOn: json["is_refer_earn_on"],
    minReferEarnOrderAmount: json["min_refer_earn_order_amount"],
    referEarnBonus: json["refer_earn_bonus"],
    referEarnMethod: json["refer_earn_method"],
    maxReferEarnAmount: json["max_refer_earn_amount"],
    referEarnBonusTimes: json["refer_earn_bonus_times"],
    welcomeWalletBalanceOn: json["welcome_wallet_balance_on"],
    walletBalanceAmount: json["wallet_balance_amount"],
    minimumCartAmt: json["minimum_cart_amt"],
    lowStockLimit: json["low_stock_limit"],
    maxItemsCart: json["max_items_cart"],
    deliveryBoyBonusPercentage: json["delivery_boy_bonus_percentage"],
    maxProductReturnDays: json["max_product_return_days"],
    isDeliveryBoyOtpSettingOn: json["is_delivery_boy_otp_setting_on"],
    isSingleSellerOrder: json["is_single_seller_order"],
    isCustomerAppUnderMaintenance: json["is_customer_app_under_maintenance"],
    inspectElement: json["inspect_element"],
    isSellerAppUnderMaintenance: json["is_seller_app_under_maintenance"],
    isDeliveryBoyAppUnderMaintenance: json["is_delivery_boy_app_under_maintenance"],
    messageForCustomerApp: json["message_for_customer_app"],
    messageForSellerApp: json["message_for_seller_app"],
    messageForDeliveryBoyApp: json["message_for_delivery_boy_app"],
    cartBtnOnList: json["cart_btn_on_list"],
    expandProductImages: json["expand_product_images"],
    taxName: json["tax_name"],
    taxNumber: json["tax_number"],
    companyName: json["company_name"],
    companyUrl: json["company_url"],
    supportedLocals: json["supported_locals"],
    decimalPoint: json["decimal_point"],
  );

  Map<String, dynamic> toJson() => {
    "system_configurations": systemConfigurations,
    "system_timezone_gmt": systemTimezoneGmt,
    "system_configurations_id": systemConfigurationsId,
    "app_name": appName,
    "support_number": supportNumber,
    "support_email": supportEmail,
    "current_version": currentVersion,
    "current_version_ios": currentVersionIos,
    "is_version_system_on": isVersionSystemOn,
    "area_wise_delivery_charge": areaWiseDeliveryCharge,
    "currency": currency,
    "delivery_charge": deliveryCharge,
    "min_amount": minAmount,
    "system_timezone": systemTimezone,
    "is_refer_earn_on": isReferEarnOn,
    "min_refer_earn_order_amount": minReferEarnOrderAmount,
    "refer_earn_bonus": referEarnBonus,
    "refer_earn_method": referEarnMethod,
    "max_refer_earn_amount": maxReferEarnAmount,
    "refer_earn_bonus_times": referEarnBonusTimes,
    "welcome_wallet_balance_on": welcomeWalletBalanceOn,
    "wallet_balance_amount": walletBalanceAmount,
    "minimum_cart_amt": minimumCartAmt,
    "low_stock_limit": lowStockLimit,
    "max_items_cart": maxItemsCart,
    "delivery_boy_bonus_percentage": deliveryBoyBonusPercentage,
    "max_product_return_days": maxProductReturnDays,
    "is_delivery_boy_otp_setting_on": isDeliveryBoyOtpSettingOn,
    "is_single_seller_order": isSingleSellerOrder,
    "is_customer_app_under_maintenance": isCustomerAppUnderMaintenance,
    "inspect_element": inspectElement,
    "is_seller_app_under_maintenance": isSellerAppUnderMaintenance,
    "is_delivery_boy_app_under_maintenance": isDeliveryBoyAppUnderMaintenance,
    "message_for_customer_app": messageForCustomerApp,
    "message_for_seller_app": messageForSellerApp,
    "message_for_delivery_boy_app": messageForDeliveryBoyApp,
    "cart_btn_on_list": cartBtnOnList,
    "expand_product_images": expandProductImages,
    "tax_name": taxName,
    "tax_number": taxNumber,
    "company_name": companyName,
    "company_url": companyUrl,
    "supported_locals": supportedLocals,
    "decimal_point": decimalPoint,
  };
}

class TimeSlotConfig {
  String timeSlotConfig;
  String isTimeSlotsEnabled;
  String deliveryStartsFrom;
  String allowedDays;

  TimeSlotConfig({
    required this.timeSlotConfig,
    required this.isTimeSlotsEnabled,
    required this.deliveryStartsFrom,
    required this.allowedDays,
  });

  factory TimeSlotConfig.fromJson(Map<String, dynamic> json) => TimeSlotConfig(
    timeSlotConfig: json["time_slot_config"],
    isTimeSlotsEnabled: json["is_time_slots_enabled"],
    deliveryStartsFrom: json["delivery_starts_from"],
    allowedDays: json["allowed_days"],
  );

  Map<String, dynamic> toJson() => {
    "time_slot_config": timeSlotConfig,
    "is_time_slots_enabled": isTimeSlotsEnabled,
    "delivery_starts_from": deliveryStartsFrom,
    "allowed_days": allowedDays,
  };
}
