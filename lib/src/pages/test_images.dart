import 'package:flutter/material.dart';
import 'package:petcare/src/models/image.dart';
import 'package:petcare/src/utils/Images_Utils.dart';

class TestImagePage extends StatefulWidget {
  @override
  _TestImagePageState createState() => _TestImagePageState();
}

class _TestImagePageState extends State<TestImagePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            List<Resources> resources = snapshot.data;
            return GridView.count(
              crossAxisCount: 1,
              childAspectRatio: 0.74,
              shrinkWrap: false,
              children: resources.map((i) {
                return GestureDetector(
                  /* onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FullScreen(i)));
                    }, */
                  child: Card(
                    elevation: 5.0,
                    child: Column(
                      children: <Widget>[
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Hero(
                            tag: i.secureUrl,
                            child: Image.network(
                              i.secureUrl,
                              width: MediaQuery.of(context).size.width,
                              height: 208,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      future: getImages(),
    );
  }
}
