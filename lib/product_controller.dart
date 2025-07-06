
import 'package:app_ecommerce/model/items_model.dart';
import 'package:app_ecommerce/services/service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var ProductItem = <Product>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  void fetchdata() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        ProductItem.assignAll(products);
      }
    } finally{
      isLoading(false);
    }
  }
}
