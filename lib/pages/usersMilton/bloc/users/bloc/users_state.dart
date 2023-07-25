part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {
  final List<dynamic> listUsers;

  UsersInitial({required this.listUsers});
}

class UsersListData extends UsersState {
  final List<dynamic> listUsers;

  UsersListData({required this.listUsers});
}

class UsersLoading extends UsersState {}

class UsersFilter extends UsersState {
  final List<dynamic> listUsers;

  UsersFilter({required this.listUsers});
}
