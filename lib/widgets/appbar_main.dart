import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/current_intake_provider.dart';
import '../providers/meals_provider.dart';
import '../screens/registration_screen.dart';

class AppbarMain extends StatelessWidget implements PreferredSizeWidget {
  Future logOff(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await Provider.of<MealsProvider>(context, listen: false).deleteAllMeals();
    await prefs.setBool('seen', false);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        PopupMenuButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('Clear today\'s intakes'),
              value: 0,
            ),
            PopupMenuItem(
              child: Text('Delete user'),
              value: 1,
            ),
          ],
          onSelected: (value) {
            if (value == 0) {
              Provider.of<CurrentIntakeProvider>(context, listen: false)
                  .deleteIntakes();
            }
            if (value == 1) {
              Provider.of<CurrentIntakeProvider>(context, listen: false)
                  .deleteIntakes();
              logOff(context);
              Navigator.pushReplacementNamed(
                  context, RegistrationScreen.routeName);
            }
          },
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
      leading: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: ClipOval(
          child: Container(
            color: Colors.white,
            child: Icon(
              Icons.cake,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      title: Text('GoodDiet'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
