import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class GreetingContainer extends StatelessWidget {
  final String name;
  final String phase;

  const GreetingContainer({super.key, required this.name, required this.phase});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome, $name!",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Row(
          children: [
            Text("You are currently in your $phase \nphase",
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700))
          ],
        )
      ],
    );
  }
}
