part of 'env_bloc.dart';

class EnvEvent extends Equatable {
  const EnvEvent();

  @override
  List<Object> get props => [];
}

class SetEnvEvent extends EnvEvent {
  final Map<String, String> env;
  const SetEnvEvent({required this.env});
}
