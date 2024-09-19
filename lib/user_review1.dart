import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class UserReviewPage extends StatefulWidget {
  @override
  _UserReviewPageState createState() => _UserReviewPageState();
}

class _UserReviewPageState extends State<UserReviewPage> {
  final List<Map<String, String>> reviews = [
    {
      "username": "J****j",
      "rating": "5",
      "title": "Best Chips around!",
      "date": "14-06-2023",
      "comment":
          "These are great tasting chips! We cannot keep them in stock at home!",
    },
    {
      "username": "J****j",
      "rating": "5",
      "title": "Delicious",
      "date": "14-06-2023",
      "comment":
          "Got a case of the PopKorners in White Cheddar. They were delicious and very fresh. This is not the first time I have ordered them and they have not disappointed at all. Great value for great taste.",
    },
    {
      "username": "J****j",
      "rating": "5",
      "title": "No guilt snack zone",
      "date": "14-06-2023",
      "comment":
          "I made a big change to my eating habits and wanted a snack that made me feel like a normal person. These are it!! I love them so much.",
    },
    {
      "username": "C****q",
      "rating": "4",
      "title": "Tastes Great",
      "date": "14-06-2023",
      "comment":
          "These are a little bland, but not bad. They taste more like rice cakes than popcorn, though.",
    },
    {
      "username": "T****k",
      "rating": "3",
      "title": "Tastes Great",
      "date": "14-06-2023",
      "comment": "Took awhile to get here but worth it",
    },
  ];

  TextEditingController _commentController = TextEditingController();

  void _submitComment(String title, String comment, int? index) {
    setState(() {
      if (index == null) {
        reviews.add({
          "username": "User",
          "rating": "5",
          "title": title,
          "date": "14-06-2023",
          "comment": comment,
        });
      } else {
        reviews[index] = {
          "username": "User",
          "rating": "5",
          "title": title,
          "date": "14-06-2023",
          "comment": comment,
        };
      }
    });
  }

  void _deleteComment(int index) {
    setState(() {
      reviews.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulasan Pengguna'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  '4.2 dari 5',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_half,
                      color: Colors.yellow,
                    );
                  }),
                ),
                SizedBox(height: 8),
                Text('140 Kalori'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              child: Text(review["username"]!.substring(0, 1)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      review["username"]!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(review["date"]!),
                                  ],
                                ),
                                Row(
                                  children: List.generate(5, (starIndex) {
                                    return Icon(
                                      starIndex < int.parse(review["rating"]!)
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.yellow,
                                      size: 16,
                                    );
                                  }),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  review["title"]!,
                                  style: blackTextStyle,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  review["comment"]!,
                                  softWrap: true,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditReviewPage(
                                            index: index,
                                            title: review["title"]!,
                                            comment: review["comment"]!,
                                            onSubmit: _submitComment,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () => _deleteComment(index),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditReviewPage(
                          onSubmit: _submitComment,
                        ),
                      ),
                    ),
                    child: Text('Tambah Komentar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EditReviewPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final int? index;
  final Function(String, String, int?) onSubmit;

  EditReviewPage({this.index, String? title, String? comment, required this.onSubmit}) {
    if (title != null) _titleController.text = title;
    if (comment != null) _commentController.text = comment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Komentar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Judul',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _commentController,
              decoration: InputDecoration(
                labelText: 'Komentar',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                onSubmit(
                  _titleController.text,
                  _commentController.text,
                  index,
                );
                Navigator.pop(context);
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
