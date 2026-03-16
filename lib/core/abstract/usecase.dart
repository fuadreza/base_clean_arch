abstract class UseCase<Params, T> {
  Future<T> invoke(final Params params);
}

abstract class StreamUseCase<Params, T> {
  T invoke(final Params params);
}

abstract class NoParamStreamUseCase<T> {
  T invoke();
}

abstract class NoParamsUseCase<T> {
  Future<T> invoke();
}
