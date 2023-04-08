import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/models/Note.dart';

class AddNotesScreen extends StatefulWidget {

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  Note _note = Note(id: null, title: '', note: '', created_at: null, updated_at: null);

  final _keyForm = GlobalKey<FormState>();

  void submitNote(){
    _keyForm.currentState.save();
    print(_note.title);
    print(_note.note);
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