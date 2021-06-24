import 'package:flutter/material.dart';
import 'package:petcare/src/models/image.dart';
import 'package:petcare/src/utils/Images_Utils.dart';

import 'FullScreen.dart';

class TestImagePage extends StatefulWidget {
  @override
  _TestImagePageState createState() => _TestImagePageState();
}

class _TestImagePageState extends State<TestImagePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Resources>>(
      future: getImages(),
      builder: (context, snapshot) {
        List<Resources> resources = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return _buildListView(resources);
          default:
            return _buildLoadingScreen();
        }
      },
    );
  }
}

Widget _buildListView(List<Resources> resources) {
  return ListView.builder(
    itemBuilder: (ctx, idx) {
      return ContactCard(resources[idx]);
    },
    itemCount: resources.length,
  );
}

class ContactCard extends StatelessWidget {
  final Resources resource;

  ContactCard(this.resource);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => FullScreen(resource)));
      },
      
      child: new ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Hero(
          tag: resource.secureUrl,
          child: Image.network(
            resource.secureUrl,
            width: MediaQuery.of(context).size.width,
            height: 208,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

Widget _buildLoadingScreen() {
  return Center(
    child: Container(
      width: 50,
      height: 50,
      child: CircularProgressIndicator(),
    ),
  );
}
