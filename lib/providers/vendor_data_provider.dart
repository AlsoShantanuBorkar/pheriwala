import 'dart:developer';

import 'package:be_project/apis/vendor_api.dart';
import 'package:be_project/models/product_model.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorDataProvider extends ChangeNotifier {
  final VendorApi vendorApi;
  final Isar isarInstance;
  final SharedPreferences sharedPreferencesInstance;

  List<ProductModel> products = [];
  VendorDataProvider(
      this.vendorApi, this.isarInstance, this.sharedPreferencesInstance) {
    checkLocalStorage();
  }

  VendorModel? _vendorModel;
  VendorModel get vendorModel => _vendorModel!;

  late int _sharedPrefId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedin = false;
  bool get isLoggedin => _isLoggedin;

  Future<void> checkLocalStorage() async {
    _isLoading = true;
    notifyListeners();
    try {
      final SharedPreferences sharedPreferencesInstance =
          await SharedPreferences.getInstance();
      int? id = sharedPreferencesInstance.getInt('vendorAuthID');
      log(id.toString());
      if (id != null) {
        _sharedPrefId = id;

        VendorModel? temp = await isarInstance.vendorModels.get(_sharedPrefId);
        if (temp != null) {
          _vendorModel = temp;
          _isLoggedin = true;
        }
      }
    } catch (e) {
      log(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  void logout() async {
    _isLoading = true;
    notifyListeners();
    await isarInstance.writeTxn(
      silent: true,
      () async {
        await isarInstance.vendorModels.clear();
        sharedPreferencesInstance.remove("vendorAuthID");
      },
    );
    _vendorModel = null;
    _isLoggedin = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> notifyUsers() async {
    await vendorApi.notifyNearby(vendorModel.id!, {
      "title": "From ${vendorModel.vendorname}",
      "body": "Launched New Products",
    });
  }

  Future<void> updateLocation(Map<String, dynamic> data) async {
    await vendorApi.updateLocations(vendorModel.id!, data);
  }

  Future<void> authenticateUser(
      {required bool isLogin, required Map<String, dynamic> data}) async {
    _isLoading = true;
    notifyListeners();
    log("HERE");
    await vendorApi.authenticateUser(data, isLogin: isLogin).then(
      (value) async {
        log(value.toString());
        if (value.isNotEmpty) {
          if (isLogin) {
            _vendorModel = VendorModel.fromJson(value);
            _isLoggedin = true;
          } else if (!isLogin) {
            data.addAll(value);
            _vendorModel = VendorModel.fromJson(data);
            _isLoggedin = true;
          }
          await isarInstance.writeTxn(
            silent: true,
            () async {
              await isarInstance.vendorModels.clear();
              _sharedPrefId =
                  await isarInstance.vendorModels.put(_vendorModel!);
              await sharedPreferencesInstance.setInt(
                  'vendorAuthID', _sharedPrefId);
            },
          );
        }
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> uploadImage(XFile file) async {
    _isLoading = true;
    notifyListeners();
    await vendorApi.uploadImage(file, vendorModel.vendorname!);
    _isLoading = false;
    notifyListeners();
  }

  void addNewProduct({required String name, required int price}) async {
    _isLoading = true;
    notifyListeners();
    ProductModel pm = ProductModel.fromMap(
      await vendorApi.addProducts(
        vendorModel.id!,
        ProductModel(productName: name, price: price).toJson(),
      ),
    );
    products.add(pm);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> removeProduct({required String name}) async {
    _isLoading = true;
    notifyListeners();
    await vendorApi.deleteProduct(
        products[products.indexWhere((element) => element.productName == name)]
            .productId!);
    products.removeWhere((element) => element.productName == name);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getProducts(int vid) async {
    _isLoading = true;
    notifyListeners();
    products = await vendorApi.getProducts(vid);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateProduct(int id, Map<String, dynamic> data) async {
    _isLoading = true;
    notifyListeners();
    await vendorApi.updateProduct(vendorModel.id!, data);
    products[products.indexWhere((element) => element.productId == id)]
        .productName = data["productname"];
    products[products.indexWhere((element) => element.productId == id)].price =
        int.parse(data["price"]);
    _isLoading = false;
    notifyListeners();
  }
}
