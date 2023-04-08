import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/models/note.dart';
import 'package:intermediate_flutter_itbox/screen/add_notes_screen.dart';
import 'package:intermediate_flutter_itbox/widgets/notes_grid.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Notes'),
      ),
      body: NotesGrid(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddNotesScreen(),));
      },child: Icon(Icons.add),),
    );
  }
}