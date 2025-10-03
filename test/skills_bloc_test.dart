import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sport_skills/skills/bloc/skills_bloc.dart';
import 'package:sport_skills/skills/models/skill.dart';
import 'package:sport_skills/skills/models/skill_repo.dart';

class MockSkillRepository extends Mock implements SkillRepo {}

void main() {
  group('SkillsBloc', () {
    late SkillsBloc bloc;
    late MockSkillRepository mockRepository;

    final mockSkills = [
      Skill(name: "Dribbling", level: "Basic", image: "url1"),
      Skill(name: "Vault", level: "Intermediate", image: "url2"),
      Skill(name: "Agility", level: "Advanced", image: "url3"),
    ];

    setUp(() {
      mockRepository = MockSkillRepository();
      bloc = SkillsBloc(skillRepo: mockRepository);
    });

    blocTest<SkillsBloc, SkillsState>(
      'emits [SkillsLoading, SkillsLoaded] when LoadSkills is added',
      setUp: () {
        when(
          () => mockRepository.fetchSkills(),
        ).thenAnswer((_) async => mockSkills);
      },
      build: () => bloc,
      act: (b) => b.add(LoadSkills()),
      expect: () => [
        SkillsLoading(),
        isA<SkillsLoaded>().having(
          (s) => s.allSkills.length,
          'allSkills length',
          3,
        ),
      ],
    );

    blocTest<SkillsBloc, SkillsState>(
      'emits filtered skills when FilterSkills is added',
      setUp: () {
        when(
          () => mockRepository.fetchSkills(),
        ).thenAnswer((_) async => mockSkills);
      },
      build: () => bloc,
      act: (b) async {
        b.add(LoadSkills());
        await Future.delayed(Duration.zero);
        b.add(FilterSkills("Basic"));
      },
      expect: () => [
        SkillsLoading(),
        isA<SkillsLoaded>().having(
          (s) => s.allSkills.length,
          'allSkills length',
          3,
        ),
        isA<SkillsLoaded>().having(
          (s) => s.filteredSkills.length,
          'filteredSkills length',
          1,
        ),
      ],
    );
  });
}
