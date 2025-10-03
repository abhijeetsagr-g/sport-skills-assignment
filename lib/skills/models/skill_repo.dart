import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sport_skills/skills/models/skill.dart';

class SkillRepo {
  Future<List<Skill>> fetchSkills() async {
    final response = await rootBundle.loadString('assets/skills.json');
    final List data = jsonDecode(response);
    return data.map((json) => Skill.fromJson(json)).toList();
  }
}
