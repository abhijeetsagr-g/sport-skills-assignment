part of 'skills_bloc.dart';

abstract class SkillsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSkills extends SkillsEvent {}

class OpenSkills extends SkillsEvent {
  final Skill skill;
  OpenSkills(this.skill);

  @override
  List<Object> get props => [skill];
}
