part of 'clean_for_storage_bloc.dart';

sealed class CleanForStorageState extends Equatable {
  const CleanForStorageState();
  
  @override
  List<Object> get props => [];
}

final class CleanForStorageInitial extends CleanForStorageState {}
