local dap = require("dap")

-- 🔹 C e C++ (usando codelldb)
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" }
    }
}

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
    }
}

dap.configurations.cpp = {
    {
        name = "Launch C++ Program",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    }
}
dap.configurations.c = dap.configurations.cpp -- Usa a mesma configuração para C

-- 🔹 Python (usando debugpy)
dap.adapters.python = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
    args = { "-m", "debugpy.adapter" }
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Python Debug",
        program = "${file}",
        pythonPath = function()
            return "/usr/bin/python3"
        end
    }
}

-- 🔹 JavaScript e TypeScript (Node.js)
dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { vim.fn.stdpath("data") .. "/mason/bin/vscode-node-debug2/out/src/nodeDebug.js" }
}

dap.configurations.javascript = {
    {
        type = "node2",
        request = "launch",
        name = "Debug JS",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
    }
}

dap.configurations.typescript = dap.configurations.javascript

