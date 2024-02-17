import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.email,
    this.name,
    this.userId,
  }) : super();

  final String? name;
  final String? email;
  final String? userId;

  @override
  List<Object?> get props => [name, email, userId];
}
