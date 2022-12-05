import 'package:bitchat/api/api_urls.dart';
import "package:dio/dio.dart";

Future otpGet({final String? mobilenumber}) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
      getOtpUrl,
      options: Options(
        headers: {},
      ),
      data: {
        "mobile_number": mobilenumber,
        "is_internal": false,
        "referral_link": "",
        "sign": "xrhu/koUJWc",
        "params": {"lang": "hi"}
      },
    );
    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    }
  } on DioError catch (e) {
    return e.response?.data;
  }
  return null;
}

Future valiOtp({final String? mobilenumber, final String? otp}) async {
  var params = {"lang": "hi", "v_code": 7000, "version": "2.5.7"};
  try {
    Dio dio = Dio();
    Response responsevalidate = await dio.post(
      verifyOtpUrl,
      options: Options(
        headers: {
          "Authorization": "Basic YWRtaW4xOnBhc3N3b3JkMQ==",
          "api_key": "da2-pjnemvckonaq7cvilwya2h4bq4",
          "user_id": "null",
          "role": "la",
          "is-farmer": false,
          "platform": "android",
          "version": "2.5.7",
          "v_code": 7000,
          "fcm":
              "fPq_HUtOQoqNsAm_RM4WsC:APA91bELyP8tLsuPWeNsfilzKYEpqWDA95SPe_Tu0MZoxv-juPF6Ut-7ZNb6uEiDqNue37S9_BlN6jLtsKhnKMPwvNQNrF0hJWPGxwElSLi-Lnwz0FmNtbuVaOsD8yTj1YQvfPtL2Vho",
          "apns": "null",
          "device-id": "2839a5606616a291",
          "lang": "hi"
        },
      ),
      queryParameters: params,
      data: {
        "mobile_number": mobilenumber,
        "otp": otp,
        "device_id": "2839a5606616a291",
        "fcm_id":
            "fPq_HUtOQoqNsAm_RM4WsC:APA91bELyP8tLsuPWeNsfilzKYEpqWDA95SPe_Tu0MZoxv-juPF6Ut-7ZNb6uEiDqNue37S9_BlN6jLtsKhnKMPwvNQNrF0hJWPGxwElSLi-Lnwz0FmNtbuVaOsD8yTj1YQvfPtL2Vho",
      },
    );
    return responsevalidate.data;
  } on DioError catch (e) {
    return e.response!.data;
  }
}

Future homeApi(
    {final String? mobilenumber,
    final String? userid,
    final String? authtoken}) async {
  try {
    Dio dio = Dio();
    Response responsehome = await dio.get(homeConfigDashboardApiUrl,
        options: Options(headers: {
          "authorization": "Token 91e2b2dc0b2ea10296c40f22be6838cf68eb0380",
          "api_key": "da2-pjnemvckonaq7cvilwya2h4bq4",
          "user_id": "1e792b2f-08ad-45a4-8c84-1bb802c0ee86",
          "role": "ca",
          "is-farmer": "false",
          "platform": "android",
          "version": "2.5.7",
          "v_code": "7000",
          "fcm":
              "fPq_HUtOQoqNsAm_RM4WsC:APA91bELyP8tLsuPWeNsfilzKYEpqWDA95SPe_Tu0MZoxv-juPF6Ut-7ZNb6uEiDqNue37S9_BlN6jLtsKhnKMPwvNQNrF0hJWPGxwElSLi-Lnwz0FmNtbuVaOsD8yTj1YQvfPtL2Vho",
          "apns": "null",
          "device-id": "2839a5606616a291",
          "device-name": "STK-L22",
          "lang": "en",
          "package-name": "com.bedwal.bijak.mvp.test",
          "mobile": "9173524485",
          "os-version": "29",
          "build-type": "debug",
          "flavor": "Flavor.DEVELOPMENT",
          "device-resolution": "3.0",
          "device-size": "Size(360.0, 780.0)",
          "region": "defaul"
        }));
    // print(responsehome.data);
    return responsehome.data;
  } on DioError catch (e) {
    return e.response!.data;
  }
}
