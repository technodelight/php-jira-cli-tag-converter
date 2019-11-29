Feature: It converts from Jira markup to CLI colored output

  Scenario: It can convert bold text
    Given we have the following text:
    """
    This should be *bold*
    """
    When I convert the text
    Then than text should be converted to:
    """
    This should be <options=bold>bold</>
    """

  Scenario: It can convert underscore
    Given we have the following text:
    """
    This should be _underscore_
    """
    When I convert the text
    Then than text should be converted to:
    """
    This should be <options=underscore>underscore</>
    """

  Scenario: It can convert bold and underscore
    Given we have the following text:
    """
    This should be *_underscore_*
    """
    When I convert the text
    Then than text should be converted to:
    """
    This should be <options=bold,underscore>underscore</>
    """

  Scenario: It can convert alternate bold and underscore
    Given we have the following text:
    """
    This should be _*underscore*_
    """
    When I convert the text
    Then than text should be converted to:
    """
    This should be <options=underscore,bold>underscore</>
    """

  Scenario: It should not convert bold syntax across lines
    Given we have the following text:
    """
    This should be *underscore
     and something else*
    """
    When I convert the text
    Then than text should be converted to:
    """
    This should be *underscore
     and something else*
    """

  Scenario: It should not convert bold syntax at the beginning of line followed by white space
    Given we have the following text:
    """
     *     this should be a bullet point*
    """
    When I convert the text
    Then than text should be converted to:
    """
    <options=...>this should be a bullet point*</>
    """
