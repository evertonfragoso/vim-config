local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Open UI automatically
dap.listeners.after.event_initialized["dapui"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui"] = function()
	dapui.close()
end

---------------------------
-- PYTHON DEBUGGING
---------------------------
dap.adapters.python = {
	type = "executable",
	command = "python3",
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
	},
}

---------------------------
-- NODE (JS/TS)
---------------------------
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { "/usr/local/bin/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
	},
}

dap.configurations.typescript = dap.configurations.javascript

---------------------------
-- RUBY
---------------------------
dap.adapters.ruby = {
	type = "executable",
	command = "rdbg",
	args = { "-n", "--open", "--port", "12345" },
}

dap.configurations.ruby = {
	{
		type = "ruby",
		name = "Debug current file",
		request = "launch",
		program = "${file}",
	},
}
