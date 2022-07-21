// To parse this JSON data, do
//
//     final areaDetailModel = areaDetailModelFromJson(jsonString);

import 'dart:convert';

AreaDetailModel areaDetailModelFromJson(String str) =>
    AreaDetailModel.fromJson(json.decode(str));

String areaDetailModelToJson(AreaDetailModel data) =>
    json.encode(data.toJson());

class AreaDetailModel {
  AreaDetailModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory AreaDetailModel.fromJson(Map<String, dynamic> json) =>
      AreaDetailModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.avatar,
    this.child,
  });

  int? id;
  String? name;
  String? avatar;
  List<Child>? child;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        child: List<Child>.from(json["child"].map((x) => Child.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "child": List<dynamic>.from(child!.map((x) => x.toJson())),
      };
}

class Child {
  Child({
    this.id,
    this.parentId,
    this.name,
    this.digitalAssets,
  });

  int? id;
  int? parentId;
  String? name;
  List<List<DigitalAsset>>? digitalAssets;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        parentId: json["parent_id"],
        name: json["name"],
        digitalAssets: List<List<DigitalAsset>>.from(json["digital_assets"].map(
            (x) => List<DigitalAsset>.from(
                x.map((x) => DigitalAsset.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "name": name,
        "digital_assets": List<dynamic>.from(digitalAssets!
            .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class DigitalAsset {
  DigitalAsset({
    this.id,
    this.digitalAssetAreaId,
    this.status,
    this.row,
    this.column,
  });

  int? id;
  int? digitalAssetAreaId;
  int? status;
  int? row;
  int? column;

  factory DigitalAsset.fromJson(Map<String, dynamic> json) => DigitalAsset(
        id: json["id"],
        digitalAssetAreaId: json["digital_asset_area_id"],
        status: json["status"],
        row: json["row"],
        column: json["column"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "digital_asset_area_id": digitalAssetAreaId,
        "status": status,
        "row": row,
        "column": column,
      };
}
