import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/widgets/note_item.dart';

import '../models/Note.dart';

class NotesGrid extends StatefulWidget {
  final List<Note> listNotes;
  final Function(String id) toggleIsPinnedFunc;

  NotesGrid(this.listNotes, this.toggleIsPinnedFunc);

  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  @override
  Widget build(BuildContext context) {
    //variabel untuk menampung keseluruhan Note yang di pin atau tidak di pinned
    //jangan lupa dikembalikan ke bentuk List dengan .toList karena tipe tempListNote adalah List<Note>
    List<Note> tempListNote =
        widget.listNotes.where((note) => note.isPinned == true).toList();
    tempListNote
        .addAll(widget.listNotes.where((note) => !note.isPinned).toList());
    return Padding(
      padding: EdgeInsets.all(12),
      child: GridView.builder(
        itemCount: tempListNote.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
        itemBuilder: (ctx, index) {
          return NoteItem(
            note: tempListNote[index].note,
            title: tempListNote[index].title,
            isPinned: tempListNote[index].isPinned,
            //id dibutuhkan untuk ambil parameter dari NoteModel id
            id: tempListNote[index].id,
            toggleIsPinnedFunc: widget.toggleIsPinnedFunc,
          );
        },
      ),
    );
  }
}
