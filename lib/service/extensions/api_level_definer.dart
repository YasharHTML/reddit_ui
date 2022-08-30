import 'package:reddit_ui/constants/api_consts.dart';
import 'package:reddit_ui/service/enums/api_level.dart';

extension ApiLevelDefiner on ApiLevel {
  String get getBaseUrl {
    switch (this) {
      case ApiLevel.PRODUCTION:
        return ApiConsts.baseProdUrl;
      case ApiLevel.DEVELOPMENT:
        return ApiConsts.baseDevUrl;
      default:
        return ApiConsts.baseProdUrl;
    }
  }
}