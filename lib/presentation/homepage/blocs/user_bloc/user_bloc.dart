import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/user_model.dart';
import '../../../../data/repositories/user_repositoriey_impl.dart';

part 'user_event.dart';
part 'user_state.dart';



class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  int currentPage = 1;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUsers>(_onFetchUsers);
  }

  void _onFetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    final currentState = state;

    if (currentState is UserLoaded && currentState.hasReachedMax) return;

    try {
      if (currentState is UserInitial) {
        final users = await userRepository.fetchUsers(1, 20);
        return emit(UserLoaded(users: users, hasReachedMax: false));
      }

      if (currentState is UserLoaded) {
        final nextPage = currentPage + 1;
        final newUsers = await userRepository.fetchUsers(nextPage, 10);
        currentPage = nextPage;

        if (newUsers.isEmpty) {
          emit(currentState.copyWith(hasReachedMax: true));
        } else {
          emit(UserLoaded(
            users: List.of(currentState.users)..addAll(newUsers),
            hasReachedMax: false,
          ));
        }
      }
    } catch (error) {
      emit(UserError("Failed to fetch users"));
    }
  }
}
