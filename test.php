<?php

require_once __DIR__.'/LoggerInterface.php';

class MyLogger implements Psr\Log\LoggerInterface
{
    public function info()
    {
    }
}

$logger = new MyLogger();
echo 'a';
$logger->info();
echo "b\n";
