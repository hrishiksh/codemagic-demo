import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/author.dart';
import '../data/network_service.dart';

class AuthorDetailsPage extends StatefulWidget {
  final Author author;

  const AuthorDetailsPage({Key? key, required this.author}) : super(key: key);

  @override
  State<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            Image.network(
              NetworkService().authorImageLink(slug: widget.author.slug),
              frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 4),
                  ),
                  child: ClipOval(
                    child: child,
                  ),
                );
              }),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  double loadingpercent =
                      loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!.toInt();
                  if (loadingpercent < 1) {
                    return Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 4),
                      ),
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          "${(loadingpercent * 100).toStringAsFixed(2)} %",
                          style:
                              Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                      ),
                    );
                  }
                }
                return child;
              },
            ),
            const SizedBox(height: 20),
            Text(
              widget.author.name,
              style: Theme.of(context).primaryTextTheme.titleMedium,
            ),
            const SizedBox(height: 5),
            Text(
              widget.author.description,
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                widget.author.bio,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                launchUrl(
                  Uri.parse(widget.author.link),
                );
              },
              child: const Text("Know more"),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
