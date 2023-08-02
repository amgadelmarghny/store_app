import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/containerbuttom.dart';
import 'package:store_app/components/customtextfield.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';

import '../helper/snackBar.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String iD = 'UpdateProjectPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  hintText: 'title',
                  onChange: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'Price',
                  inputType: TextInputType.number,
                  onChange: (data) {
                    price = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'description',
                  onChange: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hintText: 'image',
                  onChange: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: 'send',
                  textColor: Colors.blueAccent,
                  onTap: () async{
                    isLoading = true;
                    setState(() {});
                   await updateProductService(productModel);
                    try {
                      await updateProductService(productModel);
                      snackBar(context, text: 'Success');
                    } catch (e) {
                      snackBar(context, text: e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  

 Future<void> updateProductService(ProductModel productModel)async {
   await UpdateProductService().updateProduct(
        id: productModel.id,
        title: productName == null ? productModel.title : productName!,
        price: price == null ? productModel.price : price!,
        desc: desc == null ? productModel.description : desc!,
        image: image == null ? productModel.image : image!,
        category: productModel.category);
  }
}
