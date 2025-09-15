import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_home_event.dart';
part 'order_home_state.dart';

class OrderHomeBloc extends Bloc<OrderHomeEvent, OrderHomeState> {
  OrderHomeBloc() : super(OrderHomeInitial()) {
    on<OrderHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
