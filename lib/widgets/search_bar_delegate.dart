import 'package:flutter/material.dart';

class CustomDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Text("Result $index"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Text("Result $index"),
    );
  }
}
