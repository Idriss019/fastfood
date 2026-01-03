// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'password_cubit.dart';

class PasswordState extends Equatable {
  final String inputPassword;
  final String errorPassword;
  final String login;
  final String position;
  final Map<String, List<dynamic>> powers;
  // final String newPassword;
  // final String replyPassword;
  final List<StaffData> passwordData;

  const PasswordState({
    this.inputPassword = '',
    this.errorPassword = '',
    this.login = '',
    this.position = '',
    this.powers=const {},
    // this.newPassword = '',
    // this.replyPassword = '',
    this.passwordData = const [],
  });

  @override
  List<Object> get props => [
    errorPassword,
    inputPassword,
    login,
    position,
    powers,
    // newPassword,
    // replyPassword,
    passwordData,
  ];

  PasswordState copyWith({
    String? inputPassword,
    String? errorPassword,
    String? login,
    String? position,
    Map<String, List<dynamic>>? powers,
    // String? newPassword,
    // String? replyPassword,
    List<StaffData>? passwordData,
  }) {
    return PasswordState(
      inputPassword: inputPassword ?? this.inputPassword,
      errorPassword: errorPassword ?? this.errorPassword,
      login: login ?? this.login,
      position: position ?? this.position,
      powers: powers ?? this.powers,
      // newPassword: newPassword ?? this.newPassword,
      // replyPassword: replyPassword ?? this.replyPassword,
      passwordData: passwordData ?? this.passwordData,
    );
  }
}
final class PasswordInitial extends PasswordState {}
