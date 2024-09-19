import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  final Map<String, String>? produk;

  ProductForm({this.produk});

  @override
  _ProductFormState createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {
    'id': '',
    'nama': '',
    'jenis': '',
    'deskripsi_produk': '',
    'gambar': '',
    'kandungan': '',
  };

  @override
  void initState() {
    super.initState();
    if (widget.produk != null) {
      _formData['id'] = widget.produk!['id']!;
      _formData['nama'] = widget.produk!['nama']!;
      _formData['jenis'] = widget.produk!['jenis']!;
      _formData['deskripsi_produk'] = widget.produk!['deskripsi_produk']!;
      _formData['gambar'] = widget.produk!['gambar']!;
      _formData['kandungan'] = widget.produk!['kandungan']!;
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
        title: Text(widget.produk == null ? 'Tambah Produk' : 'Edit Produk'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['nama'],
                  decoration: InputDecoration(labelText: 'Nama Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama produk tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['nama'] = value!;
                  },
                ),
                TextFormField(
                  initialValue: _formData['jenis'],
                  decoration: InputDecoration(labelText: 'Jenis Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Jenis produk tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['jenis'] = value!;
                  },
                ),
                TextFormField(
                  initialValue: _formData['deskripsi_produk'],
                  decoration: InputDecoration(labelText: 'Deskripsi Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi produk tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['deskripsi_produk'] = value!;
                  },
                ),
                TextFormField(
                  initialValue: _formData['gambar'],
                  decoration: InputDecoration(labelText: 'URL Gambar'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL gambar tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['gambar'] = value!;
                  },
                ),
                TextFormField(
                  initialValue: _formData['kandungan'],
                  decoration: InputDecoration(labelText: 'Kandungan Produk'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kandungan produk tidak boleh kosong';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['kandungan'] = value!;
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
      ),
    );
  }
}
