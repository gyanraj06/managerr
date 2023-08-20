import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerr/constants/colors.dart';
import 'package:managerr/models/note.dart';
import 'package:managerr/models/note_data.dart';
import 'package:managerr/pages/notes/taskscreen.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  DashBoard({super.key});

  final auth = FirebaseAuth.instance.currentUser;

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoteData>(context, listen: false).initializeNotes();
  }

  void signUserOut() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    FirebaseAuth.instance.signOut();

    Navigator.pop(context);
  }

  /*create a new note*********/
  void createNewNote() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    //create a blank node
    Note newNode = Note(
      id: id,
      text: '',
      subtext: '',
    );

    //go to edit
    goToNotePage(newNode, true);
  }

  //go to new note edit page
  void goToNotePage(Note note, bool isNewNote) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TaskScreen(
          note: note,
          isNewNode: isNewNote,
        ),
      ),
    );
  }

  void deleteNote(Note note) {
    Provider.of<NoteData>(context, listen: false).deleteNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: terColor,

        // floatingActionButton: FloatingActionButton(
        //   onPressed: createNewNote,
        //   child: const Icon(Icons.add),
        // ),
        appBar: AppBar(
          backgroundColor: terColor,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 10),
              child: FloatingActionButton(
                backgroundColor: const Color(0Xff565251),
                onPressed: createNewNote,
                child: const Icon(
                  Icons.add,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, top: 10),
              child: FloatingActionButton(
                backgroundColor: secondaryColor,
                onPressed: signUserOut,
                child: const Icon(
                  Icons.logout,
                  color: terColor,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Hello ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextSpan(
                          text: "User!",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: secondaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //manage your task
                  Text(
                    "Manage your tasks efficiently.",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        fontSize: 50,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /***LIST OF NODES */
            // CupertinoListSection.insetGrouped(
            //   backgroundColor: Colors.transparent,
            //   children: List.generate(
            //     value.getAllNotes().length,
            //     (index) => CupertinoListTile(
            //       title: Text(
            //         value.getAllNotes()[index].text,
            //         style: GoogleFonts.montserrat(
            //           color: secondaryColor,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       backgroundColor: primaryColor,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: value.getAllNotes().length == 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Text(
                        'Add your first Note!',
                        style: GoogleFonts.montserrat(
                          color: primaryColor,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 140,
                          decoration: BoxDecoration(
                            color:
                                index % 2 == 0 ? primaryColor : secondaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //note heading
                                Text(
                                  value.getAllNotes()[index].text,
                                  style: GoogleFonts.montserrat(
                                      color: index % 2 == 0
                                          ? secondaryColor
                                          : primaryColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),

                                //sub heading
                                Text(
                                  overflow: TextOverflow.fade,
                                  value.getAllNotes()[index].subtext,
                                  style: GoogleFonts.montserrat(
                                      color: index % 2 == 0
                                          ? secondaryColor
                                          : primaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),

                                //icon
                                Positioned(
                                  bottom: 30,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () => goToNotePage(
                                            value.getAllNotes()[index], false),
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: CircleAvatar(
                                            backgroundColor: terColor,
                                            child: Icon(
                                              Icons.arrow_outward_rounded,
                                              size: 30,
                                              color: secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: value.getAllNotes().length,
                    ),
            )
          ],
        ),
      ),
    );
  }
}


/************* 
// IconButton(
//   icon: const Icon(Icons.logout),
//   onPressed: signUserOut,
// ),
*/