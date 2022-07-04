class GenealogyModel {
  int? status;
  String? message;
  Data? data;

  GenealogyModel({this.status, this.message, this.data});

  GenealogyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? address;
  String? story;
  MemberDefault? memberDefault;

  Data({this.id, this.name, this.address, this.story, this.memberDefault});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    story = json['story'];
    memberDefault = json['member_default'] != null
        ? new MemberDefault.fromJson(json['member_default'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['story'] = this.story;
    if (this.memberDefault != null) {
      data['member_default'] = this.memberDefault!.toJson();
    }
    return data;
  }
}

class MemberDefault {
  int? familyAnnalId;
  String? fullname;
  String? nickname;
  String? birthday;
  String? deathday;
  String? graveAddress;

  MemberDefault(
      {this.familyAnnalId,
      this.fullname,
      this.nickname,
      this.birthday,
      this.deathday,
      this.graveAddress});

  MemberDefault.fromJson(Map<String, dynamic> json) {
    familyAnnalId = json['family_annal_id'];
    fullname = json['fullname'];
    nickname = json['nickname'];
    birthday = json['birthday'];
    deathday = json['deathday'];
    graveAddress = json['grave_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['family_annal_id'] = this.familyAnnalId;
    data['fullname'] = this.fullname;
    data['nickname'] = this.nickname;
    data['birthday'] = this.birthday;
    data['deathday'] = this.deathday;
    data['grave_address'] = this.graveAddress;
    return data;
  }
}
