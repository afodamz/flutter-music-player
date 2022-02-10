import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:musicplayer/components/bottom_bar_item.dart';
import 'package:musicplayer/pages/account.dart';
import 'package:musicplayer/pages/home.dart';
import 'package:musicplayer/pages/library.dart';
import 'package:musicplayer/pages/search.dart';
import 'package:musicplayer/utils/colors.dart';
import 'package:page_transition/page_transition.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin  {
  GlobalKey<NavigatorState> _key = GlobalKey();

  late DateTime _lastQuitTime;

  late int _currentIndex = 0;

  late AnimationController controller;
  late Animation<double> animation;

  final List<Widget> _selectdBottomIndex = [
    const HomeScreen(), const SearchScreen(), const LibraryScreen()
  ];


  _onTapNavBar(int index) {
    debugPrint("working");
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 50));
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();

  }

  @override
  Widget build(BuildContext context) {
    IconThemeData iconThemeData = IconTheme.of(context);
    return WillPopScope(
      // onWillPop: () async {
      //   Navigator.maybePop(context);
      //   return false;
      // },

      // onWillPop: () async {
      //   if (_key.currentState!.canPop()) {
      //     _key.currentState!.pop();
      //     return false;
      //   }
      //   return true;
      // },

        onWillPop: () async {
          if (_lastQuitTime == null ||
              DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
            print('Press again Back Button exit');
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Press again Back Button exit')));
            _lastQuitTime = DateTime.now();
            return false;
          } else {
            print('sign out');
            Navigator.of(context).pop(true);
            return true;
          }
        },

        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Row(
              children: [
                Icon(Icons.music_video_rounded),
                SizedBox(width: 5,),
                Text("Music", style: Theme.of(context).textTheme.headline4,)
              ],
            ),
            actions: [
              IconButton(onPressed: ()=>debugPrint("Working"), icon: Icon(Icons.search, color: textOnSecondaryWhite,)),
              InkWell(
                onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: AccountScreen())),
                child: CircleAvatar(
                  backgroundColor: redColor,
                  child: Text("a", style: Theme.of(context).textTheme.bodyText1,),
                ),)
            ],
          ),
          body: _selectdBottomIndex[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _onTapNavBar,
            selectedItemColor: textOnSecondaryWhite,
            unselectedItemColor: secondaryBackgroundWhite,
            currentIndex: _currentIndex,
            items: [
              bottomBarItem(
                  // icon: Icon(Icons.home_filled, color: iconThemeData.color,),
                  icon: Icon(Icons.home_filled,), label: "Home", tooltip: "Home"),
              bottomBarItem(icon: Icon(Icons.search), label: "Search", tooltip: "Search"),
              bottomBarItem(icon: Icon(CupertinoIcons.music_albums), label: "Library", tooltip: "Library"),

            ],
          ),
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 35,
                  icon: Icon(Icons.play_arrow),
                  onPressed: null,
                ),
                Container(child: Text("Some data over hereSome data", style: TextStyle(color: Colors.white),)),
                IconButton(
                  icon: Icon(Icons.favorite),
                  onPressed: null,
                )
              ],
            )
          ],
        )
    );
  }

  Future<void> _showDialog(BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text('Are you sure you want to quit?'),
            actions: <Widget>[
              RaisedButton(
                  child: Text('sign out'),
                  onPressed: () => Navigator.of(context).pop(true)),
              RaisedButton(
                  child: Text('cancel'),
                  onPressed: () => Navigator.of(context).pop(false)),
            ])
    );
  }

}
