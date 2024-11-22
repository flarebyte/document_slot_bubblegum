import 'package:args/args.dart';

class BubblegumElegantOptionsParser {
  static final fragmentParser = ArgParser()
    ..addOption(
      'language',
      abbr: 'l',
      help: 'Language code (e.g., en, es)',
    )
    ..addOption(
      'direction',
      abbr: 'd',
      help: 'Text direction (RTL, LTR, auto)',
      allowed: ['RTL', 'LTR', 'auto'],
    )
    ..addFlag(
      'bold',
      help: 'Whether the text is bold',
      defaultsTo: false,
    )
    ..addFlag(
      'italic',
      help: 'Whether the text is italic',
      defaultsTo: false,
    )
    ..addOption(
      'icon-start',
      help: 'Icon name for the start of the text',
    )
    ..addOption(
      'icon-end',
      help: 'Icon name for the end of the text',
    )
    ..addOption(
      'tooltip',
      help: 'Tooltip text for the fragment',
    )
    ..addOption(
      'id',
      help: 'Unique identifier for the text fragment',
    )
    ..addOption(
      'button-caption',
      help: 'Caption for an associated button',
    )
    ..addOption(
      'button-icon',
      help: 'Icon name for an associated button',
    );
}
  