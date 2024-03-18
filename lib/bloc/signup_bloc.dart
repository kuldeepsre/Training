import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class SignupEvent extends Equatable {
  final String email;
  final String password;

  SignupEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignupState extends Equatable {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isLoading;
  final bool isConnected;

  SignupState({
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.isLoading,
    required this.isConnected,
  });

  factory SignupState.initial() {
    return SignupState(
      isEmailValid: true,
      isPasswordValid: true,
      isLoading: false,
      isConnected: true,
    );
  }

  @override
  List<Object?> get props => [isEmailValid, isPasswordValid, isLoading, isConnected];
}


