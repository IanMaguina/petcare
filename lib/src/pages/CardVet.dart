import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardVet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Card title 1'),
            subtitle: Text(
              'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('APPOITMEN'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('OVERVIEW'),
              ),
            ],
          ),
          Image.asset('assets/card-sample-image.jpg'),
          Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}

Widget padding(Widget widget) {
  return Padding(padding: EdgeInsets.all(7.0), child: widget);
}
