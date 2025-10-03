part of 'skills_bloc.dart';

abstract class SkillsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SkillsInitial extends SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsLoaded extends SkillsState {
  final List<Skill> allSkills;

  // Add Filtered List on Event
  SkillsLoaded(this.allSkills);

  @override
  List<Object> get props => [allSkills];
}

class SkillsOpened extends SkillsState {
  final Skill skill;
  SkillsOpened(this.skill);

  @override
  List<Object> get props => [skill];
}

class SkillsError extends SkillsState {
  final String message;
  SkillsError(this.message);

  @override
  List<Object> get props => [message];
}
