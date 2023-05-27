
import 'package:marvel_heroes/data/models/response/listResponseModel.dart';
import 'package:marvel_heroes/data/models/response/templateModel.dart';
import 'package:marvel_heroes/domain/entities/baseResponse.dart';
import 'package:marvel_heroes/domain/entities/template.dart';

import '../../../domain/entities/heroes.dart';
import 'heroModel.dart';

class BaseResponseModel<T extends TemplateModel> {

  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  ListResponseModel<T>? data;

  BaseResponseModel({this.code, this.status, this.copyright, this.attributionText,
    this.attributionHtml, this.etag, this.data});

  BaseResponseModel.fromJson(dynamic json) {
    code = json["code"];
    status = json["status"];
    copyright = json["copyright"];
    attributionText = json["attributionText"];
    attributionHtml = json["attributionHTML"];
    etag = json["etag"];
    data = ListResponseModel<T>.fromJson(json["data"]);
  }

  BaseResponse<E> toEntity<E extends Template>() => BaseResponse<E>(
      code: code ?? 500,
      status: status ?? "",
      copyright: copyright ?? "",
      attributionText: attributionText ?? "",
      attributionHtml: attributionHtml ?? "",
      etag: etag ?? "",
      data: data!.toEntity<E>()
  );

}
