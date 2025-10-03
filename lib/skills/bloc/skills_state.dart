part of 'skills_bloc.dart';

abstract class SkillsState extends Equatable {
  @override
  List<Object> get props => [];
}

class SkillsInitial extends SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsLoaded extends SkillsState {
  final List<Skill> allSkills;
  final List<Skill> filteredSkills;

  // Add Filtered List on Event
  SkillsLoaded(this.allSkills, {List<Skill>? filtered})
    : filteredSkills = filtered ?? allSkills;

  @override
  List<Object> get props => [allSkills, filteredSkills];
}

class SkillsError extends SkillsState {
  final String message;
  SkillsError(this.message);

  @override
  List<Object> get props => [message];
}
