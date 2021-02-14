<?php

$redis_host = file_get_contents('/tmp/redis_host');
$redis_port = file_get_contents('/tmp/redis_port');
$redis_pass = file_get_contents('/run/secrets/redis_password');

echo '<pre>';
echo "$redis_host\n";
echo "$redis_port\n";
echo "$redis_pass\n";
