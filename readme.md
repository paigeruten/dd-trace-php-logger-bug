1. Build and run docker container:

```
$ docker build . -t php-bug-test
$ docker run -it --name php-bug-test --net=host php-bug-test /bin/bash
```

2. Set up debugger on the host, with paths mapped to `/usr/src/myapp`. Example VSCode `launch.json` config:

```json
{
    "name": "Listen for Xdebug",
    "type": "php",
    "request": "launch",
    "port": 9003,
    "pathMappings": {
        "/usr/src/myapp": "${workspaceFolder}"
    }
}
```

3. Set breakpoints on lines 13 and 15 of `test.php`:

```php
$logger = new MyLogger();
echo 'a'; // BREAKPOINT
$logger->info();
echo "b\n"; // BREAKPOINT
```

4. In container, run PHP script with ddtrace and step debugging enabled:

```
# XDEBUG_MODE=debug XDEBUG_SESSION=1 DD_TRACE_CLI_ENABLED=true php test.php
```

5. After it stops at the first breakpoint, hit "resume" in the debugger, and it will finish the script instead of hitting the second breakpoint.
