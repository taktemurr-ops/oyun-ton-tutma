import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ton_tutma/oyun_ton_tutma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(tonTutmaConfig.title.length, 33);
    expect(tonTutmaConfig.tagline.length, 33);
    for (final s in tonTutmaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(tonTutmaConfig.gameId, tonTutmaId);
    expect(tonTutmaRules.gameId, tonTutmaId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(tonTutmaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: tonTutmaId, optionalMechanics: tonTutmaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(tonTutmaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
