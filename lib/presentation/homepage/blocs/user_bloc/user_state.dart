part of 'user_bloc.dart';


abstract class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final List<User> users;
  final bool hasReachedMax;

  UserLoaded({required this.users, required this.hasReachedMax});

  UserLoaded copyWith({
    List<User>? users,
    bool? hasReachedMax,
  }) {
    return UserLoaded(
      users: users ?? this.users,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [users, hasReachedMax];
}

class UserError extends UserState {
  final String error;

  UserError(this.error);

  @override
  List<Object> get props => [error];
}
