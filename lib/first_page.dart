import 'package:app_ecommerce/model/items_model.dart';
import 'package:app_ecommerce/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController pc = Get.put(ProductController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("GetX Ecommerce", style: optionStyle),
        leading: const Icon(Icons.menu, color: Colors.blue),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Colors.blueAccent))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Obx(() {
            if (pc.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                  itemCount: pc.ProductItem.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.69,
                  ),
                  itemBuilder: (context, index) {
                    return ProductDisplay(product: pc.ProductItem[index]);
                  });
            }
          })),
        ],
      ),
    );
  }
}

class ProductDisplay extends StatelessWidget {
  final Product product;
  const ProductDisplay({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(image: NetworkImage(product.image))),
            ),
            const SizedBox(height: 10),
            Text(product.title,
                style: optionStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Text(product.rating.rate.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(width: 5),
                      const Icon(Icons.star, size: 18, color: Colors.white),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Text(product.category.name.toLowerCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                Text("\$${product.price}",
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                IconButton(
                    onPressed: () {


                      
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                      color: Colors.orange,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

TextStyle optionStyle = TextStyle(
  fontSize: 8.sp,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
