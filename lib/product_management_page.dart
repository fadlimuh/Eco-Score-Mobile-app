import 'package:flutter/material.dart';
import 'product_form.dart';

class ManajemenProdukPage extends StatefulWidget {
  @override
  _ManajemenProdukPageState createState() => _ManajemenProdukPageState();
}

class _ManajemenProdukPageState extends State<ManajemenProdukPage> {
  List<Map<String, String>> produk = [];

  void _tambahProduk(Map<String, String> produkBaru) {
    setState(() {
      produk.add(produkBaru);
    });
  }

  void _editProduk(int index, Map<String, String> produkBaru) {
    setState(() {
      produk[index] = produkBaru;
    });
  }

  void _hapusProduk(int index) {
    setState(() {
      produk.removeAt(index);
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
              'Manajemen Produk',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: produk.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: produk[index]['gambar'] != null ? 
                        Image.network(produk[index]['gambar']!) : 
                        Icon(Icons.shopping_bag),
                      title: Text(produk[index]['nama']!),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jenis: ${produk[index]['jenis']!}'),
                          Text('Deskripsi: ${produk[index]['deskripsi_produk']!}'),
                          Text('Kandungan: ${produk[index]['kandungan']!}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              final produkEdit = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductForm(
                                    produk : produk[index],
                                  ),
                                ),
                              );
                              if (produkEdit != null) {
                                _editProduk(index, produkEdit);
                              }
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _hapusProduk(index);
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
                final produkBaru = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductForm(),
                  ),
                );
                if (produkBaru != null) {
                  _tambahProduk(produkBaru);
                }
              },
              child: Icon(Icons.add),
              tooltip: 'Tambah Produk',
            ),
          ],
        ),
      ),
    );
  }
}
