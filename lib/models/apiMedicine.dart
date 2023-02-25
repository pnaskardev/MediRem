class ApiMedicines {
  int? id;
  String? name;
  double? price;
  String? content;
  String? companyName;
  double? rank;

  ApiMedicines(
      {this.id,
      this.name,
      this.price,
      this.content,
      this.companyName,
      this.rank});

  factory ApiMedicines.fromJson(Map<String, dynamic> json)
  {
    return ApiMedicines
    (
      id: json['id'],
      name : json['name'],
      price : json['price'],
      content : json['content'],
      companyName : json['companyName'],
      rank : json['rank'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['content'] = content;
    data['companyName'] = companyName;
    data['rank'] = rank;
    return data;
  }
}