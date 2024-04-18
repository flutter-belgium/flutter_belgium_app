import 'package:flutter_belgium/model/service/airtable/airtable_record_field.dart';

extension FirstWhereOrNull<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}

class AirtableRecord {
  final String? id;
  final DateTime? createdTime;
  List<AirtableRecordField> fields = [];

  AirtableRecord({
    required this.fields,
    this.createdTime,
    this.id,
  });

  AirtableRecordField? getField(String fieldName) => fields.firstWhereOrNull((f) => f.fieldName == fieldName);

  DateTime? getOptionalDateTime(String fieldName) {
    final field = getField(fieldName);
    if (field == null) return null;
    return DateTime.tryParse(field.value as String);
  }

  String? getOptionalString(String fieldName) {
    final field = getField(fieldName);
    if (field == null) return null;
    return field.value as String;
  }

  String getString(String fieldName) => getOptionalString(fieldName)!;

  Map<String, dynamic> toJSON() {
    Map<String, dynamic> result = {
      'fields': _jsonFields,
    };

    if (id != null) {
      result['id'] = id;
    }

    return result;
  }

  factory AirtableRecord.fromJSON(Map<String, dynamic> json) {
    final fields = Map.from(json['fields'] as Map);

    return AirtableRecord(
      id: json['id'] as String?,
      createdTime: DateTime.tryParse(json['createdTime'] as String),
      fields: fields.entries.map((e) => AirtableRecordField.fromMapEntry(e)).toList(),
    );
  }

  @override
  String toString() {
    if (id != null && createdTime != null) {
      return 'AirtableRecord(id: $id, createdTime: $createdTime, fields: $_jsonFields)';
    } else {
      return 'AirtableRecord(fields: $_jsonFields)';
    }
  }

  Map<String, dynamic> get _jsonFields {
    return Map.fromEntries(
      fields.map<MapEntry<String, dynamic>>((f) => f.toMapEntry()).toList(),
    );
  }
}
