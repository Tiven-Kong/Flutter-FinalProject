import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getDetail() async {
  final detail = await http.get(Uri.parse("http://localhost:3000/ProfileDetail"));
  return jsonDecode(detail.body);
}

Future<List> getBook() async {
  final book = await http.get(Uri.parse("http://localhost:3000/post"));
  final Books = jsonDecode(book.body);

  return Books ;

}
