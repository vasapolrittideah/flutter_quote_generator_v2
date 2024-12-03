import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NetworkClient {
  NetworkClient(this._dio);

  final Dio _dio;

  Future<Response> get(
    String url, {
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: _buildOptions(token, headers),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> post<T>(
    String url, {
    T? body,
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: _buildOptions(token, headers),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> put<T>(
    String url, {
    T? body,
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        options: _buildOptions(token, headers),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> patch<T>(
    String url, {
    T? body,
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.patch(
        url,
        data: body,
        queryParameters: queryParameters,
        options: _buildOptions(token, headers),
      );
    } catch (error) {
      rethrow;
    }
  }

  Future<Response> delete(
    String url, {
    String? token,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await _dio.delete(
        url,
        queryParameters: queryParameters,
        options: _buildOptions(token, headers),
      );
    } catch (error) {
      rethrow;
    }
  }

  Options _buildOptions(String? token, Map<String, String>? headers) {
    return Options(
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
        ...?headers,
      },
    );
  }
}
