import 'package:flutter/material.dart';
import '../data/author.dart';
import '../pages/author_detail_page.dart';

class CustomListTile extends StatelessWidget {
  final Author author;
  const CustomListTile({Key? key, required this.author}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFEFEFEF),
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enableFeedback: true,
        tileColor: Theme.of(context).backgroundColor,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            Icons.account_circle_outlined,
            color: Theme.of(context).primaryIconTheme.color,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_rounded,
          color: Theme.of(context).primaryIconTheme.color,
        ),
        title: Text(author.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AuthorDetailsPage(
                author: author,
              ),
            ),
          );
        },
      ),
    );
  }
}
