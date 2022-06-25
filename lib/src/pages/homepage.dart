import 'package:flutter/material.dart';
import '../data/network_service.dart';
import '../data/author_list.dart';
import '../widgets/custom_listile.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<AuthorList> authorList;

  @override
  void initState() {
    authorList = NetworkService().fetchAuthorList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authors"),
      ),
      body: FutureBuilder<AuthorList>(
        future: authorList,
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            return ListView.builder(
              itemCount: snapShot.data?.count,
              itemBuilder: ((context, index) => CustomListTile(
                    author: snapShot.data!.results[index],
                  )),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
