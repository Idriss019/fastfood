part of 'storage_bloc.dart';

class StorageEvent extends Equatable {
  const StorageEvent();

  @override
  List<Object> get props => [];
}

class UpdateState extends StorageEvent {
  final StorageState state;
  const UpdateState(this.state);
  @override
  List<Object> get props => [state];
}

class SearchInput extends StorageEvent {
  final String search;

  const SearchInput(this.search);
}
