Feature: It converts quotes

  Scenario: It converts quotes as intended
    Given we have the following text:
    """
    {quote}single line quote{quote}
    """
    When I convert the text
    Then the text should be converted to:
    """
    │ single line quote
    """

  Scenario: It converts multi line quotes as intended
    Given we have the following text:
    """
    {quote}multi line quote
    is just two rows
    {quote}
    and so on
    """
    When I convert the text
    Then the text should be converted to:
    """
    │ multi line quote
    │ is just two rows
    and so on
    """

  Scenario: It converts inline quotes to multiple rows
    # here the "an{qoute}" is intentional, as auto formatting would strip the empty space from the end of expectation line
    # thus breaking the scenario each time auto formatting kicks in in this file
    Given we have the following text:
    """
    This should be an{quote}inline quote{quote} followed by text
    """
    When I convert the text
    Then the text should be converted to:
    """
    This should be an
    │ inline quote
     followed by text
    """