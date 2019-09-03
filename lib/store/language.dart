import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language.g.dart';

class Language = _Language with _$Language;

abstract class _Language with Store{
  @observable 
  String lang = 'EN'; 

  @action
  toggleLang() {
    if( lang == 'EN' ) {
      lang = 'MA';
    } else if( lang == 'MA' ){
      lang = 'EN';
    } else {
      lang = 'MA';
    }
  }

}