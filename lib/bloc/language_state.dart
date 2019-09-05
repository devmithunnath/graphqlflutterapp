import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LanguageState extends Equatable {
  LanguageState([List props = const <dynamic>[]]) : super(props);
}

class LanguageInitial  extends LanguageState {}
