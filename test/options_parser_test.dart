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
}
