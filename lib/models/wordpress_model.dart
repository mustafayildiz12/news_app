// To parse this JSON data, do
//
//     final wordPressModel = wordPressModelFromJson(jsonString);

import 'dart:convert';

List<WordPressModel> wordPressModelFromJson(String str) =>
    List<WordPressModel>.from(
        json.decode(str).map((x) => WordPressModel.fromJson(x)));

String wordPressModelToJson(List<WordPressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WordPressModel {
  WordPressModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.betterFeaturedImage,
    this.links,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  StatusEnum? status;
  Type? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  Status? commentStatus;
  Status? pingStatus;
  bool? sticky;
  String? template;
  Format? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<dynamic>? tags;
  BetterFeaturedImage? betterFeaturedImage;
  Links? links;

  factory WordPressModel.fromJson(Map<String, dynamic> json) => WordPressModel(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusEnumValues.map![json["status"]],
        type: typeValues.map![json["type"]],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: statusValues.map![json["comment_status"]],
        pingStatus: statusValues.map![json["ping_status"]],
        sticky: json["sticky"],
        template: json["template"],
        format: formatValues.map![json["format"]],
        meta: List<dynamic>.from(json["meta"].map((x) => x)),
        categories: List<int>.from(json["categories"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        betterFeaturedImage:
            BetterFeaturedImage.fromJson(json["better_featured_image"]),
        links: Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date!.toIso8601String(),
        "date_gmt": dateGmt!.toIso8601String(),
        "guid": guid!.toJson(),
        "modified": modified!.toIso8601String(),
        "modified_gmt": modifiedGmt!.toIso8601String(),
        "slug": slug,
        "status": statusEnumValues.reverse![status],
        "type": typeValues.reverse![type],
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": statusValues.reverse![commentStatus],
        "ping_status": statusValues.reverse![pingStatus],
        "sticky": sticky,
        "template": template,
        "format": formatValues.reverse![format],
        "meta": List<dynamic>.from(meta!.map((x) => x)),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "better_featured_image": betterFeaturedImage!.toJson(),
        "_links": links!.toJson(),
      };
}

class BetterFeaturedImage {
  BetterFeaturedImage({
    this.id,
    this.altText,
    this.caption,
    this.description,
    this.mediaType,
    this.mediaDetails,
    this.post,
    this.sourceUrl,
  });

  int? id;
  String? altText;
  String? caption;
  String? description;
  MediaType? mediaType;
  MediaDetails? mediaDetails;
  dynamic post;
  String? sourceUrl;

  factory BetterFeaturedImage.fromJson(Map<String, dynamic> json) =>
      BetterFeaturedImage(
        id: json["id"],
        altText: json["alt_text"],
        caption: json["caption"],
        description: json["description"],
        mediaType: mediaTypeValues.map![json["media_type"]],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_text": altText,
        "caption": caption,
        "description": description,
        "media_type": mediaTypeValues.reverse![mediaType],
        "media_details": mediaDetails!.toJson(),
        "post": post,
        "source_url": sourceUrl,
      };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.sizes,
    this.imageMeta,
  });

  int? width;
  int? height;
  String? file;
  Map<String, Size>? sizes;
  ImageMeta? imageMeta;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        sizes: Map.from(json["sizes"])
            .map((k, v) => MapEntry<String, Size>(k, Size.fromJson(v))),
        imageMeta: ImageMeta.fromJson(json["image_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "sizes": Map.from(sizes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "image_meta": imageMeta!.toJson(),
      };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: List<dynamic>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords": List<dynamic>.from(keywords!.map((x) => x)),
      };
}

class Size {
  Size({
    this.file,
    this.width,
    this.height,
    this.mimeType,
    this.sourceUrl,
  });

  String? file;
  int? width;
  int? height;
  MimeType? mimeType;
  String? sourceUrl;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        mimeType: mimeTypeValues.map![json["mime-type"]],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "mime-type": mimeTypeValues.reverse![mimeType],
        "source_url": sourceUrl,
      };
}

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE});

enum Status { OPEN }

final statusValues = EnumValues({"open": Status.OPEN});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

enum Format { STANDARD }

final formatValues = EnumValues({"standard": Format.STANDARD});

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<Author>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies:
            List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"].map((x) => VersionHistory.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "wp:featuredmedia":
            List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
        "wp:attachment":
            List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
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

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
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
        name: nameValues.map![json["name"]],
        href: hrefValues.map![json["href"]],
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

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: taxonomyValues.map![json["taxonomy"]],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse![taxonomy],
        "embeddable": embeddable,
        "href": href,
      };
}

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues =
    EnumValues({"category": Taxonomy.CATEGORY, "post_tag": Taxonomy.POST_TAG});

enum StatusEnum { PUBLISH }

final statusEnumValues = EnumValues({"publish": StatusEnum.PUBLISH});

enum Type { POST }

final typeValues = EnumValues({"post": Type.POST});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap!.isEmpty) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
