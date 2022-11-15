<?php

namespace Technodelight\JiraTagConverter\Components;

class DelimiterBasedStringParser
{
    private $startDelimiter;
    private $endDelimiter;

    public function __construct($startDelimiter, $endDelimiter)
    {
        $this->startDelimiter = $startDelimiter;
        $this->endDelimiter = $endDelimiter;
    }

    public function parse($string): array
    {
        // code block
        $startCode = false;
        $buffer = '';
        $collected = [];
        $strlen = strlen($string);
        for ($i = 0; $i < $strlen; $i++) {
            $char = substr($string, $i, 1);
            $startPeek = substr($string, $i, strlen($this->startDelimiter));
            $endPeek = substr($string, $i, strlen($this->endDelimiter));
            if ($startPeek === $this->startDelimiter && !$startCode) {
                $startCode = true;
                $buffer = $startPeek;
                $i+= (strlen($this->startDelimiter) - 1);
            } else if ($startCode && $endPeek === $this->endDelimiter) {
                $startCode = false;
                $buffer.= $startPeek;
                $collected[] = $buffer;
                $i+= (strlen($this->endDelimiter) - 1);
            } else if ($startCode) {
                $buffer.= $char;
            }
        }

        return $collected;
    }
}
