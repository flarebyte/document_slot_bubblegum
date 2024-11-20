# Architecture decision records

An [architecture
decision](https://cloud.google.com/architecture/architecture-decision-records)
is a software design choice that evaluates:

-   a functional requirement (features).
-   a non-functional requirement (technologies, methodologies, libraries).

The purpose is to understand the reasons behind the current architecture, so
they can be carried-on or re-visited in the future.

## Initial idea

### Problem Description

Create a Flutter widget that acts as a simplified document browser, enabling
users to view and navigate between documents of varying types (rich text,
image, sound, video, etc.). The widget must balance simplicity and
versatility, accommodating future extensibility (e.g., tables, charts) while
ensuring accessibility and usability across languages and devices. The
documents are read-only, may include hyperlinks to other documents, and
follow a structured JSON schema.

### Key Features

1.  **Document Types**:

    -   **Rich Text**: A structured format ("elegant text") using rows with
        fragments styled with attributes (e.g., bold, italic, hyperlinks, RTL
        support). Rows can have specific styles (e.g., headers, quotes, lists).
    -   **Media Documents**: Images, sound, and video with associated metadata
        (e.g., copyright, accessibility information).
    -   **Extensible Types**: Future additions like tables or charts.

2.  **Navigation**:

    -   Browser-like functionality to navigate back and forth between recently
        viewed documents (up to 10).
    -   Clear indication of the oldest and most recent documents.
    -   Avoid tabs to prevent UI clutter.

3.  **Serialization**:

    -   Documents are JSON-compatible, with a common metadata schema (e.g.,
        title) and type-specific schemas.

4.  **UI Requirements**:
    -   Accessible and internationalized, with support for RTL and popular
        languages.
    -   Responsive design using the slot concept from
        [slotboard\_copperframe](https://github.com/flarebyte/slotboard_copperframe).

### Use Cases

1.  **Viewing Rich Text Documents**: Display a page with styled rows and
    fragments. For example:

    -   A document with a title and text formatted with bold, hyperlinks, and a
        blockquote.
    -   A page displaying a bulleted list in RTL with highlighted words.

2.  **Viewing Media Documents**:

    -   A page displaying an image with captions, copyright info, and an
        alt-text for accessibility.
    -   A page playing an audio file with associated metadata (e.g.,
        description, copyright).

3.  **Hyperlink Navigation**: Clicking a hyperlink in a document to open
    another document.

4.  **Back and Forth Navigation**: Returning to a previously viewed document
    or advancing to the next document.

5.  **Resizing**: Adapting the widget to different slot sizes, such as
    adjusting for a sidebar or fullscreen mode.

### Edge Cases

1.  Rich text with mixed languages (LTR and RTL in one row).
2.  Media documents with missing or incomplete metadata.
3.  Navigating to a hyperlink when the target document no longer exists.
4.  Displaying unsupported document types (e.g., unknown type in JSON).
5.  JSON schema with malformed or missing required fields.
6.  Handling a document with excessive content (e.g., very large image or a
    rich text with thousands of rows).

### Limitations

1.  **Tabs**: Avoid tab-based navigation; keep the UI clean and simple.
2.  **Editing**: Documents are strictly read-only and will not support inline
    editing.
3.  **Excessive History**: Navigation is limited to 10 recently viewed
    documents.
4.  **Complex Styling**: The rich text model is opinionated and avoids overly
    complex features like nested elements or advanced typographic effects.
5.  **Unsupported Features**: Ignore document features unrelated to the
    defined schema, such as animations in media or complex vector graphics.

### Future-Proofing

-   Schema should allow extensibility for new document types, ensuring
    minimal disruption to the existing implementation.
-   Design should support easy updates for localization, ensuring smooth
    integration of additional languages and RTL enhancements.
