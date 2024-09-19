import 'package:flutter_ecoscore/category/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecoscore/shared/theme.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Image.asset(
                    categories[index].image,
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  categories[index].title,
                  style: regularTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          itemCount: categories.length),
    );
  }
}
