class AddressModel {
  int? addressId;
  String? addressName;
  int? addressUser;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressId,
      this.addressName,
      this.addressUser,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressName = json['address_name'];
    addressUser = json['address_user'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_name'] = this.addressName;
    data['address_user'] = this.addressUser;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}
