// To parse this JSON data, do
//
//     final siyerCategoriesModel = siyerCategoriesModelFromJson(jsonString);

import 'dart:convert';

List<SiyerCategoriesModel> siyerCategoriesModelFromJson(String str) =>
    List<SiyerCategoriesModel>.from(
        json.decode(str).map((x) => SiyerCategoriesModel.fromJson(x)));

String siyerCategoriesModelToJson(List<SiyerCategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SiyerCategoriesModel {
  SiyerCategoriesModel({
    this.id,
    this.count,
    this.description,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.parent,
    this.meta,
    this.links,
  });

  int? id;
  int? count;
  String? description;
  String? link;
  String? name;
  String? slug;
  Taxonomy? taxonomy;
  int? parent;
  List<dynamic>? meta;
  Links? links;

  factory SiyerCategoriesModel.fromJson(Map<String, dynamic> json) =>
      SiyerCategoriesModel(
        id: json["id"],
        count: json["count"],
        description: json["description"],
        link: json["link"],
        name: json["name"],
        slug: json["slug"],
        taxonomy: taxonomyValues.map[json["taxonomy"]],
        parent: json["parent"],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "count": count,
        "description": description,
        "link": link,
        "name": name,
        "slug": slug,
        "taxonomy": taxonomyValues.reverse![taxonomy],
        "parent": parent,
        "meta": List<dynamic>.from(meta!.map((x) => x)),
        "_links": links!.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
    this.up,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;
  List<Up>? up;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        wpPostType: List<About>.from(
            json["wp:post_type"].map((x) => About.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
        up: json["up"] == null
            ? null
            : List<Up>.from(json["up"].map((x) => Up.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "wp:post_type": List<dynamic>.from(wpPostType!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
        "up":
            up == null ? null : List<dynamic>.from(up!.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: nameValues.map[json["name"]],
        href: hrefValues.map[json["href"]],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": nameValues.reverse![name],
        "href": hrefValues.reverse![href],
        "templated": templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum Name { WP }

final nameValues = EnumValues({"wp": Name.WP});

class Up {
  Up({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Up.fromJson(Map<String, dynamic> json) => Up(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

enum Taxonomy { CATEGORY }

final taxonomyValues = EnumValues({"category": Taxonomy.CATEGORY});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
