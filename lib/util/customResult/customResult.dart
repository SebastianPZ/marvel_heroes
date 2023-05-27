
enum ResultStatus {success, error}

class CustomResult<T, E> {
  final T? value;
  final E? error;
  final ResultStatus status;

  CustomResult.onSuccess(this.value)
      : status = ResultStatus.success,
        error = null;

  CustomResult.onError(this.error)
      : status = ResultStatus.error,
        value = null;

  CustomResult(this.status, this.value, this.error);

  bool get success => status == ResultStatus.success && value != null;

}