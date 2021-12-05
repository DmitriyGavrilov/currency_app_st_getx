import 'package:dio/dio.dart';

/// Api client
class ApiClient {
  final Dio dio;
  final List<int> _successfulStatusCodes = [200, 204];
  final Map<String, String> _headers = <String, String>{};

  ApiClient({required this.dio}) {
    init();
  }

  /// Базовая инициализация
  Future<void> init() async {
    dio.options.baseUrl = 'https://www.nbrb.by/api/exrates';
    dio.options.connectTimeout = 7000;
    dio.options.receiveTimeout = 8000;
    dio.options.receiveDataWhenStatusError = true;
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    _setBaseHeaders();
  }

  /// Validates response and throws api exception if something wrong
  void _checkResponse(response) {
    if (response == null) throw Exception("Server respond is empty.");
    // BasicResponseDto responseDto =
    //     BasicResponseDto.fromJson(json.decode(response.data));

    if (!_successfulStatusCodes.contains(response.statusCode)) {
      // throw ApiException(
      //   message: responseDto.errorMessage ?? 'Unknown error',
      //   code: response.statusCode,
      // );
    }
  }

  /// Add or update header
  void addOrUpdateHeader(String name, String value) {
    if (_headers.containsKey(name)) {
      _headers[name] = value;
    } else {
      _headers.putIfAbsent(name, () => value);
    }
    dio.options.headers = _headers;
  }

  /// Clear headers
  void clearHeaders() {
    _headers.clear();
    dio.options.headers = _headers;
  }

  /// Make get request and get json response
  Future<dynamic> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.get(
      url,
      queryParameters: queryParameters,
    );

    _checkResponse(response);
    return response;
  }

  void _setBaseHeaders() {
    addOrUpdateHeader('accept', 'application/json');
  }
}

/// DTO basic respose information
class BasicResponseDto {
  late bool status;
  late bool isError;
  late String? errorMessage;

  BasicResponseDto({
    required this.status,
    required this.isError,
    required this.errorMessage,
  });

  BasicResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'] == 1;
    isError = json['error'] == 1;
    errorMessage = json['error_msg'];
  }
}
