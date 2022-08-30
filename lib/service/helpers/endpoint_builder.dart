import 'package:flutter/foundation.dart';
import 'package:reddit_ui/constants/api_consts.dart';
import 'package:reddit_ui/service/enums/api_level.dart';
import 'package:reddit_ui/service/enums/api_schema.dart';
import 'package:reddit_ui/service/extensions/api_level_definer.dart';
import 'package:reddit_ui/service/extensions/api_schema_definer.dart';

class EndpointBuilder {
  EndpointBuilder();

  String _schema = "";
  String _baseUrl = "";
  String _apiIndetifier = "";

  String _endpointBase = "";

  String _endpointParams = "";

  String _savedParams = "";

  List<Map<String, String>> _queries = [];

  void _addBaseParam(String baseParam) {
    _endpointBase += "/$baseParam";
  }

  EndpointBuilder addParam(String param) {
    _endpointParams += "/$param";
    return this;
  }

  EndpointBuilder addQuery(String queryKey, String queryValue) {
    _queries.add({queryKey: queryValue});
    return this;
  }

  EndpointBuilder addPersistentParam(String param) {
    _endpointParams += "/$param";
    return this;
  }

  void _constructBaseEndpoint() {
    if (_schema.isEmpty) {
      setSchema();
    }
    if (_baseUrl.isEmpty) {
      setBaseUrl();
    }
    if (_apiIndetifier.isEmpty) {
      setApiIdentifier();
    }

    this
      .._addSchema()
      .._addBaseUrl()
      .._addApiIdentifier();
  }

  EndpointBuilder setSchema({ApiSchema? schema}) {
    _schema = schema?.getSchema ?? ApiSchema.HTTPS.getSchema;
    return this;
  }

  void _addSchema() {
    _endpointBase = "$_schema://$_endpointBase";
  }

  EndpointBuilder setBaseUrl({ApiLevel? apiLevel}) {
    _baseUrl = apiLevel == null ? "" : apiLevel.getBaseUrl;

    if (apiLevel == null) {
      if (kReleaseMode) {
        _baseUrl = ApiLevel.PRODUCTION.getBaseUrl;
      } else {
        _baseUrl = ApiLevel.DEVELOPMENT.getBaseUrl;
      }
    }
    return this;
  }

  void _addBaseUrl() {
    _endpointBase += _baseUrl;
  }

  EndpointBuilder setApiIdentifier([String? apiIdentifer]) {
    _apiIndetifier = apiIdentifer ?? ApiConsts.apiIdentifier;
    return this;
  }

  void _addApiIdentifier() {
    _addBaseParam(_apiIndetifier);
  }

  EndpointBuilder saveCurrentParams() {
    _savedParams += _endpointParams;
    _endpointParams = "";
    return this;
  }

  String _queryToString() {
    if (_queries.isNotEmpty) {
      List<String> queryReturnString = [];
      for (Map<String, String> element in _queries) {
        queryReturnString
            .add("${element.keys.elementAt(0)}=${element.values.elementAt(0)}");
      }
      return "?${queryReturnString.join("&")}";
    } else {
      return "";
    }
  }

  String build() {
    _constructBaseEndpoint();
    String finalUrl =
        _endpointBase + _savedParams + _endpointParams + _queryToString();
    _endpointBase = "";
    _endpointParams = "";
    _queries = [];
    return finalUrl;
  }
}
