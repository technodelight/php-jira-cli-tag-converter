Feature: It converts color codes to ANSI sequences

  Scenario: It does something colorful
    Given we have the following text:
    """
    {color:white}this is a white coloured text{color}
    """
    When I convert the text
    Then the text should be converted to the following escaped string:
    """
    [38;2;255;255;255mthis is a white coloured text[39m
    """

  Scenario: It does something colorful
    Given we have the following text:
    """
    {color:#090909}this is a grey coloured text{color}
    """
    When I convert the text
    Then the text should be converted to the following escaped string:
    """
    [38;2;9;9;9mthis is a grey coloured text[39m
    """