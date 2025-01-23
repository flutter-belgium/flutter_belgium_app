import 'dart:convert';
import 'dart:io';

import 'package:flutter_belgium/model/service/airtable/airtable_record.dart';
import 'package:impaktfull_architecture/impaktfull_architecture.dart';

const _defaultAirtableApiUrl = 'https://api.airtable.com';

class AirtableService {
  final String personalAccessToken;
  final String projectBase;
  final String apiUrl;
  final Dio dio;

  AirtableService({
    required this.personalAccessToken,
    required this.projectBase,
    required this.dio,
    this.apiUrl = _defaultAirtableApiUrl,
  });

  Future<List<AirtableRecord>> getAllRecords(
    String recordName, {
    int? maxRecords,
    int? pageSize,
  }) async {
    final response = await dio.getUri(
      _recordApiUrl(recordName),
      options: Options(
        headers: _headers,
      ),
    );
    final body = response.data as Map<String, dynamic>?;
    if (body == null) {
      return [];
    }
    final recordsList = body['records'] as List<dynamic>;
    final records = List<Map<String, dynamic>>.from(recordsList);
    if (records.isEmpty) {
      return [];
    }

    return records.map<AirtableRecord>((Map<String, dynamic> record) => AirtableRecord.fromJSON(record)).toList();
  }

  Future<AirtableRecord?> getRecord(String recordName, String recordId) async {
    final response = await dio.getUri(
      _recordApiUrl(recordName, path: '/$recordId'),
      options: Options(
        headers: _headers,
      ),
    );
    final data = response.data as String;

    if (response.statusCode == HttpStatus.notFound || data.isEmpty) {
      return null;
    }
    final body = jsonDecode(data) as Map<String, dynamic>;

    return AirtableRecord.fromJSON(body);
  }

  Future<List<AirtableRecord>?> getRecordsFilterByFormula(
    String recordName,
    String filter,
  ) async {
    final response = await dio.getUri(
      _recordApiUrl(recordName, queryParams: {
        'filterByFormula': filter,
      }),
      options: Options(
        headers: _headers,
      ),
    );
    final data = response.data as String;
    final responseJson = jsonDecode(data) as Map<String, dynamic>;
    if (responseJson.containsKey('error')) {
      throw Exception(
        "${responseJson['error']['type']}::${responseJson['error']['message']}",
      );
    }

    if (!responseJson.containsKey('records')) {
      throw Exception('Response is missing records.');
    }
    final records = responseJson['records'] as List<dynamic>;
    return records.map<AirtableRecord>((record) => AirtableRecord.fromJSON(record as Map<String, dynamic>)).toList();
  }

  Uri _recordApiUrl(
    String recordName, {
    String? path,
    Map<String, String?>? queryParams,
  }) {
    var url = apiUrl.replaceAll(RegExp('^https?://'), '');
    final fullPath = '/v0/$projectBase/$recordName${path ?? ''}';
    return Uri.https(
      url,
      fullPath,
      queryParams,
    );
  }

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $personalAccessToken',
        'Content-Type': 'application/json',
      };
}
