// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'http://stagingauth.desidime.com/v4/home/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<List<PostModel>> getTopPosts(
    int perPage,
    int page,
    String fields, {
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'per_page': perPage,
      r'page': page,
      r'fields': fields,
    };
    final _headers = <String, dynamic>{r'X-Desidime-Client': clientHeader};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;

    final _options = _setStreamType<List<PostModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'new',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );


    // Make the request
    final _result = await _dio.fetch(_options);
    // print("Response: ${_result.data}");

    late List<PostModel> _value;

    try {
      // Ensure 'deals' exists and is a list
      final deals = _result.data['deals'];
      if (deals != null && deals is List) {
        _value = deals.map((json) => PostModel.fromJson(json)).toList();
      } else {
        _value = [];
      }
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }

    return _value;
  }

  @override
  Future<List<PostModel>> getPopularPosts(
    int perPage,
    int page,
    String fields, {
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'per_page': perPage,
      r'page': page,
      r'fields': fields,
    };
    final _headers = <String, dynamic>{r'X-Desidime-Client': clientHeader};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<PostModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'discussed',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );

    // Make the request
    final _result = await _dio.fetch(_options);
    print("Response: ${_result.data}");

    late List<PostModel> _value;

    try {
      // Ensure 'deals' exists and is a list
      final deals = _result.data['deals'];
      if (deals != null && deals is List) {
        _value = deals.map((json) => PostModel.fromJson(json)).toList();
      } else {
        _value = []; // Return an empty list if 'deals' is null or not a list
      }
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }

    return _value;
  }

  @override
  Future<List<PostModel>> getFeaturedPosts(
    int perPage,
    int page,
    String fields, {
    String clientHeader = "08b4260e5585f282d1bd9d085e743fd9",
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'per_page': perPage,
      r'page': page,
      r'fields': fields,
    };
    final _headers = <String, dynamic>{r'X-Desidime-Client': clientHeader};
    _headers.removeWhere((k, v) => v == null);
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<List<PostModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'discussed',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );

    final _result = await _dio.fetch(_options);

    late List<PostModel> _value;

    try {
      final deals = _result.data['deals'];
      if (deals != null && deals is List) {
        _value = deals.map((json) => PostModel.fromJson(json)).toList();
      } else {
        _value = [];
      }
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options);
      rethrow;
    }

    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
