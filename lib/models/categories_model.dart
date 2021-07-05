import 'dart:convert';

class CategoriesModal {
  static List<CategoriesItem>? Items;
}

class CategoriesItem {
  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  String? taxonomy;
  CategoriesItem({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
  });

  CategoriesItem copyWith({
    int? id,
    int? count,
    String? description,
    String? link,
    String? name,
    String? slug,
    String? taxonomy,
  }) {
    return CategoriesItem(
      id: id ?? this.id,
      count: count ?? this.count,
      description: description ?? this.description,
      link: link ?? this.link,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      taxonomy: taxonomy ?? this.taxonomy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'count': count,
      'description': description,
      'link': link,
      'name': name,
      'slug': slug,
      'taxonomy': taxonomy,
    };
  }

  factory CategoriesItem.fromMap(Map<String, dynamic> map) {
    return CategoriesItem(
      id: map['id'],
      count: map['count'],
      description: map['description'],
      link: map['link'],
      name: map['name'],
      slug: map['slug'],
      taxonomy: map['taxonomy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesItem.fromJson(String source) =>
      CategoriesItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Categories(id: $id, count: $count, description: $description, link: $link, name: $name, slug: $slug, taxonomy: $taxonomy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesItem &&
        other.id == id &&
        other.count == count &&
        other.description == description &&
        other.link == link &&
        other.name == name &&
        other.slug == slug &&
        other.taxonomy == taxonomy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        count.hashCode ^
        description.hashCode ^
        link.hashCode ^
        name.hashCode ^
        slug.hashCode ^
        taxonomy.hashCode;
  }
}
