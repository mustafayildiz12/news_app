// To parse this JSON data, do
//
//     final siyerDetails = siyerDetailsFromJson(jsonString);

import 'dart:convert';

SiyerDetails siyerDetailsFromJson(String str) =>
    SiyerDetails.fromJson(json.decode(str));

String siyerDetailsToJson(SiyerDetails data) => json.encode(data.toJson());

class SiyerDetails {
  SiyerDetails({
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
    this.powerkitPostFeatured,
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
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  bool? sticky;
  String? template;
  String? format;
  Meta? meta;
  List<int>? categories;
  List<dynamic>? tags;
  List<dynamic>? powerkitPostFeatured;
  BetterFeaturedImage? betterFeaturedImage;
  Links? links;

  factory SiyerDetails.fromJson(Map<String, dynamic> json) => SiyerDetails(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        dateGmt: DateTime.parse(json["date_gmt"]),
        guid: Guid.fromJson(json["guid"]),
        modified: DateTime.parse(json["modified"]),
        modifiedGmt: DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: json["status"],
        type: json["type"],
        link: json["link"],
        title: Guid.fromJson(json["title"]),
        content: Content.fromJson(json["content"]),
        excerpt: Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: json["comment_status"],
        pingStatus: json["ping_status"],
        sticky: json["sticky"],
        template: json["template"],
        format: json["format"],
        meta: Meta.fromJson(json["meta"]),
        categories: List<int>.from(json["categories"]!.map((x) => x)),
        tags: List<dynamic>.from(json["tags"]!.map((x) => x)),
        powerkitPostFeatured:
            List<dynamic>.from(json["powerkit_post_featured"]!.map((x) => x)),
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
        "status": status,
        "type": type,
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "sticky": sticky,
        "template": template,
        "format": format,
        "meta": meta!.toJson(),
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "powerkit_post_featured":
            List<dynamic>.from(powerkitPostFeatured!.map((x) => x)),
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
  String? mediaType;
  MediaDetails? mediaDetails;
  dynamic post;
  String? sourceUrl;

  factory BetterFeaturedImage.fromJson(Map<String, dynamic> json) =>
      BetterFeaturedImage(
        id: json["id"],
        altText: json["alt_text"],
        caption: json["caption"],
        description: json["description"],
        mediaType: json["media_type"],
        mediaDetails: MediaDetails.fromJson(json["media_details"]),
        post: json["post"],
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alt_text": altText,
        "caption": caption,
        "description": description,
        "media_type": mediaType,
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
            .map((k, v) => MapEntry<String, dynamic>(k, v!.toJson())),
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
        keywords: List<dynamic>.from(json["keywords"]!.map((x) => x)),
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
        mimeType: mimeTypeValues.map[json["mime-type"]],
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
    this.predecessorVersion,
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
  List<PredecessorVersion>? predecessorVersion;
  List<Author>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection:
            List<About>.from(json["collection"]!.map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        author:
            List<Author>.from(json["author"]!.map((x) => Author.fromJson(x))),
        replies:
            List<Author>.from(json["replies"]!.map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(
            json["version-history"]!.map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(
            json["predecessor-version"]!
                .map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: List<Author>.from(
            json["wp:featuredmedia"]!.map((x) => Author.fromJson(x))),
        wpAttachment: List<About>.from(
            json["wp:attachment"]!.map((x) => About.fromJson(x))),
        wpTerm:
            List<WpTerm>.from(json["wp:term"]!.map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history":
            List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "predecessor-version":
            List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
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

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"],
        href: json["href"],
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

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

  String? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"],
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Meta {
  Meta({
    this.coblocksAttr,
    this.coblocksDimensions,
    this.coblocksResponsiveHeight,
    this.coblocksAccordionIeSupport,
  });

  String? coblocksAttr;
  String? coblocksDimensions;
  String? coblocksResponsiveHeight;
  String? coblocksAccordionIeSupport;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        coblocksAttr: json["_coblocks_attr"],
        coblocksDimensions: json["_coblocks_dimensions"],
        coblocksResponsiveHeight: json["_coblocks_responsive_height"],
        coblocksAccordionIeSupport: json["_coblocks_accordion_ie_support"],
      );

  Map<String, dynamic> toJson() => {
        "_coblocks_attr": coblocksAttr,
        "_coblocks_dimensions": coblocksDimensions,
        "_coblocks_responsive_height": coblocksResponsiveHeight,
        "_coblocks_accordion_ie_support": coblocksAccordionIeSupport,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
