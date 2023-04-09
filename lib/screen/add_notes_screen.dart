import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/models/Note.dart';

class AddNotesScreen extends StatefulWidget {

  
  final Function (Note note) addNoteFunc;

  AddNotesScreen(this.addNoteFunc);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  Note _note = Note(id: null, title: '', note: '', created_at: null, updated_at: null);

  final _keyForm = GlobalKey<FormState>();

  void submitNote(){
    _keyForm.currentState.save();
   final now = DateTime.now();
    //Menammbahkan created at dan updated at menggunakan object _note dari Note menggunakan copywith agar pembuatan lebih cepat untuk beberapa variabel
    _note = _note.copywith(created_at: now,updated_at: now);
    widget.addNoteFunc(_note); 
    //untuk menutup halaman add_note_screen
    Navigator.of(context).pop();
   //untuk cek apakah data yang ditambah masuk
    // print(_note.title);
    // print(_note.note);
  }
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          actions: [TextButton(onPressed: submitNote, child: Text('Simpan'))],
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _keyForm,
              child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: 'Tambah Judul',),
                onSaved: (newValue) {
                  //TIDAK BISA LANGSUNG MENGGANTI VALUE DARI TITLE KARENA VALUE TITEL BERSIFAT FINAL
                  // _note.title = newValue;
                  //CARA BERIKUTNYA
                  _note = _note.copywith(title: newValue);
                },
              ),
              TextFormField(
                decoration: InputDecoration(hintText: 'Tambah Catatan'),
                onSaved: (newValue) {
                   //TIDAK BISA LANGSUNG MENGGANTI VALUE DARI TITLE KARENA VALUE TITEL BERSIFAT FINAL
                  // _note.title = newValue;
                  //CARA BERIKUTNYA
                  _note = _note.copywith(note: newValue);
                },
              ),
            ],
          )),
        ));
  }
}