
import 'listResponse.dart';
import 'template.dart';

class BaseResponse<T extends Template> {

  int code;
  String status;
  String copyright;
  String attributionText;
  String attributionHtml;
  String etag;
  ListResponse data;

  BaseResponse({
    required this.code,
    required this.status,
    required this.copyright,
    required this.attributionText,
    required this.attributionHtml,
    required this.etag,
    required this.data
  });

}