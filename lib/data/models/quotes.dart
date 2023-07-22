import 'dart:ffi';

class Quotes {
  String? text;
  String? author;
  Quotes(this.text, this.author);
  Quotes.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    author = json['author'];
  }
}
