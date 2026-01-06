// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_bloc.dart';

class StorageState extends Equatable {
  final List<StorageData> storageList;
  final int selectedIndices;
  final String search;
  final List<String> filterList;

  const StorageState({
    this.storageList = const [],
    this.selectedIndices = -1,
    this.search = '',
    this.filterList = const [],
  });

  @override
  List<Object> get props => [storageList, selectedIndices, search, filterList];

  StorageState copyWith({
    List<StorageData>? storageList,
    int? selectedIndices,
    String? search,
    List<String>? filterList,
  }) {
    return StorageState(
      storageList: storageList ?? this.storageList,
      selectedIndices: selectedIndices ?? this.selectedIndices,
      search: search ?? this.search,
      filterList: filterList ?? this.filterList,
    );
  }
}

final class StorageInitial extends StorageState {}
