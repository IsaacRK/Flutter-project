import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vanilla/src/usecase/auth_usecase/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  final IsUserRegisteredUsecase isUserRegisteredUsecase;
  final IsSignedInWithGoogleUsecase isSignedInWithGoogleUsecase;
  final GetCurrentSignedInEmailUsecase getCurrentSignedInEmailUsecase;

  AuthBloc(
    this.signInWithGoogleUsecase,
    this.isUserRegisteredUsecase,
    this.isSignedInWithGoogleUsecase,
    this.getCurrentSignedInEmailUsecase,
  ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(SignInWithGoogleState(
          result: null,
          isLoading: true,
        ));

        final User? user = await signInWithGoogleUsecase();

        emit(SignInWithGoogleState(result: user, isLoading: false));
      }

      if (event is CheckIsSignedInWithGoogleEvent) {
        emit(CheckIsUserSignedInWithGoogleState(
            isSignedIn: false, isLoading: true));

        bool isSignedIn = isSignedInWithGoogleUsecase();

        if (isSignedIn) {
          emit(CheckIsUserSignedInWithGoogleState(
              isSignedIn: isSignedIn, isLoading: false));
        } else {
          emit(CheckIsUserSignedInWithGoogleState(
              isSignedIn: isSignedIn,
              isLoading: false,
              errorMessege: 'belum login'));
        }
      }

      if (event is CheckIsUserRegisteredEvent) {
        emit(CheckIsUserRegisteredState(isRegistered: false, isLoading: true));

        bool isRegistered = await isUserRegisteredUsecase();

        emit(CheckIsUserRegisteredState(
          isRegistered: isRegistered,
          isLoading: false,
        ));
      }
    });
  }

  String? getCurrentSignedInEmail() {
    return getCurrentSignedInEmailUsecase();
  }
}
