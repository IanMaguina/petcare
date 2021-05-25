import 'package:flutter/material.dart';
import 'package:petcare/src/widgets/ListPetsEmpty.dart';

class PetListScreen extends StatelessWidget {
  static const routeName = '/PetListScreen';
  @override
  Widget build(BuildContext context) {
    List wishlistList = [];
    return wishlistList.isEmpty
        ? Scaffold(body: PetListEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Wishlist ()'),
            ),
            body: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext ctx, int index) {
                return Scaffold();
              },
            ),
          );
  }
}