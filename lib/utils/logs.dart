import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

/// enable network proxy
const debugNetworkProxy = false;
const enableDio = false;

/// Logging config
void printLog([dynamic data, DateTime? startTime]) {
  if (foundation.kDebugMode) {
    var time = '';
    if (startTime != null) {
      final endTime = DateTime.now().difference(startTime);
      final icon = endTime.inMilliseconds > 2000
          ? '⌛️Slow-'
          : endTime.inMilliseconds > 1000
              ? '⏰Medium-'
              : '⚡️Fast-';
      time = '[$icon${endTime.inMilliseconds}ms]';
    }

    try {
      final now = DateFormat('h:mm:ss-ms').format(DateTime.now());
      debugPrint('ℹ️[${now}ms]$time${data.toString()}');

      // if (data.toString() == 'Bad state: No element') throw Exception();
    } catch (e, trace) {
      debugPrint('${data.toString()}');
      debugPrint(trace.toString());
    }
  }
}

/// The default http GET that support Logging
Future<http.Response> httpGet(Uri url, {Map<String, String>? headers}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio().get(url.toString(),
          options: Options(headers: headers, responseType: ResponseType.plain));
      printLog('GET:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        // ignore: only_throw_errors
        throw e.message;
      }
    }
  } else {
    final response = await http.get(url, headers: headers);
    printLog('GET:$url', startTime);

    /// For Debugging purpose
    // try {
    //   if (url.toString().indexOf('/v1/database') > 0) throw Exception();
    // } catch (e, trace) {
    //   printLog(e);
    //   printLog(trace);
    // }

    return response;
  }
}

/// The default http POST that support Logging
Future<http.Response> httpPost(Uri url,
    {Map<String, String>? headers, Object? body}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio().post(url.toString(),
          options: Options(headers: headers, responseType: ResponseType.plain),
          data: body);
      printLog('POST:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        // ignore: only_throw_errors
        throw e.message;
      }
    }
  } else {
    final response = await http.post(url, headers: headers, body: body);
    printLog('POST:$url', startTime);
    return response;
  }
}

/// The default http PUT that support Logging
Future<http.Response> httpPut(Uri url,
    {Map<String, String>? headers, Object? body}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio().put(url.toString(),
          options: Options(headers: headers, responseType: ResponseType.plain),
          data: body);
      printLog('PUT:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        // ignore: only_throw_errors
        throw e.message;
      }
    }
  } else {
    final response = await http.put(url, headers: headers, body: body);
    printLog('PUT:$url', startTime);
    return response;
  }
}

/// The default http PUT that support Logging
Future<http.Response> httpDelete(Uri url,
    {Map<String, String>? headers, Object? body}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio().delete(url.toString(),
          options: Options(headers: headers, responseType: ResponseType.plain),
          data: body);
      printLog('DELETE:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        // ignore: only_throw_errors
        throw e.message;
      }
    }
  } else {
    final response = await http.delete(url, headers: headers, body: body);
    printLog('DELETE:$url', startTime);
    return response;
  }
}

/// The default http PATCH that support Logging
Future<http.Response> httpPatch(Uri url,
    {Map<String, String>? headers, Object? body}) async {
  final startTime = DateTime.now();
  if (enableDio) {
    try {
      final res = await Dio().patch(url.toString(),
          options: Options(headers: headers, responseType: ResponseType.plain),
          data: body);
      printLog('PATCH:$url', startTime);
      final response = http.Response(res.toString(), res.statusCode!);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        final response =
            http.Response(e.response.toString(), e.response!.statusCode!);
        return response;
      } else {
        // ignore: only_throw_errors
        throw e.message;
      }
    }
  } else {
    final response = await http.patch(url, headers: headers, body: body);
    printLog('PATCH:$url', startTime);
    return response;
  }
}
