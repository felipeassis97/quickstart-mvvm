// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$dataAtom =
      Atom(name: '_HomeViewModelBase.data', context: context);

  @override
  ObservableList<DataModel> get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(ObservableList<DataModel> value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  late final _$homeStatusAtom =
      Atom(name: '_HomeViewModelBase.homeStatus', context: context);

  @override
  Status get homeStatus {
    _$homeStatusAtom.reportRead();
    return super.homeStatus;
  }

  @override
  set homeStatus(Status value) {
    _$homeStatusAtom.reportWrite(value, super.homeStatus, () {
      super.homeStatus = value;
    });
  }

  late final _$homeErrorAtom =
      Atom(name: '_HomeViewModelBase.homeError', context: context);

  @override
  String? get homeError {
    _$homeErrorAtom.reportRead();
    return super.homeError;
  }

  @override
  set homeError(String? value) {
    _$homeErrorAtom.reportWrite(value, super.homeError, () {
      super.homeError = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void setData(List<DataModel> value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setData');
    try {
      return super.setData(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearData() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.clearData');
    try {
      return super.clearData();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHomeStatus(Status value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setHomeStatus');
    try {
      return super.setHomeStatus(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHomeError(String value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.setHomeError');
    try {
      return super.setHomeError(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearHomeError() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.clearHomeError');
    try {
      return super.clearHomeError();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
data: ${data},
homeStatus: ${homeStatus},
homeError: ${homeError}
    ''';
  }
}
