import 'package:fastfood/DB/table/staffDB.dart';
import 'package:fastfood/data_class/staff_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'staff_event.dart';
part 'staff_state.dart';

class StaffBloc extends Bloc<StaffEvent, StaffState> {
  final StaffSQL staffSQL;
  StaffBloc(this.staffSQL) : super(StaffInitial()) {
    on<InsertStaffEvent>((event, emit) async{
      await staffSQL.insertStaff(event.staffData);
      // TODO: implement event handler
    });
  }
}
