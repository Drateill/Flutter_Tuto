import 'package:flutter/material.dart';

import './quote.dart';
import './quoteTemplate.dart';

void main() => runApp(MaterialApp(
      home: QuoteList(),
    ));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(author: 'Ma bite', text: 'Toto est pas bo'),
    Quote(author: 'Mon cul', text: 'Toto est  bo'),
    Quote(author: 'Ma chate', text: 'Tutu a pas bu'),
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) => QuoteCard(
              quote: quote,
              delete : (){
                setState((){
                  quotes.remove(quote);
                });
              }
            )).toList(),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
