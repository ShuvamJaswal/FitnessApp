import 'package:flutter/material.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.pc, required this.p});
  final PageController pc;
  final Function p;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  final PageController _pageController = PageController(viewportFraction: 0.3);
  num currentAge = 18;
  int male = 0;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.red[200],
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            const Text(
              "What's Your Gender?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text("Let us know you better."),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                onPageChanged: (value) {
                  widget.p("gender", value == 0 ? "male" : "female");
                  // widget.data.update(
                  //     "gender", (valuep) => valuep == 0 ? "male" : "female");
                  if (value == 0) {
                    setState(() {
                      page = 0;
                    });
                  } else {
                    setState(() {
                      page = 1;
                    });
                  }
                },
                controller: _pageController,
                children: [
                  Align(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 100.0 * (page == 0 ? 3 : 1),
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: Image(
                            image: AssetImage('assets/images/male.png'),
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 100.0 * (page == 1 ? 3 : 1),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                            color: Colors.white,
                            image: AssetImage(
                              'assets/images/female.png',
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade200,
                  side: BorderSide(color: Colors.blue.shade200),
                ),
                onPressed: () {
                  widget.p("gender", page == 0 ? "male" : "female");

                  widget.pc.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                child: const Text('Next'))
          ],
        ),
      ),
    );
  }
}
