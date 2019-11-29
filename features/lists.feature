Feature: It converts from Jira markup to CLI colored output

  Scenario: It converts bullet points from asterisk
    Given we have the following text:
    """
     * this should be a bullet point*
    """
    When I convert the text
    Then the text should be converted to:
    """
     • this should be a bullet point*
    """

  Scenario: It converts two bullet points to indented list
    Given we have the following text:
    """
     ** this should be a bullet point*
    """
    When I convert the text
    Then the text should be converted to:
    """
         • this should be a bullet point*
    """

  Scenario: It converts three bullet points to indented list
    Given we have the following text:
    """
     *** this should be a bullet point*
    """
    When I convert the text
    Then the text should be converted to:
    """
             • this should be a bullet point*
    """

  Scenario: It converts hash tags
    Given we have the following text:
    """
     ### this should be a bullet point*
    """
    When I convert the text
    Then the text should be converted to:
    """
             • this should be a bullet point*
    """
