Feature: It converts code blocks unformatted

  Scenario: It converts a code block
    Given we have the following text:
    """
    {code}this is a code block{code}
    """
    When I convert the text
    Then the text should be converted to:
    """
    <comment>this is a code block</>
    """

  Scenario: It converts a code block with syntax
    Given we have the following text:
    """
    {code:php}this is a code block{code}
    """
    When I convert the text
    Then the text should be converted to:
    """
    <comment>this is a code block</>
    """

  Scenario: It converts a code block while having code block contents intact
    Given we have the following text:
    """
    {code}this is a code block *with formatting* and things like emoji :){code}
    """
    When I convert the text
    Then the text should be converted to:
    """
    <comment>this is a code block *with formatting* and things like emoji :)</>
    """