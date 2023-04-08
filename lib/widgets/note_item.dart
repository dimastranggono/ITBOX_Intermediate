import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/presentation/my_flutter_app_icons.dart';

class NoteItem extends StatefulWidget {
  final String note;
  final String title;
  final bool isPinned;
  final String id;
  final Function(String id) toggleIsPinnedFunc;
  NoteItem(
      {@required this.note,
      @required this.title,
      @required this.isPinned,
      @required this.id,
      @required this.toggleIsPinnedFunc});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  //variabel baru untuk memanggil isPinned di stateful agar bisa digunakan di widget class ini
  bool _isPinned;

  @override
  void initState() {
    //varibale berikut dipanggil dari class stateful diatas
    //perlu dibuatkan variabel baru bool _isPinned di class ini karena isPinned di stateful bersifat final
    _isPinned = widget.isPinned;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.title);
    _isPinned = widget.isPinned;
    return GridTile(
      header: Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {
                widget.toggleIsPinnedFunc(widget.id);
              },
              icon: Icon(
                  _isPinned ? MyFlutterApp.pin : MyFlutterApp.pin_outline))),
      child: Container(
        //Text = ngambil dari _listnote[index].note {.note diambil dari class model Note}
        child: Text(widget.note),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(12)),
      ),
      footer: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
        child: GridTileBar(
          backgroundColor: Colors.black,
          title: Text(widget.title),
        ),
      ),
    );
  }
}
