import 'package:flutter/material.dart';
import 'package:musicplayer/utils/colors.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Material(child: IconButton(onPressed: ()=>Navigator.pop(context), icon: Icon(Icons.close, color: textOnSecondaryWhite, size: 35))),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text("Account", style: Theme.of(context).textTheme.headline4,))

                  ],
                )
              ],
            ),
          )
        )
    );
  }
}
