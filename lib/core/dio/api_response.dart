class ApiResponse<T> {
  final T? data;
  final String? errorMessage;
  final bool? isSuccess;

  ApiResponse.success(this.data)
      : isSuccess = true,
        errorMessage = null;

  ApiResponse.failure(this.errorMessage)
      : isSuccess = false,
        data = null;
}
