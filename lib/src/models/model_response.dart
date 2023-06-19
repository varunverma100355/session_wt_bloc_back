/*
 * Created by Varun Verma on 19/06/23.
 * File model_response.dart
 * Project session_wt_backend
 * Copyright (c) 2023 . All rights reserved.
 *
*/


abstract class ModelResponse<T> {
  int responseCode();
}

class Error<T> extends ModelResponse {
  final String? errorMessage;
  final int _responseCode;

  Error(this.errorMessage, this._responseCode);

  @override
  int responseCode() => _responseCode;
}

class Success<T> extends ModelResponse {
  final T data;
  final int _responseCode;

  Success(this.data, this._responseCode);

  @override
  int responseCode() => _responseCode;
}