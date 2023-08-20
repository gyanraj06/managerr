import 'package:hive/hive.dart';
import 'package:managerr/models/note.dart';

class HiveDatabase {
  //* reference
  final _myBox = Hive.box('note_database');

  //* load note
  List<Note> loadNotes() {
    List<Note> savedNotesFormatted = [];
    //if there exist notes, return that, otherwise return empty list
    if (_myBox.get("All_Notes") != null) {
      List<dynamic> savedNotes = _myBox.get("All_Notes");

      for (int i = 0; i < savedNotes.length; i++) {
        //create individual note
        Note individualNote = Note(
            id: savedNotes[i][0],
            text: savedNotes[i][1],
            subtext: savedNotes[i][2]);

        //add to list
        savedNotesFormatted.add(individualNote);
      }
    } else {
      savedNotesFormatted.add(
        Note(id: 0, text: "First Node", subtext: "Your First Node"),
      );
    }

    return savedNotesFormatted;
  }

  //* save note
  void savedNotes(List<Note> allNotes) {
    List<List<dynamic>> allNotesFormatted = [
      //each note have id, text and subtext
    ];

    for (var note in allNotes) {
      int id = note.id;
      String text = note.text;
      String subtext = note.subtext;
    }

    //store into hive
    _myBox.put("All_Notes", allNotesFormatted);
  }
}
