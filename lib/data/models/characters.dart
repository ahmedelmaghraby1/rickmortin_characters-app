import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class Characters {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  // Origin? origin;
  // Origin? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Characters(
      {this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      // this.origin,
      // this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  Characters.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    // origin =
    //     json['origin'] != null ? new Origin.fromJson(json['origin']) : null;
    // location =
    //     json['location'] != null ? new Origin.fromJson(json['location']) : null;
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}
