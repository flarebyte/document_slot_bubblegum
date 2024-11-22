import 'package:args/args.dart';
import 'package:document_slot_bubblegum/src/options_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BubblegumElegantFragmentOptions Tests', () {
    test('Constructor initializes fields correctly', () {
      var options = BubblegumElegantFragmentOptions(
        language: 'en',
        direction: TextDirection.rtl,
        bold: true,
        italic: false,
        iconStart: 'startIcon',
        iconEnd: 'endIcon',
        tooltip: 'tooltip text',
        id: 'fragment123',
        buttonCaption: 'Click Me',
        buttonIcon: 'buttonIcon',
      );

      expect(options.language, 'en');
      expect(options.direction, TextDirection.rtl);
      expect(options.bold, true);
      expect(options.italic, false);
      expect(options.iconStart, 'startIcon');
      expect(options.iconEnd, 'endIcon');
      expect(options.tooltip, 'tooltip text');
      expect(options.id, 'fragment123');
      expect(options.buttonCaption, 'Click Me');
      expect(options.buttonIcon, 'buttonIcon');
    });

    test('setDirection sets correct enum value', () {
      var options = BubblegumElegantFragmentOptions();

      options.setDirection('RTL');
      expect(options.direction, TextDirection.rtl);

      options.setDirection('LTR');
      expect(options.direction, TextDirection.ltr);

      options.setDirection('auto');
      expect(options.direction, TextDirection.auto);

      options.setDirection('invalid');
      expect(options.direction, TextDirection.notSupported);
    });

    test('hasLanguage returns correct value', () {
      var options = BubblegumElegantFragmentOptions(language: 'en');
      expect(options.hasLanguage(), true);

      options.language = null;
      expect(options.hasLanguage(), false);
    });

    test('hasDirection returns correct value', () {
      var options =
          BubblegumElegantFragmentOptions(direction: TextDirection.ltr);
      expect(options.hasDirection(), true);

      options.direction = null;
      expect(options.hasDirection(), false);
    });

    test('fromArgs parses arguments correctly', () {
      var args = [
        '--language',
        'en',
        '--direction',
        'RTL',
        '--bold',
        '--icon-start',
        'startIcon',
        '--tooltip',
        'Sample Tooltip'
      ];

      var options = BubblegumElegantFragmentOptions.fromArgs(args);

      expect(options.language, 'en');
      expect(options.direction, TextDirection.rtl);
      expect(options.bold, true);
      expect(options.iconStart, 'startIcon');
      expect(options.tooltip, 'Sample Tooltip');
    });

    test('toString returns correctly formatted string', () {
      var options = BubblegumElegantFragmentOptions(
        language: 'en',
        direction: TextDirection.ltr,
        bold: true,
        italic: true,
        iconStart: 'startIcon',
        iconEnd: 'endIcon',
        tooltip: 'Sample Tooltip',
        id: 'fragment123',
        buttonCaption: 'Click Here',
        buttonIcon: 'buttonIcon',
      );

      expect(
        options.toString(),
        'BubblegumElegantFragmentOptions{language: en, direction: TextDirection.ltr, bold: true, italic: true, iconStart: startIcon, iconEnd: endIcon, tooltip: Sample Tooltip, id: fragment123, buttonCaption: Click Here, buttonIcon: buttonIcon}',
      );
    });
  });
  group('BubblegumElegantRowOptions', () {
    test('should create instance from arguments', () {
      var args = [
        '--rowType',
        'h1',
        '--icon',
        'example_icon',
        '--imageUrl',
        'example.com/image.png',
        '--imageLabel',
        'Example Image',
        '--bulletType',
        'circle'
      ];
      var options = BubblegumElegantRowOptions.fromArgs(args);

      expect(options.rowType, RowType.h1);
      expect(options.icon, 'example_icon');
      expect(options.imageUrl, 'example.com/image.png');
      expect(options.imageLabel, 'Example Image');
      expect(options.bulletType, 'circle');
    });

    test('should create instance with only required parameters', () {
      var args = ['--rowType', 'code'];
      var options = BubblegumElegantRowOptions.fromArgs(args);

      expect(options.rowType, RowType.code);
      expect(options.icon, isNull);
      expect(options.imageUrl, isNull);
      expect(options.imageLabel, isNull);
      expect(options.bulletType, isNull);
    });

    test('should compare two identical instances as equal', () {
      var options1 = BubblegumElegantRowOptions(
          rowType: RowType.quote, imageLabel: 'Quote Image');
      var options2 = BubblegumElegantRowOptions(
          rowType: RowType.quote, imageLabel: 'Quote Image');

      expect(options1, equals(options2));
    });

    test('should correctly print string representation', () {
      var options = BubblegumElegantRowOptions(
          rowType: RowType.bullet, bulletType: 'square');
      expect(options.toString(),
          'BubblegumElegantRowOptions{rowType: RowType.bullet, icon: null, imageUrl: null, imageLabel: null, bulletType: square}');
    });

    test('should handle unknown rowType in arguments', () {
      var args = ['--rowType', 'unknown'];
      expect(() => BubblegumElegantRowOptions.fromArgs(args),
          throwsA(isA<ArgParserException>()));
    });
  });

  group('BubblegumElegantTextOptions', () {
    test('should create instance from arguments', () {
      var args = [
        '--title',
        'My Title',
        '--description',
        'This is a description',
        '--copyright',
        '2024 MyCompany',
        '--license',
        'MIT'
      ];
      var textOptions = BubblegumElegantTextOptions.fromArgs(args);

      expect(textOptions.title, 'My Title');
      expect(textOptions.description, 'This is a description');
      expect(textOptions.copyright, '2024 MyCompany');
      expect(textOptions.license, 'MIT');
    });

    test('should create instance with only required parameters', () {
      var args = ['--title', 'Essential Title'];
      var textOptions = BubblegumElegantTextOptions.fromArgs(args);

      expect(textOptions.title, 'Essential Title');
      expect(textOptions.description, isNull);
      expect(textOptions.copyright, isNull);
      expect(textOptions.license, isNull);
    });

    test('should compare two identical instances as equal', () {
      var options1 = BubblegumElegantTextOptions(
          title: 'Title', description: 'Description');
      var options2 = BubblegumElegantTextOptions(
          title: 'Title', description: 'Description');

      expect(options1, equals(options2));
    });

    test('should correctly print string representation', () {
      var textOptions =
          BubblegumElegantTextOptions(title: 'My Title', license: 'GPL');
      expect(textOptions.toString(),
          'BubblegumElegantTextOptions{title: My Title, description: null, copyright: null, license: GPL}');
    });
  });
}
