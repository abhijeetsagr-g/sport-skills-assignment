part of 'skills_bloc.dart';

abstract class SkillsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSkills extends SkillsEvent {}

class FilterSkills extends SkillsEvent {
  // "Basic", "Intermediate", "Advanced"
  final String level;

  FilterSkills(this.level);

  @override
  List<Object> get props => [level];
}
