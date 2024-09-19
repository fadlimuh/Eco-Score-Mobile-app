import 'package:flutter/material.dart';

class ArticleForm extends StatefulWidget {
  final Map<String, String>? article;

  ArticleForm({this.article});

  @override
  _ArticleFormState createState() => _ArticleFormState();
}

class _ArticleFormState extends State<ArticleForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'title': '',
    'summary': '',
  };

  @override
  void initState() {
    super.initState();
    if (widget.article != null) {
      _formData['title'] = widget.article!['title']!;
      _formData['summary'] = widget.article!['summary']!;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(context, _formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article == null ? 'Tambah Artikel' : 'Edit Artikel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['title'],
                decoration: InputDecoration(labelText: 'Judul Artikel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul artikel tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['title'] = value!;
                },
              ),
              TextFormField(
                initialValue: _formData['summary'],
                decoration: InputDecoration(labelText: 'Ringkasan Artikel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ringkasan artikel tidak boleh kosong';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['summary'] = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
