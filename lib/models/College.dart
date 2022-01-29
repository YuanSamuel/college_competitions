import 'dart:typed_data';

class College {
  String name;
  List<String> domains;
  Uint8List? logo;

  College(this.name, this.domains, {this.logo});

  College.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        domains = List<String>.from(json['domains']);
}
