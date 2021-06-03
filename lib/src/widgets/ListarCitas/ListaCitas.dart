import 'package:flutter/material.dart';

class ListarCitas extends StatefulWidget {
  @override
  _ListarCitasState createState() => new _ListarCitasState();
}

class _ListarCitasState extends State<ListarCitas> {
  TextEditingController editingController = TextEditingController();
  final duplicateItems = List<String>.generate(20, (i) => "Cita $i");
  final nombres = List<String>.generate(20, (i) => "Servicio $i");

  var items = [];
  var lnombres = [];
  @override
  void initState() {
    items.addAll(duplicateItems);
    lnombres.addAll(nombres);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: Color.fromRGBO(57, 159, 179, 1.0),
                    child: ListTile(
                      title: Align(
                        child: new Text(
                          '${items[index]}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        alignment: Alignment(0, 0),
                      ),
                      subtitle: Align(
                        child: new Text('${lnombres[index]}'),
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
