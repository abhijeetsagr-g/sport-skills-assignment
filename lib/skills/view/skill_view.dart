import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_skills/skills/bloc/skills_bloc.dart';
import 'package:sport_skills/skills/view/skill_carousel.dart';

class SkillView extends StatelessWidget {
  const SkillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sport Skills")),
      body: BlocBuilder<SkillsBloc, SkillsState>(
        builder: (context, state) {
          if (state is SkillsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SkillsLoaded) {
            final skills = state.filteredSkills.isNotEmpty
                ? state.filteredSkills
                : state.allSkills;

            final basic = skills.where((s) => s.level == "Basic").toList();
            final intermediate = skills
                .where((s) => s.level == "Intermediate")
                .toList();
            final advanced = skills
                .where((s) => s.level == "Advanced")
                .toList();

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SkillCarousel(title: "Basic", skills: basic),
                SkillCarousel(title: "Intermediate", skills: intermediate),
                SkillCarousel(title: "Advanced", skills: advanced),
              ],
            );
          } else if (state is SkillsError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
