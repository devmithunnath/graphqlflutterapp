// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Language on _Language, Store {
  final _$langAtom = Atom(name: '_Language.lang');

  @override
  String get lang {
    _$langAtom.context.enforceReadPolicy(_$langAtom);
    _$langAtom.reportObserved();
    return super.lang;
  }

  @override
  set lang(String value) {
    _$langAtom.context.conditionallyRunInAction(() {
      super.lang = value;
      _$langAtom.reportChanged();
    }, _$langAtom, name: '${_$langAtom.name}_set');
  }

  final _$_LanguageActionController = ActionController(name: '_Language');

  @override
  dynamic toggleLang() {
    final _$actionInfo = _$_LanguageActionController.startAction();
    try {
      return super.toggleLang();
    } finally {
      _$_LanguageActionController.endAction(_$actionInfo);
    }
  }
}
