part of 'env_bloc.dart';

class EnvState extends Equatable {
  final Map<String, String> env;

  const EnvState({
    this.env = const {},
  });

  const EnvState._({
    this.env = const {},
  });

  const EnvState.initial() : this._(env: const {});

  EnvState copyWith({
    Map<String, String>? env,
  }) {
    return EnvState(env: env ?? this.env);
  }

  @override
  List<Object> get props => [env];
}
