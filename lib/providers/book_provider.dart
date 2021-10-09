import 'package:flutter/material.dart';
import 'package:provider_example/models/book.dart';

class BookProvider extends ChangeNotifier {
  List<Book> books = <Book>[];
  void addBook() {
    Book _book = Book(name: 'Book No: ${books.length}', cid: '${books.length}');
    books.add(_book);
    notifyListeners();
  }
}
