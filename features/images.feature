Feature: It highlights images

  Scenario: It highlights images
    Given we have the following text:
    """
    This is a nice inline image !image_name.jpg! followed with text!
    """
    When I convert the text
    Then the text should be converted to the following escaped string:
    """
    This is a nice inline image <fg=cyan>image_name.jpg</> followed with text!
    """

  Scenario: It highlights thumbnails as well
    Given we have the following text:
    """
    This is a nice inline image !image_name.jpg|thumbnail! followed with text!
    """
    When I convert the text
    Then the text should be converted to the following escaped string:
    """
    This is a nice inline image <fg=cyan>image_name.jpg</> followed with text!
    """
