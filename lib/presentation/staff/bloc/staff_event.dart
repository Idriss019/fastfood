part of 'staff_bloc.dart';

class StaffEvent extends Equatable {
  const StaffEvent();

  @override
  List<Object> get props => [];
}

class InsertStaffEvent extends StaffEvent {
  final StaffData staffData;
  const InsertStaffEvent({required this.staffData});

  @override
  List<Object> get props => [staffData];
}

class ListenerDataDB extends StaffEvent {
  final List<StaffData> staffDataList;
  const ListenerDataDB(this.staffDataList);

  @override
  List<Object> get props => [staffDataList];
}

class UpdatePasswordEvent extends StaffEvent {
  final StaffData staffData;
  final String oldPassword;
  final String retryOldPassword;
  final String newPassword;
  final BuildContext context;
  final Function func;

  const UpdatePasswordEvent({
    required this.staffData,
    required this.oldPassword,
    required this.retryOldPassword,
    required this.newPassword,
    required this.context,
    required this.func,
  });

  @override
  List<Object> get props => [
    staffData,
    oldPassword,
    retryOldPassword,
    newPassword,
    context,
    func,
  ];
}

class UpdateState extends StaffEvent {
  final StaffState state;
  const UpdateState(this.state);
  @override
  List<Object> get props => [state];
}

class ChangePermission extends StaffEvent{}
// class ChangeInputEvent extends StaffEvent {
//   final String login;
//   final String password;
//   const ChangeInputEvent({
//     required this.login,
//     required this.password
//     });

//   @override
//   List<Object> get props => [login, password];
// }
