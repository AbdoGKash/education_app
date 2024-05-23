part of 'internet_check_bloc.dart';

@immutable
sealed class InternetCheckState {}

final class InternetCheckInitial extends InternetCheckState {}

class ConnectedState extends InternetCheckState {}

class NotConnectedState extends InternetCheckState {}
