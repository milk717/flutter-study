

class Items {
  String? title;
  String? link;
  String? image;
  String? author;
  String? price;
  String? discount;
  String? publisher;
  String? pubdate;
  String? isbn;
  String? description;

  Items(
      {this.title,
        this.link,
        this.image,
        this.author,
        this.price,
        this.discount,
        this.publisher,
        this.pubdate,
        this.isbn,
        this.description});

  Items.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    link = json['link'];
    image = json['image'];
    author = json['author'];
    price = json['price'];
    discount = json['discount'];
    publisher = json['publisher'];
    pubdate = json['pubdate'];
    isbn = json['isbn'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['link'] = this.link;
    data['image'] = this.image;
    data['author'] = this.author;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['publisher'] = this.publisher;
    data['pubdate'] = this.pubdate;
    data['isbn'] = this.isbn;
    data['description'] = this.description;
    return data;
  }
}