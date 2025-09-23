import 'package:fastfood/data_class/dishes_data.dart';
import 'package:fastfood/data_class/storage_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'creating_dishes_event.dart';
part 'creating_dishes_state.dart';

class CreatingDishesBloc extends Bloc<CreatingDishesEvent, CreatingDishesState> {
  CreatingDishesBloc() : super(CreatingDishesInitial()) {
    on<CreatingDishesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
