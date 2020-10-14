import 'package:awanahala/events/SignUpEvent.dart';
import 'package:awanahala/models/User.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SignUpBloc extends Bloc<SignUpEvent, User> {
  SignUpBloc(User initialState) : super(User());

  @override
  Stream<User> mapEventToState(SignUpEvent event) async* {
    switch (event.signUpEventyType) {
      case SignUpEventyType.addUserNameAndPWord:
        User newUserState = state;
        newUserState.userName = event.user.userName;
        newUserState.passWordHash = event.user.passWordHash;

        yield newUserState;
        break;
      case SignUpEventyType.addOtherData:
        User newUserState = state;
        newUserState.email = event.user.email;
        newUserState.fullName = event.user.fullName;
        newUserState.nic = event.user.nic;
        newUserState.phoneNumber = event.user.phoneNumber;
        yield newUserState;
        break;

      default:
        throw Exception("Event not found $event");
    }
  }
}
