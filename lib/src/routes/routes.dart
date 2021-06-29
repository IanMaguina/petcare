import 'package:flutter/material.dart';
import 'package:petcare/src/pages/Cita_Detailed.dart';
import 'package:petcare/src/pages/add_providerjoinproduct_page.dart';
import 'package:petcare/src/pages/add_user_page.dart';
import 'package:petcare/src/pages/add_user_vet_page.dart';
import 'package:petcare/src/pages/add_veterinary.dart';
import 'package:petcare/src/pages/appointment_page.dart';
import 'package:petcare/src/pages/home_page.dart';
import 'package:petcare/src/pages/home_vet_page.dart';
import 'package:petcare/src/pages/initpage.dart';
import 'package:petcare/src/pages/list_pet_page.dart';
import 'package:petcare/src/pages/list_veterinarias_page.dart';
import 'package:petcare/src/pages/login_page.dart';
import 'package:petcare/src/pages/login_page_vet.dart';
import 'package:petcare/src/pages/pet_detail_page.dart';
import 'package:petcare/src/pages/pet_detail_vet_page.dart';
import 'package:petcare/src/pages/test_images.dart';
import 'package:petcare/src/pages/veterinary_detail_page.dart';
import 'package:petcare/src/pages/veterinary_vet_detail_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => InitPage(),
    'login': (BuildContext context) => LoginPage(),
    'loginvet': (BuildContext context) => LoginVetPage(),
    'home': (BuildContext context) => HomePage(),
    'home_vet': (BuildContext context) => HomeVetPage(),
    'adduser': (BuildContext context) => AddUserPage(),
    'adduservet': (BuildContext context) => Add_Vet(),
    'petdetail': (BuildContext context) => PetDetailPage(),
    'veterinarydetail': (BuildContext context) => VeterinaryDetailPage(),
    'listpet': (BuildContext context) => ListPetPage(),
    'listvets': (BuildContext context) => ListVeterinariesPage(),
    'makeappointment': (BuildContext context) => AppointmentPage(),
    'detallecita': (BuildContext context) => ListarCitasDetailPage(),
    'providerjoinproduct': (BuildContext context) => AddProviderjoinProduct_Page(),
    'detallevetvet': (BuildContext context) => VeterinaryVetDetailPage(),
    'vetpetdetail': (BuildContext context) => PetDetailVetPage(),
    //'test': (BuildContext context) => ListServicesPageByProv(),
    'addveterinary': (BuildContext context) => Add_Veterinary(),
    'test': (BuildContext context) => TestImagePage(),

    /*  PetListScreen.routeName: (ctx) => PetListScreen(), */
  };
}
