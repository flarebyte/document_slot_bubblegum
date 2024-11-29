import 'package:document_slot_bubblegum/src/elegant_text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CopperframeElegantFragment', () {
    test('fromJson creates a valid instance', () {
      final json = {
        'options': ['bold', 'italic'],
        'text': 'Sample Text',
      };

      final fragment = CopperframeElegantFragment.fromJson(json);

      expect(fragment.options, ['bold', 'italic']);
      expect(fragment.text, 'Sample Text');
    });

    test('toJson outputs correct JSON', () {
      const fragment = CopperframeElegantFragment(
        options: ['bold', 'italic'],
        text: 'Sample Text',
      );

      final json = fragment.toJson();

      expect(json, {
        'options': ['bold', 'italic'],
        'text': 'Sample Text',
      });
    });
  });

  group('CopperframeElegantRow', () {
    test('fromJson creates a valid instance', () {
      final json = {
        'options': ['h1', 'h2'],
        'fragments': [
          {
            'options': ['bold'],
            'text': 'Fragment 1'
          },
          {
            'options': ['italic'],
            'text': 'Fragment 2'
          },
        ],
      };

      final row = CopperframeElegantRow.fromJson(json);

      expect(row.options, ['h1', 'h2']);
      expect(row.fragments.length, 2);
      expect(row.fragments[0].text, 'Fragment 1');
      expect(row.fragments[1].options, ['italic']);
    });

    test('toJson outputs correct JSON', () {
      const row = CopperframeElegantRow(
        options: ['h1', 'h2'],
        fragments: [
          CopperframeElegantFragment(options: ['bold'], text: 'Fragment 1'),
          CopperframeElegantFragment(options: ['italic'], text: 'Fragment 2'),
        ],
      );

      final json = row.toJson();

      expect(json, {
        'options': ['h1', 'h2'],
        'fragments': [
          {
            'options': ['bold'],
            'text': 'Fragment 1'
          },
          {
            'options': ['italic'],
            'text': 'Fragment 2'
          },
        ],
      });
    });
  });

  group('CopperframeElegantText', () {
    test('fromJson creates a valid instance', () {
      final json = {
        'options': ['title', 'description'],
        'rows': [
          {
            'options': ['h1'],
            'fragments': [
              {
                'options': ['bold'],
                'text': 'Fragment 1'
              },
            ],
          },
        ],
      };

      final text = CopperframeElegantSection.fromJson(json);

      expect(text.options, ['title', 'description']);
      expect(text.rows.length, 1);
      expect(text.rows[0].fragments[0].text, 'Fragment 1');
    });

    test('toJson outputs correct JSON', () {
      const text = CopperframeElegantSection(
        options: ['title', 'description'],
        rows: [
          CopperframeElegantRow(
            options: ['h1'],
            fragments: [
              CopperframeElegantFragment(
                options: ['bold'],
                text: 'Fragment 1',
              ),
            ],
          ),
        ],
      );

      final json = text.toJson();

      expect(json, {
        'options': ['title', 'description'],
        'rows': [
          {
            'options': ['h1'],
            'fragments': [
              {
                'options': ['bold'],
                'text': 'Fragment 1'
              },
            ],
          },
        ],
      });
    });
  });
}
