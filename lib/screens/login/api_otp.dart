import 'package:dio/dio.dart';

Future<Response?> otpGet({final String? mobilenumber}) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
      'https://bijakdevelopment.com/account/create_otp',
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
    return e.response!.data;
  }
  return null;
}

Future<Response?> valiOtp(
    {final String? mobilenumber, final String? otp}) async {
  try {
    Dio dio = Dio();
    Response responsevalidate = await dio.post(
      'https://devservices.bijak.biz/authentication/v1/oauth/token',
      options: Options(
        headers: {
          "Authorization": "Basic YWRtaW4xOnBhc3N3b3JkMQ==",
          "api_key": "da2-pjnemvckonaq7cvilwya2h4bq4",
          "user_id": "",
          "role": "la",
          "is-farmer": false,
          "platform": "android",
          "version": "2.5.7",
          "v_code": 7000,
          "fcm":
              "fPq_HUtOQoqNsAm_RM4WsC:APA91bELyP8tLsuPWeNsfilzKYEpqWDA95SPe_Tu0MZoxv-juPF6Ut-7ZNb6uEiDqNue37S9_BlN6jLtsKhnKMPwvNQNrF0hJWPGxwElSLi-Lnwz0FmNtbuVaOsD8yTj1YQvfPtL2Vho",
          "apns": "",
          "device-id": "2839a5606616a291",
          "lang": "hi"
        },
      ),
      data: {
        "mobile_number": mobilenumber,
        "otp": otp,
        "device_id": "2839a5606616a291",
        "fcm_id":
            "fPq_HUtOQoqNsAm_RM4WsC:APA91bELyP8tLsuPWeNsfilzKYEpqWDA95SPe_Tu0MZoxv-juPF6Ut-7ZNb6uEiDqNue37S9_BlN6jLtsKhnKMPwvNQNrF0hJWPGxwElSLi-Lnwz0FmNtbuVaOsD8yTj1YQvfPtL2Vho",
        "params": {"lang": "hi", "v_code": 7000, "version": "2.5.7"}
      },
    );

    return responsevalidate.data;
  } on DioError catch (e) {
    return e.response!.data;
  }

  //IMPLEMENT USER LOGIN
}
