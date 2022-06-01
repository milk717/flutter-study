class BookSearchList {
  String? lastBuildDate;
  int? total;
  int? start;
  int? display;
  List<Items>? items;

  BookSearchList(
      {this.lastBuildDate, this.total, this.start, this.display, this.items});

  BookSearchList.fromJson(Map<String, dynamic> json) {
    lastBuildDate = json['lastBuildDate'];
    total = json['total'];
    start = json['start'];
    display = json['display'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lastBuildDate'] = this.lastBuildDate;
    data['total'] = this.total;
    data['start'] = this.start;
    data['display'] = this.display;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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