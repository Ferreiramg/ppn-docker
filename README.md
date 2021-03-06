# ppn-docker
PHP + Postgress + Nginx Docker server

# Usage

Clone repo and run command.
```shell
cd ppn-docker &&
docker-compose up --build
```

# App Root

Copy source code to: `\html`

# VSCode xdebug

1. Install vscode extension.
[PHP Debug](https://marketplace.visualstudio.com/items?itemName=felixfbecker.php-debug)

2.  Config `launch.json` file.
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "xDebug listen",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "stopOnEntry": true,
            "pathMappings": {
                "/var/www/html": "${workspaceFolder}"
            },
            "ignore": ["**/vendor/**/*.php"],
            "xdebugSettings": {
                "max_children": 10000,
                "max_data": 10000,
                "show_hidden": 1
            }
        },
        {
            "name": "Launch currently open script",
            "type": "php",
            "request": "launch",
            "program": "${file}",
            "cwd": "${fileDirname}",
            "port": 9000
        }
    ]
}
```