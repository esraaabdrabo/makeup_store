class Products {
  List<Product> brandsProducts = [];
  Products(this.brandsProducts);
  Products.fromJson(List<dynamic> jsonList) {
    for (var element in jsonList) {
      brandsProducts.add(Product.fromJson(element));
    }
  }
}

class Product {
  int id = 0;
  String brand = '';
  String name = '';
  String price = '';
  String priceSign = '';
  String currency = '';
  String imageLink = '';
  String productLink = '';
  String websiteLink = '';
  String description = '';
  String category = '';
  String productType = '';
  List<String> tagList = [];
  String createdAt = '';
  String updatedAt = '';
  String productApiUrl = '';
  String apiFeaturedImage = '';
  List<ProductColors> productColors = [];

  Product(
      {required this.id,
      required this.brand,
      required this.name,
      required this.price,
      required this.priceSign,
      required this.currency,
      required this.imageLink,
      required this.productLink,
      required this.websiteLink,
      required this.description,
      required this.category,
      required this.productType,
      required this.tagList,
      required this.createdAt,
      required this.updatedAt,
      required this.productApiUrl,
      required this.apiFeaturedImage,
      required this.productColors});

  Product.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["brand"] is String) brand = json["brand"];
    if (json["name"] is String) name = json["name"];
    if (json["price"] is String) price = json["price"];
    if (json["price_sign"] is String) priceSign = json["price_sign"];
    if (json["currency"] is String) currency = json["currency"];
    if (json["image_link"] is String) imageLink = json["image_link"];
    if (json["product_link"] is String) productLink = json["product_link"];
    if (json["website_link"] is String) websiteLink = json["website_link"];
    if (json["description"] is String) description = json["description"];
    if (json["category"] is String) category = json["category"];
    if (json["product_type"] is String) productType = json["product_type"];
    if (json["tag_list"] is List) {
      tagList = (json["tag_list"] == null
          ? null
          : List<String>.from(json["tag_list"]))!;
    }
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["product_api_url"] is String) {
      productApiUrl = json["product_api_url"];
    }
    if (json["api_featured_image"] is String) {
      apiFeaturedImage = json["api_featured_image"];
    }
    if (json["product_colors"] is List)
    // ignore: curly_braces_in_flow_control_structures
    if (json["product_colors"] == null) {
      productColors = [];
    } else {
      productColors = (json["product_colors"] as List)
          .map((e) => ProductColors.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["brand"] = brand;
    data["name"] = name;
    data["price"] = price;
    data["price_sign"] = priceSign;
    data["currency"] = currency;
    data["image_link"] = imageLink;
    data["product_link"] = productLink;
    data["website_link"] = websiteLink;
    data["description"] = description;

    data["category"] = category;
    data["product_type"] = productType;
    data["tag_list"] = tagList;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["product_api_url"] = productApiUrl;
    data["api_featured_image"] = apiFeaturedImage;
    data["product_colors"] = this.productColors.map((e) => e.toJson()).toList();
    return data;
  }
}

class ProductColors {
  String hexValue = '';
  String colourName = '';

  ProductColors({required this.hexValue, required this.colourName});

  ProductColors.fromJson(Map<String, dynamic> json) {
    if (json["hex_value"] is String) hexValue = json["hex_value"];
    if (json["colour_name"] is String) colourName = json["colour_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["hex_value"] = hexValue;
    data["colour_name"] = colourName;
    return data;
  }
}
