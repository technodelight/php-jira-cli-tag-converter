# php-jira-cli-tag-converter

Convert jira tags to display with ANSI colorised output

## usage

```php
<?php
$tagConverter = new 
$output = new Symfony\Console\ConsoleOutput;
$this->tagConverter->convert($output, $description, ['tabulation' => 8])
```

## license

GNU GPLv3
Copyright (c) 2015-2019 Zsolt Gál
See LICENSE.
