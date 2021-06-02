import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  @override
  _MySearchBarState createState() => new _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  TextEditingController editingController = TextEditingController();

  final duplicateItems = List<String>.generate(100, (i) => "Item $i");
  var items = [];

  @override
  void initState() {
    items.addAll(duplicateItems);
    super.initState();
  }

  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue[200],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(-32),
          child: Text(
            "Lista de Citas",
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: InputDecoration(
                  labelText: "Buscar",
                  hintText: "Buscar por nombre",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Align(
                        child: new Text('${items[index]}'),
                        alignment: Alignment(0, 0),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
