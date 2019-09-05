import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LanguageEvent extends Equatable {
  LanguageEvent([List props = const <dynamic>[]]) : super(props);
}

class GetLanguage extends LanguageEvent {

  final bool langSwitch;

  GetLanguage(this.langSwitch) : super([ langSwitch ]);
}
