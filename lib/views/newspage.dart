import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:html_unescape/html_unescape.dart';

class Noticia {
  final String titulo;
  final String resumen;
  final String enlace;

  Noticia({required this.titulo, required this.resumen, required this.enlace});
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<Noticia> _noticias = [];

  @override
  void initState() {
    super.initState();
    _fetchNoticias();
  }

  Future<void> _fetchNoticias() async {
    final response = await http.get(Uri.parse(
        'https://blogmaverick.com/wp-json/wp/v2/posts?_embed&per_page=3'));
    if (response.statusCode == 200) {
      final noticiasJson = json.decode(response.body) as List<dynamic>;
      final nuevasNoticias = noticiasJson.map((json) {
        final titulo = _decodeHtmlEntities(json['title']['rendered'] as String);
        final resumen =
            _decodeHtmlEntities(json['excerpt']['rendered'] as String);
        final enlace = json['link'] as String;
        return Noticia(titulo: titulo, resumen: resumen, enlace: enlace);
      }).toList();
      setState(() {
        _noticias = nuevasNoticias;
      });
    }
  }

  String _decodeHtmlEntities(String htmlText) {
    final unescape = HtmlUnescape();
    return unescape.convert(htmlText);
  }

  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'No se pudo abrir el enlace $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias'),
      ),
      body: ListView.builder(
        itemCount: _noticias.length,
        itemBuilder: (context, index) {
          final noticia = _noticias[index];
          return ListTile(
            leading: Image.network(
                'https://blogmaverick.com/wp-content/themes/blogmaverick2/images/header-branding-2x.png'),
            title: Text(noticia.titulo),
            subtitle: Text(noticia.resumen),
            onTap: () {
              launchUrl(Uri.parse(noticia.enlace));
            },
          );
        },
      ),
    );
  }
}
