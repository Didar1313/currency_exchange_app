
class ModelApi {
  String? code;
  double? value;

  ModelApi({this.code, this.value});

  ModelApi.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    value = double.parse(json['value'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["value"] = value;
    return _data;
  }
}