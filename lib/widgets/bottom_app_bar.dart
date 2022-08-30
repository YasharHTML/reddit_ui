import 'package:flutter/material.dart';
import 'package:reddit_ui/api/users/get_users.dart';
import 'package:reddit_ui/models/fake_user.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
                tooltip: 'Friends',
                icon: const Icon(Icons.groups),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: 48,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          ),
                          FutureBuilder(
                            future: GetUsers().getAllUsers(),
                            builder: (context,
                                AsyncSnapshot<List<FakeUser>> snapshot) {
                              if (snapshot.hasData) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) => ListTile(
                                      title: Text(
                                        "${snapshot.data![index].firstName} ${snapshot.data![index].lastName}",
                                      ),
                                      subtitle: Text(
                                        snapshot.data![index].email,
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(100),
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Image.network(
                                            snapshot.data![index].avatar,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return const Center(child: CircularProgressIndicator());
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            IconButton(
              tooltip: 'Favorite',
              icon: const Icon(Icons.favorite),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
