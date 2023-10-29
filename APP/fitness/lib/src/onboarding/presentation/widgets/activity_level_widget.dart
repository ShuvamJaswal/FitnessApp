import 'package:flutter/material.dart';

class ActivityLevelWidget extends StatefulWidget {
  const ActivityLevelWidget({super.key, required this.p, required this.pc});
  final PageController pc;
  final Function p;
  @override
  State<ActivityLevelWidget> createState() => _ActivityLevelWidgetState();
}

class _ActivityLevelWidgetState extends State<ActivityLevelWidget> {
  int selected = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              "What's Your Activity Level",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Text("Let us know you better."),
            Expanded(
              child: Container(),
            ),
            ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(5),
              ),
              title: const Text('Low', textAlign: TextAlign.center),
              tileColor: selected == 1 ? Colors.blue : Colors.transparent,
              onTap: () {
                widget.p('activity', 1);
                setState(() {
                  selected = 1;
                });
              },
            ),
            ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title:
                    const Text('Lightly Active', textAlign: TextAlign.center),
                tileColor: selected == 2 ? Colors.blue : Colors.transparent,
                onTap: () {
                  widget.p('activity', 2);
                  setState(() {
                    selected = 2;
                  });
                }),
            ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: const Text('Moderately Active',
                    textAlign: TextAlign.center),
                tileColor: selected == 3 ? Colors.blue : Colors.transparent,
                onTap: () {
                  widget.p('activity', 3);
                  setState(() {
                    selected = 3;
                  });
                }),
            ListTile(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: const Text('Very Active', textAlign: TextAlign.center),
                tileColor: selected == 4 ? Colors.blue : Colors.transparent,
                onTap: () {
                  widget.p('activity', 4);
                  setState(() {
                    selected = 4;
                  });
                }),
            Expanded(
              child: Container(),
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.blue.shade200,
                  side: BorderSide(color: Colors.blue.shade200),
                ),
                onPressed: () {
                  widget.p('activity', selected);

                  widget.pc.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                child: const Text('Next')),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
