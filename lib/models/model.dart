class model {
  List<Data>? data;

  model({this.data});

  model.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? slug;
  String? countryCode;
  String? title;
  Image? image;
  List<Operators>? operators;
  int? iV;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.sId,
      this.slug,
      this.countryCode,
      this.title,
      this.image,
      this.operators,
      this.iV,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    countryCode = json['country_code'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['operators'] != null) {
      operators = <Operators>[];
      json['operators'].forEach((v) {
        operators!.add(new Operators.fromJson(v));
      });
    }
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['slug'] = this.slug;
    data['country_code'] = this.countryCode;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    if (this.operators != null) {
      data['operators'] = this.operators!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Image {
  int? width;
  int? height;
  String? url;

  Image({this.width, this.height, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    return data;
  }
}

class Operators {
  int? id;
  String? style;
  String? gradientStart;
  String? gradientEnd;
  String? type;
  bool? isPrepaid;
  String? title;
  String? esimType;
  String? warning;
  String? apnType;
  String? apnValue;
  bool? isRoaming;
  List<String>? info;
  Image? image;
  String? planType;
  String? activationPolicy;
  bool? isKycVerify;
  bool? rechargeability;
  String? otherInfo;
  List<Coverages>? coverages;
  List<Packages>? packages;
  List<Countries>? countries;

  Operators(
      {this.id,
      this.style,
      this.gradientStart,
      this.gradientEnd,
      this.type,
      this.isPrepaid,
      this.title,
      this.esimType,
      this.warning,
      this.apnType,
      this.apnValue,
      this.isRoaming,
      this.info,
      this.image,
      this.planType,
      this.activationPolicy,
      this.isKycVerify,
      this.rechargeability,
      this.otherInfo,
      this.coverages,
      this.packages,
      this.countries});

  Operators.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    style = json['style'];
    gradientStart = json['gradient_start'];
    gradientEnd = json['gradient_end'];
    type = json['type'];
    isPrepaid = json['is_prepaid'];
    title = json['title'];
    esimType = json['esim_type'];
    warning = json['warning'];
    apnType = json['apn_type'];
    apnValue = json['apn_value'];
    isRoaming = json['is_roaming'];
    info = (json['info'] as List?)?.cast<String>();
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    planType = json['plan_type'];
    activationPolicy = json['activation_policy'];
    isKycVerify = json['is_kyc_verify'];
    rechargeability = json['rechargeability'];
    otherInfo = json['other_info'];
    if (json['coverages'] != null) {
      coverages = <Coverages>[];
      json['coverages'].forEach((v) {
        coverages!.add(new Coverages.fromJson(v));
      });
    }
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(new Packages.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['style'] = this.style;
    data['gradient_start'] = this.gradientStart;
    data['gradient_end'] = this.gradientEnd;
    data['type'] = this.type;
    data['is_prepaid'] = this.isPrepaid;
    data['title'] = this.title;
    data['esim_type'] = this.esimType;
    data['warning'] = this.warning;
    data['apn_type'] = this.apnType;
    data['apn_value'] = this.apnValue;
    data['is_roaming'] = this.isRoaming;
    data['info'] = this.info;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['plan_type'] = this.planType;
    data['activation_policy'] = this.activationPolicy;
    data['is_kyc_verify'] = this.isKycVerify;
    data['rechargeability'] = this.rechargeability;
    data['other_info'] = this.otherInfo;
    if (this.coverages != null) {
      data['coverages'] = this.coverages!.map((v) => v.toJson()).toList();
    }
    if (this.packages != null) {
      data['packages'] = this.packages!.map((v) => v.toJson()).toList();
    }
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coverages {
  String? name;
  List<Networks>? networks;

  Coverages({this.name, this.networks});

  Coverages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['networks'] != null) {
      networks = <Networks>[];
      json['networks'].forEach((v) {
        networks!.add(new Networks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.networks != null) {
      data['networks'] = this.networks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Networks {
  String? name;
  List<String>? types;

  Networks({this.name, this.types});

  Networks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    types = json['types'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['types'] = this.types;
    return data;
  }
}

class Packages {
  String? id;
  String? type;
  num? price;
  int? amount;
  int? day;
  bool? isUnlimited;
  String? title;
  String? data;
  String? shortInfo;

  Packages(
      {this.id,
      this.type,
      this.price,
      this.amount,
      this.day,
      this.isUnlimited,
      this.title,
      this.data,
      this.shortInfo});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    amount = json['amount'];
    day = json['day'];
    isUnlimited = json['is_unlimited'];
    title = json['title'];
    data = json['data'];
    shortInfo = json['short_info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['price'] = this.price;
    data['amount'] = this.amount;
    data['day'] = this.day;
    data['is_unlimited'] = this.isUnlimited;
    data['title'] = this.title;
    data['data'] = this.data;
    data['short_info'] = this.shortInfo;
    return data;
  }
}

class Countries {
  String? countryCode;
  String? title;
  Image? image;

  Countries({this.countryCode, this.title, this.image});

  Countries.fromJson(Map<String, dynamic> json) {
    countryCode = json['country_code'];
    title = json['title'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_code'] = this.countryCode;
    data['title'] = this.title;
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    return data;
  }
}
