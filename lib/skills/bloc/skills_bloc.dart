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
    on<FilterSkills>(_onFilterSkills);
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

  // On Filter
  void _onFilterSkills(FilterSkills event, Emitter<SkillsState> emit) {
    final filtered = _allSkills.where((s) => s.level == event.level).toList();
    emit(SkillsLoaded(_allSkills, filtered: filtered));
  }
}
