import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:start_with_flutter_again/pages/usersMilton/repositories/users/usersEndpoint.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersEndpoint usersEndpoint = UsersEndpoint();

  UsersBloc() : super(UsersInitial(listUsers: [])) {
    on<GetInitialUserData>((event, emit) async {
      emit(UsersLoading());
      await usersEndpoint
          .getDataUsers()
          .then((usersList) => emit(UsersListData(listUsers: usersList)));
    });
  }
}
