import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'clean_for_storage_event.dart';
part 'clean_for_storage_state.dart';

class CleanForStorageBloc extends Bloc<CleanForStorageEvent, CleanForStorageState> {
  CleanForStorageBloc() : super(CleanForStorageInitial()) {
    on<CleanForStorageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
