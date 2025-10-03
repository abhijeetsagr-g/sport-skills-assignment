import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_skills/skills/bloc/skills_bloc.dart';
import 'package:sport_skills/skills/models/skill_repo.dart';
import 'package:sport_skills/skills/view/skill_view.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SkillRepo skillRepo = SkillRepo();
    return BlocProvider<SkillsBloc>(
      create: (context) => SkillsBloc(skillRepo: skillRepo)..add(LoadSkills()),
      child: SkillView(),
    );
  }
}
