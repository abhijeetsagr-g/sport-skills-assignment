import 'package:flutter/material.dart';
import 'package:sport_skills/skills/models/skill.dart';
import 'package:sport_skills/skills/view/skill_card.dart';

class SkillCarousel extends StatelessWidget {
  final String title;
  final List<Skill> skills;

  const SkillCarousel({super.key, required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: skills.length,
            itemBuilder: (context, index) {
              return SkillCard(skill: skills[index]);
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
