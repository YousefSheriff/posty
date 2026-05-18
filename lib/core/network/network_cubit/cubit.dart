import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:posty/core/network/network_cubit/states.dart';


class ConnectivityCubit extends Cubit<ConnectivityStates>
{
  ConnectivityCubit() : super(ConnectivityInitialState()) {init();}

  void init()
  {
    Connectivity().onConnectivityChanged.listen((results) {
      if (results.first == ConnectivityResult.none)
      {
        emit(ConnectivityOfflineState());
      } else {
        emit(ConnectivityOnlineState());
      }
    });
  }
}