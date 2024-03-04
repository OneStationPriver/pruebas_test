// Al realizar las pruebas unitarias debemos asegurarnos que el codigo no dependa de un BuildContext
// O alguna interaccion con la pantalla... Ya que no seria testeable con Units Tests si no con Widgets Tests

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_and_widget_testing/app/presentation/utils/validator.dart';

void main() {
  // Antes de cada test:
  // setUp(() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   print("🔥");
  // });
    // Despues de cada test:
  // tearDownAll(() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   print("🔥");
  // });
  test(
    'isValidEmail',
    () {
      expect(
        isValidEmail('text'),
        false,
      );

      expect(
        isValidEmail('test@test.com'),
        true,
      );

      expect(
        isValidEmail('t#est@test.com'),
        false,
      );
    },
  );

  group(
    'isValidPassword >',
    () {
      test(
        'empty text',
        () {
          final errors = isValidPassword(" ");
          expect(errors.length, 4);
        },
      );

      test(
        'white Spaces',
        () {
          final errors = isValidPassword(" lala as ");
          expect(
            errors.contains(PasswordErrors.whiteSpaces),
            true,
          );
        },
      );

      test(
        'at Least 6 Characters',
        () {
          final errors = isValidPassword('testabc');
          expect(
            errors.contains(PasswordErrors.atLeast6Characters),
            false,
          );
        },
      );

      test(
        'at Least 1 Number',
        () {
          final errors = isValidPassword('testabc1');
          expect(
            errors.contains(PasswordErrors.atLeast1Number),
            false,
          );
        },
      );

      test(
        'at Least 1 Upper Case',
        () {
          final errors = isValidPassword('testabc1A');
          expect(errors.isEmpty, true);
        },
      );
    },
  );
}

// sin grupos:
  // test(
  //   'isValidPassword',
  //   () {
  //     var errors = isValidPassword('test');
  //     // expect(
  //     //   errors.isNotEmpty,
  //     //   // errors.contains(PasswordErrors.atLeast6Characters),
  //     //   true,
  //     // );
  //     // O puedo hacerlo de esta forma:
  //     expect(
  //       errors.length,
  //       3,
  //     );

  // errors = isValidPassword('testabc1A');
  // expect(
  //   errors.isEmpty,
  //   true,
  // );

  // errors = isValidPassword('test abc1A');
  // expect(
  //   errors.isEmpty,
  //   false,
  // );
