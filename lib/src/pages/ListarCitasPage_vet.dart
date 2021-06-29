import 'package:flutter/material.dart';
import 'package:petcare/src/models/api_response.dart';
import 'package:petcare/src/models/date.dart';
import 'package:petcare/src/models/product.dart';
import 'package:petcare/src/models/type_service.dart';
import 'package:petcare/src/services/date_service.dart';
import 'package:petcare/src/services/products_service.dart';
import 'package:petcare/src/services/type_service_service.dart';

class ListarCitasVetPage extends StatelessWidget {
  ListarCitasVetPage(this.idVet);
  final idVet;
  void runDate(Future list, APIResponse<List<Date>> lists) {
    list.then((value) {
      lists = value;
    });
  }

  // void runTypes(Future type, APIResponse<TypeService> typeserv) {
  //   type.then((value) {
  //     typeserv = value;
  //   });
  // }

  void runProduct(Future product, APIResponse<Product> prod) {
    product.then((value) {
      prod = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateprovider = new DateService();
    final productprovider = new ProductService();
    // final typeproductprovider = new TypeServiceService();
    APIResponse<Product> product;
    APIResponse<TypeService> type;
    APIResponse<List<Date>> lists;
    List<Widget> datelist;
    Future list = dateprovider.getdateList(idVet); //PersonId
    runDate(list, lists);
    // Future types; // = typeproductprovider.getType(pid);
    Future producto;
    for (var i = 0; i < lists.data.length; i++) {
      producto =
          productprovider.getProduct(lists.data[i].service_id.toString());
      runProduct(producto, product);
      // types = typeproductprovider.getType(product.data.type_service.toString());
      datelist.add(
        _element(
            context, lists.data[i].star_time.toString(), product.data.name),
      );
    }
    return Scaffold(
        body: SafeArea(
      top: true,
      child: ListView(children: datelist),
    ));
  }
}

_element(BuildContext context, String service, String tipoServicio) {
  return ListTile(
    contentPadding: EdgeInsets.all(10),
    leading: Icon(Icons.date_range),
    title: (Text.rich(
      TextSpan(
        text: service,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    )),
    subtitle: Text(tipoServicio),
    trailing: Icon(
      Icons.arrow_forward_ios,
      color: Color.fromRGBO(57, 179, 179, 1),
    ),
    onTap: () {
      Navigator.pushNamed(context, 'detallecita');
    },
  );
}
