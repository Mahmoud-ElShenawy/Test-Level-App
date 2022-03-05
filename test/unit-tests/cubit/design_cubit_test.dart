import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test_level_project/cubit/designs_cubit/designs_cubit.dart';
import 'package:test_level_project/model/designs_model.dart';
import 'package:test_level_project/repository/designs_repository.dart';

class MockDesignsRepository extends Mock implements DesignsRepository {}

main() {
  late MockDesignsRepository designsRepository;
  late DesignsCubit designsCubit;

  final designs = [
    DesignsModel(
      id: 0,
      selectedImage: Uint8List.fromList([1, 2, 3, 4, 5]),
      designPath: 'design path 0',
    ),
    DesignsModel(
      id: 1,
      selectedImage: Uint8List.fromList([1, 2, 3, 4, 5]),
      designPath: 'design path 1',
    ),
  ];

  final design = DesignsModel(
    id: 0,
    selectedImage: Uint8List.fromList([1, 2, 3, 4, 5]),
    designPath: 'design path 1',
  );

  setUp(() {
    // Create Mockito Objects
    designsRepository = MockDesignsRepository();

    when(() => designsRepository.getData()).thenAnswer(
      (_) async => designs,
    );

    when(() => designsRepository.createDesign(design)).thenAnswer(
      (_) async => Future.value(),
    );

    when(() => designsRepository.deleteDesign(design.id)).thenAnswer(
      (_) async => Future.value(),
    );

    designsCubit = DesignsCubit(designsRepository);
  });

  group('Cubit Tests', () {
    blocTest<DesignsCubit, DesignsState>(
      'Get Designs',
      build: () => designsCubit,
      act: (cubit) => cubit.getDesigns(),
      expect: () => <DesignsState>[
        DesignsLoading(),
        DesignsLoaded(designs: designs),
      ],
    );

    blocTest<DesignsCubit, DesignsState>(
      'Delete Design by ID',
      build: () => designsCubit,
      act: (cubit) => cubit.deleteDesign(design.id),
      expect: () => <DesignsState>[
        DesignsLoading(),
        DesignsLoaded(designs: designs.where((element) {
          if(element.id == design.id){
            designs.remove(design);
          }
          return true;
        }).toList()),
      ],
    );

    test('Save Design', () {
      designsCubit.saveData(design);
      expect(design, design);
    });

  });
}
