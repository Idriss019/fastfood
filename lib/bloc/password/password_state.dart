// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'password_cubit.dart';

class PasswordState {
  final String inputPassword;
  final String errorPassword;
  final String newPassword;
  final String replyPassword;

  PasswordState({
    required this.inputPassword,
    required this.errorPassword,
    required this.newPassword,
    required this.replyPassword,
  });

  List<Object> get props =>
      [errorPassword, inputPassword, newPassword, replyPassword];

  PasswordState copyWith({
    String? inputPassword,
    String? errorPassword,
    String? newPassword,
    String? replyPassword,
  }) {
    return PasswordState(
      inputPassword: inputPassword ?? this.inputPassword,
      errorPassword: errorPassword ?? this.errorPassword,
      newPassword: newPassword ?? this.newPassword,
      replyPassword: replyPassword ?? this.replyPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'inputPassword': inputPassword,
      'errorPassword': errorPassword,
      'newPassword': newPassword,
      'replyPassword': replyPassword,
    };
  }

  factory PasswordState.fromMap(Map<String, dynamic> map) {
    return PasswordState(
      inputPassword: map['inputPassword'] as String,
      errorPassword: map['errorPassword'] as String,
      newPassword: map['newPassword'] as String,
      replyPassword: map['replyPassword'] as String,
    );
  }

  @override
  String toString() {
    return 'PasswordState(inputPassword: $inputPassword, errorPassword: $errorPassword, newPassword: $newPassword, replyPassword: $replyPassword)';
  }

  @override
  bool operator ==(covariant PasswordState other) {
    if (identical(this, other)) return true;

    return other.inputPassword == inputPassword &&
        other.errorPassword == errorPassword &&
        other.newPassword == newPassword &&
        other.replyPassword == replyPassword;
  }

  @override
  int get hashCode {
    return inputPassword.hashCode ^
        errorPassword.hashCode ^
        newPassword.hashCode ^
        replyPassword.hashCode;
  }
}
