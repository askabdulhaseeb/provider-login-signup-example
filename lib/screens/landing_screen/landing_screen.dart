import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/book_provider.dart';
import 'package:provider_example/providers/user_provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const String routeName = '/LandingScreen';
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserProvider>(context).selectedUser;
    final _book = Provider.of<BookProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Landing Screen'),
        actions: [
          IconButton(
            onPressed: () {
              _book.addBook();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Text('Name: ${_user!.name}'),
          Text('email: ${_user.email}'),
          Text('password: ${_user.password}'),
          Expanded(
            child: ListView.builder(
              itemCount: _book.books.length,
              itemBuilder: (context, index) =>
                  Text('${_book.books[index].name}'),
            ),
          )
        ],
      ),
    );
  }
}
