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

## Stack concept

### Problem Description

Develop a documentation panel in Flutter using Material 3 that mimics a
simplified browser with support for managing document stacks. The panel will
allow users to manage multiple stacks of documents, with limits on the number
of stacks and documents per stack. The UI should provide an intuitive way to
navigate between stacks and within documents in a stack while ensuring
logical organization of the stacks and documents based on user interactions.

### Features and Requirements

1.  **Document Stack Management**

    -   Users can open and manage up to **10 stacks** (maximum limit).
    -   Each stack contains up to **10 documents**, with the first document
        fixed as the **main document** at the top of the stack.
    -   A new stack is always added at position **1** (index 0), shifting other
        stacks down. If the limit is exceeded, the **oldest stack** is removed.
    -   A document added to a stack is inserted below the main document and
        cannot replace it.

2.  **Navigation and UI Components**

    -   The UI provides numbered or lettered **buttons for stack selection**.
    -   Each button displays a tooltip with the **stack's title**.
    -   Within a stack, **breadcrumbs** or a similar mechanism are used to
        access all open documents in the stack.
    -   Clicking a breadcrumb brings the user to the corresponding document in
        the stack.

3.  **Stack Operations**

    -   Users can delete a stack, which removes it from the panel and
        reorganizes the remaining stacks accordingly.
    -   Deleting a document in a stack does not affect the main document's
        position. Remaining documents are reorganized.
    -   Users can clear all stacks with a single action.

4.  **Duplicate Stacks and Documents**

    -   A stack cannot duplicate if reopened as a **new stack**.
    -   A document may appear in multiple stacks independently.

5.  **Document Types and Indicators**
    -   Buttons for directly accessing documents reflect their **type** (e.g.,
        icon for text, image, etc.).

### Use Cases

1.  **Opening Stacks and Documents**

    -   User opens a stack (e.g., "Project A"). It appears at index 0, shifting
        others.
    -   User adds a document to the stack. It is placed below the main
        document.

2.  **Reorganizing Stacks**

    -   User adds a new stack, exceeding the 10-stack limit. The oldest stack
        is discarded.
    -   User reopens an existing stack as new. It is moved to the top.

3.  **Document Deletion and Navigation**

    -   User deletes a document, and the stack reorganizes while preserving the
        main document.
    -   User deletes a stack, and other stacks shift positions.

4.  **Clear All Stacks**

    -   User clears all stacks, resetting the panel.

5.  **Breadcrumb Navigation**
    -   User navigates through a stack using breadcrumbs to quickly switch
        between documents.

### Edge Cases

1.  Adding a document to a stack already at its limit (10 documents).

    -   Oldest non-main document is removed.

2.  Reopening an existing stack as new.

    -   The same stack appears twice, once at index 0 and its original
        position.

3.  Adding a stack or document when at maximum capacity.

    -   The oldest stack or document is discarded appropriately.

4.  Clearing all stacks when none exist.

    -   No action or a user notification indicating no stacks to clear.

5.  Accessing a document that exists in multiple stacks.
    -   Ensure proper navigation in each stack context.

### Limitations

-   **No Network Browsing**: The panel is limited to document stacks and
    does not allow for browsing the web.
-   **No Deep Merging**: Reopening a stack as new does not merge it with
    the existing instance.
-   **No Nested Stacks**: Stacks cannot contain other stacks.
-   **No Complex Document Types**: Document handling is limited to basic
    type representation (e.g., text, image).
-   **No Persistent State**: Changes to stacks and documents are not
    retained across sessions unless explicitly implemented.
