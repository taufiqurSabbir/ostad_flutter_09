class productModel {
  String? status;
  List<Data>? data;

  productModel({this.status, this.data});

  productModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? productName;
  int? productCode;
  String? img;
  int? qty;
  int? unitPrice;
  int? totalPrice;

  Data(
      {this.sId,
        this.productName,
        this.productCode,
        this.img,
        this.qty,
        this.unitPrice,
        this.totalPrice});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ProductName'] = this.productName;
    data['ProductCode'] = this.productCode;
    data['Img'] = this.img;
    data['Qty'] = this.qty;
    data['UnitPrice'] = this.unitPrice;
    data['TotalPrice'] = this.totalPrice;
    return data;
  }
}
