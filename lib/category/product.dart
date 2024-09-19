class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "Snack", image: "assets/images/chitato.jpg"),
  Category(title: "Kacang", image: "assets/images/chimi.jpg"),
  Category(title: "Skincare", image: "assets/images/cera.jpg"),
  Category(title: "Cream", image: "assets/images/vaseline.jpg"),
  Category(title: "Minuman", image: "assets/images/susu.jpg"),
  Category(title: "Air make up", image: "assets/images/garnier.jpg"),
];
