import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_skills/skills/bloc/skills_bloc.dart';
import 'package:sport_skills/skills/models/skill.dart';

class SkillDetailed extends StatelessWidget {
  const SkillDetailed({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Skill Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              skill.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const SizedBox(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },

              // if Image not found
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Skill Name
          Text(skill.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 10),

          // Skill Level
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange),
              const SizedBox(width: 8),
              Text(
                "Level: ${skill.level}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              context.read<SkillsBloc>().add(LoadSkills());
            },
            child: Center(child: Text("Go Back")),
          ),
        ],
      ),
    );
  }
}
