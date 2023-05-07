import 'dart:developer';

import 'package:be_project/apis/user_api.dart';
import 'package:be_project/models/user_model.dart';
import 'package:be_project/models/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider extends ChangeNotifier {
  final UserApi userApi;
  final Isar isarInstance;
  final SharedPreferences sharedPreferencesInstance;

  List<VendorModel> vendors = [];
  UserDataProvider(
    this.userApi,
    this.isarInstance,
    this.sharedPreferencesInstance,
  ) {
    checkLocalStorage();
  }
  UserModel? _userModel;
  UserModel get userModel => _userModel!;

  late int _sharedPrefId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoggedin = false;
  bool get isLoggedin => _isLoggedin;

  Future<void> checkLocalStorage() async {
    log("Hey There");
    _isLoading = true;
    notifyListeners();
    try {
      final SharedPreferences sharedPreferencesInstance =
          await SharedPreferences.getInstance();
      int? id = sharedPreferencesInstance.getInt('userAuthID');
      if (id != null) {
        _sharedPrefId = id;

        UserModel? temp = await isarInstance.userModels.get(_sharedPrefId);
        if (temp != null) {
          _userModel = temp;
          _isLoggedin = true;

          await getVendors({"nearby": 0, "area": "", "shopname": ""});
        }
        log("In Here");
      }
    } catch (e) {
      log(e.toString());
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateLocation(Map<String, dynamic> data) async {
    await userApi.updateLocations(userModel.id!, data);
  }

  Future<void> authenticateUser(
      {bool isLogin = false, required Map<String, dynamic> data}) async {
    _isLoading = true;
    notifyListeners();

    await userApi.authenticateUser(data, isLogin: isLogin).then(
      (value) async {
        if (value["id"] != null) {
          _userModel = UserModel.fromJson(value);
          _isLoggedin = true;
          await isarInstance.writeTxn(
            silent: true,
            () async {
              await isarInstance.userModels.clear();
              _sharedPrefId = await isarInstance.userModels.put(_userModel!);
              await sharedPreferencesInstance.setInt(
                  'userAuthID', _sharedPrefId);
            },
          );
          await getVendors({"nearby": 0, "area": "", "shopname": ""});
        }
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void logout() async {
    _isLoading = true;
    notifyListeners();
    await isarInstance.writeTxn(
      silent: true,
      () async {
        await isarInstance.userModels.clear();
        sharedPreferencesInstance.remove("userAuthID");
      },
    );
    _userModel = null;
    _isLoggedin = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getVendors(Map<String, dynamic> data) async {
    _isLoading = true;
    notifyListeners();
    vendors = await userApi.getVendors(userModel.id!, data);
    _isLoading = false;
    notifyListeners();
  }
}
