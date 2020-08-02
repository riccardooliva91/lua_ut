-- Tests loader class
-- This will make a list of all the tests, filtering out other files
function TestsLoader()

	-- Public methods
	local self  = {}

	-- @var table
	local tests = {}

	-- Load the tests from the subdirectories
	--
	-- @return void
	function self.loadTests()
		if #tests > 0 then
			return
		end

		local popen = io.popen
		if self.isLinux() then
			error(' At the moment only windows is supported.')
		end

		local pfile = popen('dir .\\lua_ut /a-D /S /B')
		for filename in pfile:lines() do
			if string.match(filename, 'test[-][A-Za-z]') then
				local i  = string.find(filename, '\\test\\') + 1
				filename = string.sub(filename, i)
				filename = string.gsub(filename, '.lua', '')
				filename = string.gsub(filename, '\\', '.')
				table.insert(tests, filename)
			end
		end
		pfile:close()
	end

	-- Get the list of tests
	--
	-- @return table
	function self.getTests()
		return tests
	end

	-- Detect if we are on linux
	--
	--@return bool
	function self.isLinux()
		return '/' == package.config:sub(1, 1)
	end

	-- Detect if we are on windows
	--
	--@return bool
	function self.isWindows()
		return '\\' == package.config:sub(1, 1)
	end

	self.loadTests()

	return self
end
