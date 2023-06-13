import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'utils/extensions.dart';
import 'utils/colors.dart';
import 'repository/todo_repository.dart';

class TrackerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String month;
  final String year;

  final controller = TextEditingController();
  final todoRepository = TodoRepository();

  TrackerAppBar({super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: AppBar(
          backgroundColor: appBarColor.toColor(),
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: '$month ',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6)),
            TextSpan(
                text: year,
                style: TextStyle(
                    color: accentColor.toColor(),
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.6))
          ])),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: accentColor.toColor()),
              tooltip: 'Show Snackbar',
              onPressed: () {
                todoRepository.createTodoItem(description: 'Coffee & breakfast');
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: accentColor.toColor()),
              tooltip: 'Go to the next page',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);

}
