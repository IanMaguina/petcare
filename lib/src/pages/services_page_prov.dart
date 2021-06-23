import 'package:flutter/material.dart';
import 'package:petcare/src/services/service_service.dart';
import 'package:petcare/src/widgets/lista_servicios.dart';
import 'package:provider/provider.dart';

class ListServicesPageByProv extends StatefulWidget {
  @override
  _ListServicesPageByProvState createState() => _ListServicesPageByProvState();
}

class _ListServicesPageByProvState extends State<ListServicesPageByProv>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final servicios = Provider.of<ServicesService>(context).servicios;

    return Scaffold(
        body: (servicios.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : servicios);
  }

  @override
  bool get wantKeepAlive => true;
}
