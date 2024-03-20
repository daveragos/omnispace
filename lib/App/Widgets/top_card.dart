import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Icon(Icons.snowing),
              Text('Snowing'),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Icon(Icons.currency_bitcoin),
              Text('Bitcoin'),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Icon(Icons.currency_franc_outlined),
              Text('Franc'),
            ],
          ),
        ],
      ),
    );
  }
}
