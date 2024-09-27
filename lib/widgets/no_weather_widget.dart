import 'package:flutter/material.dart';

class NoWeatherWidget extends StatelessWidget {
  const NoWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'There is no weather ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '  start searching now ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Icon(
                  Icons.search_rounded,
                  size: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
