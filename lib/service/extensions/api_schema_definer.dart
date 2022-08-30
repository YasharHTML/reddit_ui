import 'package:reddit_ui/service/enums/api_schema.dart';

extension ApiSchemaDefiner on ApiSchema {
  String get getSchema {
    switch (this) {
      case ApiSchema.HTTP:
        return "http";
      case ApiSchema.HTTPS:
        return "https";
      default:
        return "https";
    }
  }
}