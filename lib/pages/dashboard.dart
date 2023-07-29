import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:managerr/pages/task_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060404),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text( 
                            "Hello",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFFDBEDED),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            "Krsna,",
                            style: GoogleFonts.montserrat(
                              textStyle: const TextStyle(
                                color: Color(0xFFDBEDED),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Color(0xFF565251),
                      child: Icon(
                        Icons.add,
                        color: Color(0xFFDBEDED),
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 320,
                      child: Text(
                        "Manage your tasks efficiently.",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                            fontSize: 60,
                            color: Color(0xFFDBEDED),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          width: 360,
                          height: 170,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFC542F),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                  left: 5,
                                  top: 10,
                                  right: 5,
                                ),
                                child: Text(
                                  "30 days of coding",
                                  style: GoogleFonts.montserrat(
                                      color: const Color(0xFFDBEDED)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(
                                    left: 5, top: 10, right: 5),
                                child: Text(
                                  "Roadmap to TensorFlow",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xFFDBEDED),
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            border: Border.all(
                                              color: const Color(0xFFDBEDED),
                                            ),
                                          ),
                                          child: Text(
                                            "4 Hour",
                                            style: GoogleFonts.montserrat(
                                              color: const Color(0xFFDBEDED),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(20)),
                                            border: Border.all(
                                              color: const Color(0xFFDBEDED),
                                            ),
                                          ),
                                          child: Text(
                                            "75% Done",
                                            style: GoogleFonts.montserrat(
                                              color: const Color(0xFFDBEDED),
                                              fontSize: 15,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const TaskState(),
                                            ));
                                      },
                                      child: const CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Color(0xFF060404),
                                        child: Icon(
                                          Icons.arrow_circle_right_outlined,
                                          color: Color(0xFFDBEDED),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
