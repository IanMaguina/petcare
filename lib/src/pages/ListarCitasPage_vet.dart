import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:petcare/src/services/date_service.dart';
import 'package:petcare/src/services/products_service.dart';
import 'package:petcare/src/services/type_service_service.dart';

class ListarCitasVetPage extends StatefulWidget {
  ListarCitasVetPage(this.id);
  String id;
  @override
  _ListarCitasPageState createState() => _ListarCitasPageState(id);
}

class _ListarCitasPageState extends State<ListarCitasVetPage> {
  _ListarCitasPageState(this.id);
  String id;
  DateService dateprovider = new DateService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: dateprovider.getdateList(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final List<Date> listamasc = snapshot.data.data;
              return _ListaCitas(listamasc, id);
            }
          },
        ),
      ),
    );
  }
}

Future<List<Product>> llenarProducts(
    List<Date> citas, ProductService productprovider) async {
  List<Product> productos;
  for (var i = 0; i < citas.length; i++) {
    var prod = await productprovider.getProduct(citas[i].service_id.toString());
    productos.add(prod.data);
  }
  return productos;
}

class _ListaCitas extends StatelessWidget {
  final List<Date> citas;
  String id;
  _ListaCitas(this.citas, this.id);
  ProductService productprovider = new ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: llenarProducts(citas, productprovider),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: citas.length,
                itemBuilder: (BuildContext context, int index) {
                  final date = citas[index];
                  final product = snapshot.data.data[index];
                  return _element(context, date, product);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

_element(BuildContext context, Date citas, Product service) {
  return ListTile(
    contentPadding: EdgeInsets.all(10),
    leading: Icon(Icons.date_range),
    title: (Text.rich(
      TextSpan(
        text: service.name,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    )),
    subtitle: Text(citas.star_time.toString()),
    hoverColor: Color.fromRGBO(57, 179, 179, 0.3),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    onTap: () {
      Navigator.pushNamed(context, 'vetplaces');
    },
  );
}
