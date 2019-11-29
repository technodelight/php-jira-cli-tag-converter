Feature: It converts attachments

  Scenario: It can convert attachments nicely
    Given we have the following text:
    """
    [^attached_file.jpg]
    """
    When I convert the text
    Then the text should be converted to the following escaped string:
    """
    🔗<fg=cyan>attached_file.jpg</>
    """
