import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'env_event.dart';
part 'env_state.dart';

class EnvBloc extends Bloc<EnvEvent, EnvState> {
  EnvBloc() : super(const EnvState.initial()) {
    on<SetEnvEvent>(_onSetEnv);
  }
  void _onSetEnv(SetEnvEvent event, Emitter<EnvState> emit) async {
    emit(state.copyWith(env: event.env));
  }
}
