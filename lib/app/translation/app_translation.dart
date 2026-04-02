import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {'news': 'News', 'news_detail': 'News Detail'},
    'km_KH': {'news': 'ព័ត៌មាន', 'news_detail': 'ព័ត៌មានលំអិត'},
  };
}
