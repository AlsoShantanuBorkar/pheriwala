import 'dart:convert';
import 'dart:developer';

import 'package:be_project/apis/api_routes.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<Map<String, dynamic>> authenticateUser(Map data,
      {bool isLogin = false}) async {
    Map<String, dynamic> res = {};

    try {
      http.Response response = await http.post(
          Uri.parse("$userRoute${isLogin ? "" : "register"}"),
          body: jsonEncode(data),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          });
      if (response.statusCode == 200) {
        if (isLogin) {
          Map<String, dynamic> decodedResponse =
              jsonDecode(response.body) as Map<String, dynamic>;
          res = decodedResponse;

          log(res.toString());
          return res;
        } else {
          int decodedResponse = jsonDecode(response.body) as int;
          res["id"] = decodedResponse;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  Future<void> updatePassword(Map<String, dynamic> data) async {
    await http.put(Uri.parse("$userRoute /updatepassword"), body: data);
  }

  Future<List<VendorModel>> getVendors(
      int userID, Map<String, dynamic> data) async {
    List<VendorModel> list = [];

    http.Response response = await http.post(
        Uri.parse("${userRoute}getfilteredvendors/$userID"),
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });
    // response.statusCode);
    if (response.statusCode == 200) {
      List decodedResponse = jsonDecode(response.body) as List;
      log(decodedResponse.toString());
      if (decodedResponse.isNotEmpty) {
        for (var element in decodedResponse) {
          list.add(VendorModel.fromJson(element));
        }
      }
    }
    return list;
  }

  Future<void> updateLocations(int userID, Map<String, dynamic> data) async {
    await http.put(Uri.parse("${userRoute}updatelocation/$userID"),
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });
    log("$userRoute/updatelocation/$userID");
    log(jsonEncode(data));
  }
}
