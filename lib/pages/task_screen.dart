import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskState extends StatefulWidget {
  const TaskState({super.key});

  @override
  State<TaskState> createState() => _TaskStateState();
}

class _TaskStateState extends State<TaskState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDBEDED),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "30 Days of Coding",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color(0xFFFC542F),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "Roadmap to Tensorflow",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Color(0xFFFC542F),
                        fontSize: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFF8D8D8D),
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Additional Information",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff8D8D8D),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Passionate programmer embarking on a 30-day coding challenge. Dedicated to honing skills, exploring new languages, and creating innovative solutions one day at a time",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xFF060404),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFF8D8D8D),
            height: 15,
          ),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Checklist",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                fontSize: 25,
                                color: Color(0xFFDBEDED),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.add,
                          size: 30,
                          color: Color(0xFFDBEDED),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
