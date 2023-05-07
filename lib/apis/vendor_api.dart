import 'dart:convert';
import 'dart:developer';

import 'package:be_project/apis/api_routes.dart';
import 'package:be_project/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

class VendorApi {
  Future<Map<String, dynamic>> authenticateUser(Map data,
      {bool isLogin = false}) async {
    Map<String, dynamic> res = {};

    try {
      http.Response response = await http.post(
          Uri.parse("$vendorRoute${isLogin ? "" : "register"}"),
          body: jsonEncode(data),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          });
      log(jsonEncode(data));

      if (response.statusCode == 200) {
        if (isLogin) {
          Map<String, dynamic> decodedResponse =
              jsonDecode(response.body) as Map<String, dynamic>;
          res = decodedResponse;
          log("hello");
          log(res.toString());
          return res;
        } else {
          int decodedResponse = jsonDecode(response.body) as int;
          res["id"] = decodedResponse;
        }
      }
      return res;
    } catch (e) {
      log(e.toString());
    }
    return res;
  }

  Future<void> updatePassword(Map<String, dynamic> data) async {
    await http.put(Uri.parse("${vendorRoute}updatepassword"), body: data);
  }

  Future<List<ProductModel>> getProducts(int vendorID) async {
    List<ProductModel> list = [];
    http.Response response =
        await http.get(Uri.parse("${vendorRoute}getproducts/$vendorID"));
    log("${vendorRoute}getproducts/$vendorID");

    if (response.statusCode == 200) {
      List decodedResponse = jsonDecode(response.body) as List;
      if (decodedResponse.isNotEmpty) {
        for (var element in decodedResponse) {
          list.add(ProductModel.fromMap(element));
        }
      }
    }
    return list;
  }

  Future<void> deleteProduct(int productID) async {
    await http.delete(Uri.parse("${vendorRoute}deleteProduct/$productID"));
  }

  Future<void> updateLocations(int vendorID, Map<String, dynamic> data) async {
    await http.put(Uri.parse("${vendorRoute}updatelocation/$vendorID"),
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });
  }

  Future<void> notifyNearby(int vendorID, Map<String, dynamic> data) async {
    await http.post(Uri.parse("${vendorRoute}notifynearby/$vendorID"),
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });
  }

  Future<Map<String, dynamic>> addProducts(
      int vendorID, Map<String, dynamic> data) async {
    Map<String, dynamic> map = {};

    http.Response response = await http.post(
      Uri.parse("${vendorRoute}addproduct/$vendorID"),
      body: jsonEncode(data),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedResponse =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (decodedResponse.isNotEmpty) {
        map = decodedResponse;
      }
    }

    return map;
  }

  Future<void> uploadImage(XFile file, String username) async {
    String fileName = file.path.split('/').last;

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'https://streetvendor-production.up.railway.app/vendor/upload/$username'),
    );

    request.files.add(await http.MultipartFile.fromPath(
      'image',
      file.path,
      contentType: MediaType(
          'image', 'png'), // Adjust the content type as per your requirement
      filename: fileName,
    ));
    log(request.url.toString());
    var response = await request.send();
    if (response.statusCode == 200) {
      log("SUCCESS");
    } else {
      log("FAILED");
    }
  }

  Future<void> updateProduct(int productID, Map<String, dynamic> data) async {
    await http.put(
        Uri.parse(
          "${vendorRoute}update/$productID",
        ),
        body: jsonEncode(data),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        });
  }
}
