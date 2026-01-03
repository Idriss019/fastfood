// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'storage_bloc.dart';

class StorageState extends Equatable {
  final List<StorageData> storageList;
  final int selectedIndices;
  const StorageState({
    this.storageList = const [],
    this.selectedIndices = -1
    });

  @override
  List<Object> get props => [storageList, selectedIndices, ];

  StorageState copyWith({
    List<StorageData>? storageList,
    int? selectedIndices,
  }) {
    return StorageState(
      storageList: storageList ?? this.storageList,
      selectedIndices: selectedIndices ?? this.selectedIndices,
    );
  }
}

final class StorageInitial extends StorageState {}
