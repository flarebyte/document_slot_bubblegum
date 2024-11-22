import 'package:args/args.dart';

/// Enumeration for text direction options
enum TextDirection { rtl, ltr, auto, notSupported }

/// A class representing the options for a Bubblegum Elegant Fragment
class BubblegumElegantFragmentOptions {
  /// Language code for the fragment (e.g., 'en', 'es')
  String? language;

  /// Direction of the text (RTL, LTR, auto)
  TextDirection? direction;

  /// Whether the text is bold
  bool bold;

  /// Whether the text is italic
  bool italic;

  /// Icon name for the start of the text
  String? iconStart;

  /// Icon name for the end of the text
  String? iconEnd;

  /// Tooltip text for the fragment
  String? tooltip;

  /// Unique identifier for the text fragment
  String? id;

  /// Caption for an associated button
  String? buttonCaption;

  /// Icon name for an associated button
  String? buttonIcon;

  /// Constructor for creating an instance of BubblegumElegantFragmentOptions
  BubblegumElegantFragmentOptions({
    this.language,
    this.direction,
    this.bold = false,
    this.italic = false,
    this.iconStart,
    this.iconEnd,
    this.tooltip,
    this.id,
    this.buttonCaption,
    this.buttonIcon,
  });

  /// Sets the text direction for the fragment
  void setDirection(String? direction) {
    switch (direction) {
      case "RTL":
        this.direction = TextDirection.rtl;
        break;
      case "LTR":
        this.direction = TextDirection.ltr;
        break;
      case "auto":
        this.direction = TextDirection.auto;
        break;
      default:
        this.direction = TextDirection.notSupported;
    }
  }

  /// Checks if the language field has a value
  bool hasLanguage() => language != null;

  /// Checks if the direction field has a value
  bool hasDirection() => direction != null;

  /// Checks if the iconStart field has a value
  bool hasIconStart() => iconStart != null;

  /// Checks if the iconEnd field has a value
  bool hasIconEnd() => iconEnd != null;

  /// Checks if the tooltip field has a value
  bool hasTooltip() => tooltip != null;

  /// Checks if the id field has a value
  bool hasId() => id != null;

  /// Checks if the buttonCaption field has a value
  bool hasButtonCaption() => buttonCaption != null;

  /// Checks if the buttonIcon field has a value
  bool hasButtonIcon() => buttonIcon != null;

  /// Factory method to create an instance of BubblegumElegantFragmentOptions from a list of command line arguments
  static BubblegumElegantFragmentOptions fromArgs(List<String> options) {
    var parser = ArgParser()
      ..addOption('language')
      ..addOption('direction')
      ..addFlag('bold', defaultsTo: false)
      ..addFlag('italic', defaultsTo: false)
      ..addOption('icon-start')
      ..addOption('icon-end')
      ..addOption('tooltip')
      ..addOption('id')
      ..addOption('button-caption')
      ..addOption('button-icon');

    var results = parser.parse(options);

    return BubblegumElegantFragmentOptions(
      language: results['language'],
      direction: results['direction'] != null
          ? _parseDirection(results['direction'])
          : null,
      bold: results['bold'],
      italic: results['italic'],
      iconStart: results['icon-start'],
      iconEnd: results['icon-end'],
      tooltip: results['tooltip'],
      id: results['id'],
      buttonCaption: results['button-caption'],
      buttonIcon: results['button-icon'],
    );
  }

  /// Helper method to parse a string into a [TextDirection] enum value
  static TextDirection _parseDirection(String direction) {
    switch (direction) {
      case "RTL":
        return TextDirection.rtl;
      case "LTR":
        return TextDirection.ltr;
      case "auto":
        return TextDirection.auto;
      default:
        return TextDirection.notSupported;
    }
  }

  @override
  String toString() {
    return 'BubblegumElegantFragmentOptions{language: \$language, direction: \$direction, bold: \$bold, italic: \$italic, iconStart: \$iconStart, iconEnd: \$iconEnd, tooltip: \$tooltip, id: \$id, buttonCaption: \$buttonCaption, buttonIcon: \$buttonIcon}';
  }
}
