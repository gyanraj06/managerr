import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerr/constants/colors.dart';
import 'package:managerr/models/note.dart';
import 'package:managerr/models/note_data.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TaskScreen extends StatefulWidget {
  Note note;
  bool isNewNode;
  TaskScreen({required this.note, required this.isNewNode});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _subtextController = TextEditingController();

  final String titleHint = 'Enter Title';
  final String subTitleHint = 'Enter Sub-Title';
  @override

  //load if present from before : note
  void initState() {
    super.initState();
    loadExistingNote();
  }

  //load existing node
  void loadExistingNote() {
    setState(() {
      _textController.text = widget.note.text;
      _subtextController.text = widget.note.subtext;
    });
  }

  //add new node
  void addNewNode() {
    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
    //get text from editor
    String text = _textController.text;
    String subtext = _subtextController.text;
    Provider.of<NoteData>(context, listen: false)
        .addNewNote(Note(id: id, text: text, subtext: subtext));
  }

  //updating existing node

  void updateNode() {
    String text = _textController.text;
    String subtext = _subtextController.text;

    Provider.of<NoteData>(context, listen: false)
        .updateNote(widget.note, text, subtext);
  }

  void deleteNode() {
    Provider.of<NoteData>(context, listen: false).deleteNote(widget.note);
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBEDED),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    maxLines: null,
                    controller: _textController,
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFFFC542F),
                        fontSize: 30,
                      ),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: titleHint,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFF8D8D8D),
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 30, right: 30),
            //   child: Column(
            //     children: [
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: Text(
            //           "Additional Information",
            //           style: GoogleFonts.montserrat(
            //               color: const Color(0xff8D8D8D),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //       Container(
            //         alignment: Alignment.centerLeft,
            //         child: TextField(
            //           maxLines: null,
            //           controller: _subtextController,
            //           decoration: InputDecoration(border: InputBorder.none),
            //           style: GoogleFonts.montserrat(
            //               color: const Color(0xFF060404),
            //               fontSize: 16,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                width: 350,
                decoration: const BoxDecoration(
                  color: Color(0xFFFC542F),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Additional Information",
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFDBEDED),
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                InkWell(
                                  onTap: deleteNode,
                                  child: const Icon(
                                    Icons.delete,
                                    color: secondaryColor,
                                  ),
                                )
                              ],
                            )),
                        TextField(
                          controller: _subtextController,
                          maxLines: null,
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                                color: terColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: subTitleHint,
                          ),
                        ),
                      ],
                    ),

                    //down button always wali
                    Positioned(
                      bottom: 30,
                      left: 30,
                      right: 30,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: terColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            //if new note
                            if (widget.isNewNode &&
                                _textController.text.isNotEmpty) {
                              addNewNode();
                            } //if existing
                            else {
                              updateNode();
                            }

                            Navigator.pop(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "MARK AS ",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: secondaryColor,
                                    fontSize: 12),
                              ),
                              Text(
                                "COMPLETE ",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              const CircleAvatar(
                                backgroundColor: secondaryColor,
                                radius: 7,
                                child: Icon(
                                  Icons.done,
                                  size: 10,
                                  color: terColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






//if any error copy paste the base down here//


//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
  // appBar: AppBar(
  //   leading: IconButton(
  //     icon: const Icon(Icons.arrow_back),
  //     onPressed: () {
  //       //if new note
  //       if (widget.isNewNode && _textController.text.isNotEmpty) {
  //         addNewNode();
  //       } //if existing
  //       else {
  //         updateNode();
  //       }

  //       Navigator.pop(context);
  //     },
  //   ),
  // ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 5,
//             ),
//             //toolbar

//             //editor
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(25),
//                 child: TextField(
//                   controller: _textController,
//                 ),
//               ),
//             ),

//             Divider(
//               color: primaryColor,
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(25),
//                 child: TextField(
//                   controller: _subtextController,
//                 ),
//               ),
//             ),

//             //
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TaskStateState extends State<TaskState> {
//   @override