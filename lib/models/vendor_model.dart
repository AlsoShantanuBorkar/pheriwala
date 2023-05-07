import 'package:isar/isar.dart';

part 'vendor_model.g.dart';

@collection
class VendorModel {
  Id vendorID = Isar.autoIncrement;

  int? id;
  String? vendorcontact;
  String? vendorname;
  String? shopname;
  String? location;
  String? latitude;
  String? longitude;
  int? distancefromuser;

  VendorModel(
      {this.id,
      this.vendorcontact,
      this.vendorname,
      this.shopname,
      this.location,
      this.latitude,
      this.longitude,
      this.distancefromuser});

  VendorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vendorcontact = json['vendorcontact'];
    vendorname = json['vendorname'] ?? json['vendorusername'];
    shopname = json['shopname'];
    location = json['location'];
    latitude = json['latitude'].toString();
    longitude = json['longitude'].toString();
    distancefromuser = json['distancefromuser'] != null
        ? (json['distancefromuser'] as double).round()
        : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vendorcontact'] = vendorcontact;
    data['vendorname'] = vendorname;
    data['shopname'] = shopname;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['distancefromuser'] = distancefromuser;
    return data;
  }
}
