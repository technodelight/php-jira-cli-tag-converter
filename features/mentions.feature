Feature: It can convert mentions

  Scenario: It converts mentions
    Given we have the following text:
    """
    [~zenc]
    """
    When I convert the text
    Then the text should be converted to:
    """
    <fg=cyan>zenc</>
    """
