import 'package:flutter/material.dart';
import 'package:managerr/data/hive_database.dart';
import 'package:managerr/models/note.dart';

class NoteData extends ChangeNotifier {
  //* link to hive
  final db = HiveDatabase();

  //list of notes
  List<Note> allNotes = [
    // initialization of space for notes in form: Note(id: 0, text: 'Roadmap to TensorFlow', subtext: "30 days of coding"),
  ];

  void initializeNotes() {
    allNotes = db.loadNotes();
  }

  //get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  //add
  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  //update
  void updateNote(Note note, String text, String subtex) {
    //go through all note and fing that note that we want
    for (var i = 0; i < allNotes.length; i++) {
      //find the rev node
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  //delete
  void deleteNote(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}
