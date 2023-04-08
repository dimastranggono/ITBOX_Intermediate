import 'package:flutter/foundation.dart';

class Note {
  final String id;
  final String title;
  final String note;
  final DateTime created_at;
  final DateTime updated_at;
  bool isPinned;

  Note(
      {@required this.id,
      @required this.title,
      @required this.note,
      @required this.created_at,
      @required this.updated_at,
      this.isPinned = false});


  //fungsi untuk memudahkan pemanggilan object baru untuk menambahkan note baru pada add notes_scree.dart
  Note copywith(
      {String id,
      String title,
      String note,
      DateTime updated_at,
      DateTime created_at,
      bool isPinned}) {
    return Note(
        id: id == null ? this.id : id,
        title: title == null ? this.title : title,
        note: note == null ? this.note : note,
        created_at: created_at == null ? this.created_at : created_at,
        updated_at: updated_at == null ? this.updated_at : updated_at,
        isPinned: isPinned == null ? this.isPinned : isPinned);
  }
}
