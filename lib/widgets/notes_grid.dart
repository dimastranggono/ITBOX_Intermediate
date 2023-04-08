import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/widgets/note_item.dart';

import '../models/Note.dart';

class NotesGrid extends StatefulWidget {
  @override
  State<NotesGrid> createState() => _NotesGridState();
}

class _NotesGridState extends State<NotesGrid> {
  List<Note> _listNotes = [
    Note(
      id: 'N1',
      title: 'Catatan Materi Flutter',
      note:
          'Flutter merupakan Software Development Kit (SDK) yang bisa membantu developer dalam membuat aplikasi mobile cross platform. Kelas ini akan mempelajari pengembangan aplikasi mobile yang dapat dijalankan baik di IOS maupun di Android',
      updated_at: DateTime.parse('2021-05-19 20:33:33'),
      created_at: DateTime.parse('2021-05-19 20:33:33'),
    ),
    Note(
      id: 'N2',
      title: 'Target Pembelajaran Flutter',
      note:
          'Peserta dapat mengembangkan aplikasi mobile (IOS dan Android) menggunakan flutter,\nPeserta memahami konsep pengembangan aplikasi menggunakan flutter,\nPeserta dapat menjalankan aplikasi mobile di IOS dan Android ataupun Emulator,\nPeserta memahami bahasa pemrograman Dart,\nPeserta dapat mendevelop aplikasi mobile menggunakan flutter dan dart dari dasar secara berurutan.',
      updated_at: DateTime.parse('2021-05-20 20:53:33'),
      created_at: DateTime.parse('2021-05-20 20:53:33'),
    ),
    Note(
      id: 'N3',
      title: 'Belajar Flutter di ITBOX',
      note: 'Jangan lupa belajar flutter dengan video interactive di ITBOX.',
      updated_at: DateTime.parse('2021-05-20 21:22:33'),
      created_at: DateTime.parse('2021-05-20 21:22:33'),
    ),
    Note(
      id: 'N4',
      title: 'Resep nasi goreng',
      note:
          'Nasi putih 1 piring\nBawang putih 2 siung, cincang halus\nKecap manis atau kecap asin sesuai selera\nSaus sambal sesuai selera\nSaus tiram sesuai selera\nGaram secukupnya\nKaldu bubuk rasa ayam atau sapi sesuai selera\nDaun bawang 1 batang, cincang halus\nTelur ayam 1 butir\nSosis ayam 1 buah, iris tipis\nMargarin atau minyak goreng 3 sdm.',
      updated_at: DateTime.parse('2021-05-20 21:51:33'),
      created_at: DateTime.parse('2021-05-20 21:51:33'),
    ),
  ];

  //function untuk menge pinned note yang di pilih sesuai id
  void toggleIsPinned(String id) {
    //variabel index, mengecek apakah id dari note model sama dengan id parameter function ini
    int index = _listNotes.indexWhere((note) => note.id == id);
    //mengecek karena menggunakan indexwhere pasti akan return -1 untuk id, maka diperlukan pengecekan menggunakan if index >= 0
    if (index >= 0) {
      setState(() {
        _listNotes[index].isPinned = !_listNotes[index].isPinned;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //variabel untuk menampung keseluruhan Note yang di pin atau tidak di pinned
    //jangan lupa dikembalikan ke bentuk List dengan .toList karena tipe tempListNote adalah List<Note>
    List<Note> tempListNote = _listNotes.where((note) => note.isPinned == true).toList();
    tempListNote.addAll(_listNotes.where((note) => !note.isPinned).toList());
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
            toggleIsPinnedFunc: toggleIsPinned,
          );
        },
      ),
    );
  }
}
