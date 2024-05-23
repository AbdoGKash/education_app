// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_check_event.dart';
part 'internet_check_state.dart';

class InternetCheckBloc extends Bloc<InternetCheckEvent, InternetCheckState> {
  StreamSubscription<List<ConnectivityResult>>? _streamSubscription;
  InternetCheckBloc() : super(InternetCheckInitial()) {
    on<InternetCheckEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState());
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState());
      }
    });

    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        add(ConnectedEvent());
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }

  // disbpose
  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
