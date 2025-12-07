class AddressModel {
  AddressModel({
    this.address,
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.phone,
    this.v,
  });

  AddressModel.fromJson(dynamic json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    phone = json['phone'];
    v = json['__v'];
  }
  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;
  Name? name;
  String? phone;
  int? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['id'] = id;
    map['email'] = email;
    map['username'] = username;
    map['password'] = password;
    if (name != null) {
      map['name'] = name?.toJson();
    }
    map['phone'] = phone;
    map['__v'] = v;
    return map;
  }
}

class Name {
  Name({
    this.firstname,
    this.lastname,
  });

  Name.fromJson(dynamic json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
  }
  String? firstname;
  String? lastname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    return map;
  }
}

class Address {
  Address({
    this.geolocation,
    this.city,
    this.street,
    this.number,
    this.zipcode,
  });

  Address.fromJson(dynamic json) {
    geolocation = json['geolocation'] != null
        ? Geolocation.fromJson(json['geolocation'])
        : null;
    city = json['city'];
    street = json['street'];
    number = json['number'];
    zipcode = json['zipcode'];
  }
  Geolocation? geolocation;
  String? city;
  String? street;
  int? number;
  String? zipcode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (geolocation != null) {
      map['geolocation'] = geolocation?.toJson();
    }
    map['city'] = city;
    map['street'] = street;
    map['number'] = number;
    map['zipcode'] = zipcode;
    return map;
  }
}

class Geolocation {
  Geolocation({
    this.lat,
    this.long,
  });

  Geolocation.fromJson(dynamic json) {
    lat = json['lat'];
    long = json['long'];
  }
  String? lat;
  String? long;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = lat;
    map['long'] = long;
    return map;
  }
}
