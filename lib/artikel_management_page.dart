import 'package:flutter/material.dart';
import 'artikel_form.dart';

class ArticleManagementPage extends StatefulWidget {
  @override
  _ArticleManagementPageState createState() => _ArticleManagementPageState();
}

class _ArticleManagementPageState extends State<ArticleManagementPage> {
  List<Map<String, String>> articles = [];

  void _addArticle(Map<String, String> article) {
    setState(() {
      articles.add(article);
    });
  }

  void _editArticle(int index, Map<String, String> article) {
    setState(() {
      articles[index] = article;
    });
  }

  void _deleteArticle(int index) {
    setState(() {
      articles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Manajemen Artikel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.article),
                      title: Text(articles[index]['title']!),
                      subtitle: Text(articles[index]['summary']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final editedArticle = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleForm(
                                    article: articles[index],
                                  ),
                                ),
                              );
                              if (editedArticle != null) {
                                _editArticle(index, editedArticle);
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteArticle(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: () async {
                final newArticle = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleForm(),
                  ),
                );
                if (newArticle != null) {
                  _addArticle(newArticle);
                }
              },
              child: Icon(Icons.add),
              tooltip: 'Tambah Artikel',
            ),
          ],
        ),
      ),
    );
  }
}
