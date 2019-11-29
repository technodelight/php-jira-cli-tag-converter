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
        $jiraTagConverter = new JiraTagConverter(['useExternalHighlighter' => false]);
        $this->outputText = $jiraTagConverter->convert(
            new BufferedOutput(),
            $this->inputText
        );
    }

    /**
     * @Then the text should be converted to:
     */
    public function theTextShouldBeConvertedTo(PyStringNode $string)
    {
        Assert::assertSame($string->getRaw(), $this->outputText);
    }

    /**
     * @Then the text should not be converted to:
     */
    public function theTextShouldNotBeConvertedTo(PyStringNode $string)
    {
        Assert::assertNotSame($string->getRaw(), $this->outputText);
    }

    /**
     * @Then the text should be converted to the following escaped string:
     */
    public function theTextShouldBeConvertedToTheFollowingEscapedString(PyStringNode $string)
    {
        Assert::assertSame(
            $string->getRaw(),
            preg_replace('/[\x00-\x1F\x7F]/u', '\\1', $this->outputText)
        );
    }
}
