<?php

use Behat\Behat\Context\Context;
use Behat\Behat\Tester\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;
use PHPUnit\Framework\Assert;
use Symfony\Component\Console\Output\BufferedOutput;
use Technodelight\JiraTagConverter\JiraTagConverter;

/**
 * Defines application features from the specific context.
 */
class FeatureContext implements Context
{
    /**
     * @var string
     */
    private $inputText;
    /**
     * @var string
     */
    private $outputText;

    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
     * @Given we have the following text:
     */
    public function weHaveTheFollowingText(PyStringNode $string)
    {
        $this->inputText = $string->getRaw();
    }

    /**
     * @When I convert the text
     */
    public function iConvertTheText()
    {
        $jiraTagConverter = new JiraTagConverter();
        $this->outputText = $jiraTagConverter->convert(
            new BufferedOutput(),
            $this->inputText
        );
    }

    /**
     * @Then than text should be converted to:
     */
    public function thanTextShouldBeConvertedTo(PyStringNode $string)
    {
        $expectedOutputText = $string->getRaw();
        Assert::assertSame($expectedOutputText, $this->outputText);
    }
}
