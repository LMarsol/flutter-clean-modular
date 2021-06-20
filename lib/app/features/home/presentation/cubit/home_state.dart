import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final String message;

  HomeSuccess(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
