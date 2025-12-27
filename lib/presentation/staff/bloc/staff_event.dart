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
