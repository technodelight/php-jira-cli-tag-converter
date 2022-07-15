Feature: It can render lines

  Scenario: It renders horizontal line up to max text size or terminal width
    Given we have the following text:
    """
    something text something
    ----
    """
    When I convert the text with the terminal width "20"
    Then the text should be converted to:
    """
    something text something
    ────────────────────
    """
