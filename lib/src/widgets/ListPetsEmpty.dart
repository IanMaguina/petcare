import 'package:flutter/material.dart';
import 'package:petcare/const/colors.dart';

class PetListEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/perrito.png'),
            ),
          ),
        ),
        Text(
          'Your Petlist Is Empty',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).textSelectionTheme.selectionColor,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Register your pet clicking the buttom',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: ColorsConsts.subTitle,
              fontSize: 26,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Colors.green),
              ),
              textStyle: TextStyle(
                  color: Color.fromRGBO(57, 179, 179, 1.0),
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            child: Text('Add a Pet'.toUpperCase()),
          ),
        ),
      ],
    );
  }
}
