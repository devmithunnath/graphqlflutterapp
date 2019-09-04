import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'language.g.dart';

class Language = _Language with _$Language;

abstract class _Language with Store{
  @observable 
  String lang = ''; 

  @action
  toggleLang() async {
    print('--------- Toggling ---------');
    lang = await getLang();
    if( lang == 'en' ) {
      lang = 'ma';
      print('--------- switch to ma ---------');
    } else if( lang == 'ma' ){
      lang = 'en';
      print('--------- switch to en ---------');
    } else {
      lang = 'en';
      print('--------- else: switch to en ---------');
    }
    await updateLang(lang);
  }

  Future<String> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _langStatus;
    
    if(prefs.getString('language') == '' || prefs.getString('language') == 'null'){ 
      print('equal to empty');
      prefs.setString('language', 'en');
      _langStatus = 'en';
      print(_langStatus);
    } else {
      print('not equal to empty');
      _langStatus = prefs.getString('language');
      print(_langStatus);
    }

    return _langStatus;
  }

  Future updateLang(value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', value);
  }

}