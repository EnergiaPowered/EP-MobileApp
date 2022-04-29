import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class About extends ChangeNotifier {
  final aboutUs = FirebaseFirestore.instance.collection('about-us').doc('ep');
  String? _mission;
  String? _vision;
  String? _whoAreWe;
  String? _structureUrl;

  String? get mission => _mission;
  String? get vision => _vision;
  String? get whoAreWe => _whoAreWe;
  String? get structureUrl => _structureUrl;

  Future<void> loadData() async {
    var doc = await aboutUs.get();
    if (doc.exists) {
      setDataFromJson(doc.data());
    }
  }

  void setDataFromJson(Map<String?, dynamic>? data) {
    this._mission = data!['mission'];
    this._vision = data['vision'];
    this._whoAreWe = data['who-are-we'];
    this._structureUrl = data['structure-url'];
  }

  Map<String?, dynamic> toJson() {
    Map<String?, dynamic> data = new Map();
    data['mission'] = this._mission;
    data['vision'] = this._vision;
    data['who-are-we'] = this._whoAreWe;
    data['structure-url'] = this._structureUrl;
    return data;
  }
}
