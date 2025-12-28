// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'staff_bloc.dart';

class StaffState extends Equatable {
  // final String position;
  // final String inputPower;
  // final String inputLogin;
  // final String inputPassword;
  final List<StaffData> staffDataList;
  const StaffState(
      {
      // this.position = '',
      // this.inputPower = '',
      // this.inputLogin = '',
      // this.inputPassword = '',
      this.staffDataList = const []}
  );
  
  @override
  List<Object> get props => [
        // position,
        // inputPower,
        // inputLogin,
        // inputPassword,
        staffDataList,
  ];

  StaffState copyWith({
    List<StaffData>? staffDataList,
  }) {
    return StaffState(
      staffDataList: staffDataList ?? this.staffDataList,
    );
  }
}

final class StaffInitial extends StaffState {
  const StaffInitial();
}
