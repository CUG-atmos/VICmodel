本文主要介绍如何使用vscode调试R包src中的C函数，Fortran、C++的操作完全相同

1. ctrl+shift+p打开Debug: Open launch.json，把下面的内容粘贴至`.vscode/launch.json` 
(可以跳过本步，.vscode已经存在)

```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "(gdb) 启动",
            "type": "cppdbg",
            "request": "launch",
            "program": "/usr/bin/Rscript",
            "args": [
                "${workspaceFolder}/VIC_debug.R"
            ],
            "stopAtEntry": false,
            "cwd": "${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "gdb",
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                }
            ]
        }
    ]
}
```

# 2. debug
在C语言里设置断点，F5 运行`VIC_debug.R`即可停留在断点处。通过修改launch.json中的
`program`和`agrs`以改变入口程序。
