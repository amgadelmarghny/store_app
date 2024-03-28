import 'package:store_2/models/shope_models/product_model.dart';

class GetCartModel {
  final bool status;
  final String? message;
  final Data? data;

  GetCartModel({
    required this.status,
    required this.message,
    required this.data,
  });
  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : json['data'],
    );
  }
}

class Data {
  dynamic total;
  List cartItemsList = [];
  Data.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    for (var element in json['cart_items']) {
      cartItemsList.add(CartItem.fromJson(element));
    }
  }
}

class CartItem {
  final int id;
  final int quantity;
  final ProductModel productModel;

  CartItem({
    required this.id,
    required this.quantity,
    required this.productModel,
  });
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      quantity: json['quantity'],
      productModel: ProductModel.fromJson(json['product']),
    );
  }
}

///////////////////////////////////////

// class Autogenerated {
//   bool? status;
//   String? message;
//   Data? data;

//   Autogenerated({this.status, this.message, this.data});

//   Autogenerated.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     status = data['status'];
//     message = data['message'];
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   List<CartItems>? cartItems;
//   int? subTotal;
//   int? total;

//   Data({this.cartItems, this.subTotal, this.total});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['cart_items'] != null) {
//       cartItems = <CartItems>[];
//       json['cart_items'].forEach((v) {
//         cartItems!.add(CartItems.fromJson(v));
//       });
//     }
//     subTotal = json['sub_total'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (cartItems != null) {
//       data['cart_items'] = cartItems.map((v) => v.toJson()).toList();
//     }
//     data['sub_total'] = this.subTotal;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class CartItems {
//   int? id;
//   int? quantity;
//   Product? product;

//   CartItems({this.id, this.quantity, this.product});

//   CartItems.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     quantity = json['quantity'];
//     product =
//         json['product'] != null ? Product.fromJson(json['product']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['quantity'] = quantity;
//     if (product != null) {
//       data['product'] = product!.toJson();
//     }
//     return data;
//   }
// }

// class Product {
//   int? id;
//   int? price;
//   int? oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;

//   Product(
//       {this.id,
//       this.price,
//       this.oldPrice,
//       this.discount,
//       this.image,
//       this.name,
//       this.description,
//       this.images,
//       this.inFavorites,
//       this.inCart});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['price'] = price;
//     data['old_price'] = oldPrice;
//     data['discount'] = discount;
//     data['image'] = image;
//     data['name'] = name;
//     data['description'] = description;
//     data['images'] = images;
//     data['in_favorites'] = inFavorites;
//     data['in_cart'] = inCart;
//     return data;
//   }
// }
