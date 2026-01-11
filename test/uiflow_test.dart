import 'package:flutter_test/flutter_test.dart';
import 'package:uiflow/uiflow.dart';

void main() {
  group('UIFlow Components Tests', () {
    test('AppColors are defined', () {
      expect(AppColors.primaryColor, isNotNull);
      expect(AppColors.darkColor, isNotNull);
      expect(AppColors.white, isNotNull);
    });

    test('AppFontSize values are defined', () {
      expect(AppFontSize.s12, isA<double>());
      expect(AppFontSize.s14, isA<double>());
      expect(AppFontSize.s16, isA<double>());
    });

    test('App values are defined', () {
      expect(AppSize.s4, isA<double>());
      expect(AppSize.s8, isA<double>());
      expect(AppPadding.p8, isA<double>());
    });
  });
}
