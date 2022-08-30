import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:reddit_ui/screens/settings_screen.dart';
import 'package:reddit_ui/widgets/bottom_app_bar.dart';
import 'package:reddit_ui/widgets/search_bar_delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController myController;
  late final List<String> myTabs;

  @override
  void initState() {
    myTabs = const [
      "News",
      "Home",
      "Popular",
      "Controversial",
    ];
    myController = TabController(length: myTabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            tooltip: "Open drawer",
            onPressed: Scaffold.of(context).openDrawer,
          );
        }),
        bottom: TabBar(
          isScrollable: true,
          controller: myController,
          tabs: myTabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          indicatorSize: TabBarIndicatorSize.label,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: CustomDelegate()),
            icon: const Icon(
              CupertinoIcons.search,
            ),
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Settings'),
                onTap: () => Settings.init().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MySettingsScreen()),
                  ),
                ),
              ),
              PopupMenuItem(
                child: const Text('About'),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      drawer: const Drawer(),
      body: TabBarView(
        controller: myController,
        children: List<Widget>.generate(
          myTabs.length,
          (index) => Center(
            child: Text(
              index.toString(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      bottomNavigationBar: const MyBottomAppBar(),
    );
  }
}



dynamic showCustomDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('AlertDialog Title'),
      content: SingleChildScrollView(
        child: ListBody(
          children: const <Widget>[
            Text('This is a demo alert dialog.'),
            Text('Would you like to approve of this message?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Approve'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
