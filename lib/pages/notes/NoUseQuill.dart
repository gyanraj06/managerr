
// //page with quill control
// //changed name from task_screen.dart to NoUseQuill.dart

// //keep double commented things commented only


// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:managerr/constants/colors.dart';
// import 'package:managerr/models/note.dart';
// import 'package:managerr/models/note_data.dart';
// import 'package:provider/provider.dart';

// class EditingNotePage extends StatefulWidget {
//   Note note;
//   bool isNewNode;
//   EditingNotePage({required this.note, required this.isNewNode});

//   @override
//   State<EditingNotePage> createState() => _EditingNotePageState();
// }

// class _EditingNotePageState extends State<EditingNotePage> {
//   QuillController _textController = QuillController.basic();
//   QuillController _subtextController = QuillController.basic();
//   @override

//   //load if present from before : note
//   void initState() {
//     super.initState();
//     loadExistingNote();
//   }

//   //load existing node
//   void loadExistingNote() {
//     final doc = Document()..insert(0, widget.note.text);
//     setState(() {
//       _textController = QuillController(
//         document: doc,
//         selection: const TextSelection.collapsed(offset: 0),
//       );
//     });
//   }

//   //add new node
//   void addNewNode() {
//     int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;
//     //get text from editor
//     String text = _textController.document.toPlainText();
//     String subtext = _subtextController.document.toPlainText();
//     Provider.of<NoteData>(context, listen: false)
//         .addNewNote(Note(id: id, text: text, subtext: subtext));
//   }

//   //updating existing node

//   void updateNode() {
//     String text = _textController.document.toPlainText();
//     String subtext = _subtextController.document.toPlainText();

//     Provider.of<NoteData>(context, listen: false)
//         .updateNote(widget.note, text, subtext);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: secondaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             //if new note
//             if (widget.isNewNode && !_textController.document.isEmpty()) {
//               addNewNode();
//             } //if existing
//             else {
//               updateNode();
//             }

//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 5,
//             ),
//             //toolbar
//             QuillToolbar.basic(
//               controller: _textController,
//               showAlignmentButtons: false,
//               showBackgroundColorButton: false,
//               showLeftAlignment: false,
//               showRightAlignment: false,
//               showBoldButton: false,
//               showCenterAlignment: false,
//               showClearFormat: false,
//               showCodeBlock: false,
//               showColorButton: false,
//               showFontSize: false,
//               showDirection: false,
//               showDividers: false,
//               showFontFamily: false,
//               showHeaderStyle: false,
//               showIndent: false,
//               showInlineCode: false,
//               showItalicButton: false,
//               showJustifyAlignment: false,
//               showLink: false,
//               showListBullets: false,
//               showListCheck: false,
//               showListNumbers: false,
//               showQuote: false,
//               showSearchButton: false,
//               showSmallButton: false,
//               showStrikeThrough: false,
//               showSubscript: false,
//               showSuperscript: false,
//               showUnderLineButton: false,
//             ),

//             //editor
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(25),
//                 child: QuillEditor.basic(
//                   controller: _textController,
//                   readOnly: false,
//                 ),
//               ),
//             ),

//             Divider(
//               color: primaryColor,
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(25),
//                 child: QuillEditor.basic(
//                   controller: _subtextController,
//                   readOnly: false,
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



//keet down code always commented: only for reference//error solve on same page 





// // class _TaskStateState extends State<TaskState> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFDBEDED),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   "30 Days of Coding",
// //                   style: GoogleFonts.montserrat(
// //                     textStyle: const TextStyle(
// //                       color: Color(0xFFFC542F),
// //                     ),
// //                   ),
// //                 ),
// //                 Text(
// //                   "Roadmap to Tensorflow",
// //                   style: GoogleFonts.montserrat(
// //                     textStyle: const TextStyle(
// //                       color: Color(0xFFFC542F),
// //                       fontSize: 50,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const Divider(
// //             color: Color(0xFF8D8D8D),
// //             height: 15,
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.only(left: 30, right: 30),
// //             child: Column(
// //               children: [
// //                 Container(
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     "Additional Information",
// //                     style: GoogleFonts.montserrat(
// //                         color: const Color(0xff8D8D8D),
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500),
// //                   ),
// //                 ),
// //                 Container(
// //                   alignment: Alignment.centerLeft,
// //                   child: Text(
// //                     "Passionate programmer embarking on a 30-day coding challenge. Dedicated to honing skills, exploring new languages, and creating innovative solutions one day at a time",
// //                     style: GoogleFonts.montserrat(
// //                         color: const Color(0xFF060404),
// //                         fontSize: 16,
// //                         fontWeight: FontWeight.w500),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const Divider(
// //             color: Color(0xFF8D8D8D),
// //             height: 15,
// //           ),
// //           const SizedBox(
// //             height: 15,
// //           ),
// //           Expanded(
// //             child: Container(
// //               padding: const EdgeInsets.only(left: 30, right: 30),
// //               width: 350,
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFFFC542F),
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(15),
// //                   topRight: Radius.circular(15),
// //                 ),
// //               ),
// //               child: Column(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.only(top: 10, left: 10),
// //                     child: Row(
// //                       children: [
// //                         Expanded(
// //                           child: Text(
// //                             "Checklist",
// //                             style: GoogleFonts.montserrat(
// //                               textStyle: const TextStyle(
// //                                 fontSize: 25,
// //                                 color: Color(0xFFDBEDED),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                         const Icon(
// //                           Icons.add,
// //                           size: 30,
// //                           color: Color(0xFFDBEDED),
// //                         )
// //                       ],
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
