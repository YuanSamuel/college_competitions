import 'dart:typed_data';

class ChooseCollege {
  String name;
  List<String> domains;
  Uint8List? logo;

  ChooseCollege(this.name, this.domains, {this.logo});

  ChooseCollege.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        domains = List<String>.from(json['domains']);
}
