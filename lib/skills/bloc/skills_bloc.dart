import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_skills/skills/models/skill.dart';
import 'package:sport_skills/skills/models/skill_repo.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  List<Skill> _allSkills = [];
  final SkillRepo skillRepo;

  SkillsBloc({required this.skillRepo}) : super(SkillsInitial()) {
    on<LoadSkills>(_onLoadSkills);
    on<OpenSkills>(_onOpenSkills);
  }

  // On Load
  Future<void> _onLoadSkills(
    LoadSkills event,
    Emitter<SkillsState> emit,
  ) async {
    emit(SkillsLoading());
    try {
      _allSkills = await skillRepo.fetchSkills();
      emit(SkillsLoaded(_allSkills));
    } catch (e) {
      emit(SkillsError("Failed to load skills"));
    }
  }

  // On Open
  void _onOpenSkills(OpenSkills event, Emitter<SkillsState> emit) {
    try {
      emit(SkillsOpened(event.skill));
    } catch (e) {
      emit(SkillsError("Failed To Open Skill Card"));
    }
  }
}
