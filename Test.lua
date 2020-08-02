-- Base test class
-- All the tests should implement this
function Test()

	-- Public methods
	local self      = {}

	-- @var table
	local successes = {}

	-- @var table
	local failures  = {}


	-- Test setup
	--
	-- @return void
	function self.setUp()
		--
	end

	-- Check if two values are equal
	--
	-- @return void
	function self.assertEquals(expected, value)
		local result = expected == value
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that %s equals expected %s', value, expected)
			self.markFailure(message)
		end
	end

	-- Check if two values are NOT equal
	--
	-- @return void
	function self.assertNotEquals(expected, value)
		local result = expected == value
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that %s differs from expected %s', value, expected)
			self.markFailure(message)
		end
	end

	-- Assert that a value is a string
	--
	-- @return void
	function self.assertIsString(value)
		local result = 'string' == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value of type %s is a string', type(value))
			self.markFailure(message)
		end
	end

	-- Assert that a value is nil
	--
	-- @return void
	function self.assertIsNil(value)
		local result = nil == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value %s is nil', value)
			self.markFailure(message)
		end
	end

	-- Assert that a value is boolean
	--
	-- @return void
	function self.assertIsBoolean(value)
		local result = 'boolean' == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value of type %s is a boolean', type(value))
			self.markFailure(message)
		end
	end

	-- Assert that a value is a number
	--
	-- @return void
	function self.assertIsNumber(value)
		local result = 'number' == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value of type %s is a number', type(value))
			self.markFailure(message)
		end
	end

	-- Assert that a value is a function
	--
	-- @return void
	function self.assertIsFunction(value)
		local result = 'function' == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value of type %s is a function', type(value))
			self.markFailure(message)
		end
	end

	-- Assert that a value is a table
	--
	-- @return void
	function self.assertIsTable(value)
		local result = 'table' == type(value)
		if result then
			self.markSuccess()
		else
			local message = string.format('Failed asserting that value of type %s is a table', type(value))
			self.markFailure(message)
		end
	end

	-- Assert that a value is true
	--
	-- @return void
	function self.assertTrue(bool)
		if 'boolean' ~= type(bool) then
			self.markFailure('Cannot compare a non-boolean value with an assertTrue statement')
			return
		end

		if bool then
			self.markSuccess()
		else
			self.markFailure('Cannot assert that false is true')
		end
	end

	-- Assert that a value is false
	--
	-- @return void
	function self.assertFalse(bool)
		if 'boolean' ~= type(bool) then
			self.markFailure('Cannot compare a non-boolean value with an assertTrue statement')
			return
		end

		if not bool then
			self.markSuccess()
		else
			self.markFailure('Cannot assert that true is false')
		end
	end

	-- Record a successful test
	--
	-- @return void
	function self.markSuccess(message)
		if nil == message then
			message = 'OK'
		end

		local success = {
			test    = debug.getinfo(3).source,
			message = message,
		}

		table.insert(successes, success)
	end

	-- Record a failed test
	--
	-- @return void
	function self.markFailure(message)
		if nil == message then
			message = 'Failed!'
		end

		local failure = {
			test    = debug.getinfo(3).source,
			message = message,
		}

		table.insert(failures, failure)
	end

	-- Get the tests result
	--
	-- @return table successes
	-- @return table failures
	function self.getReport()
		return successes, failures
	end

	-- Test destruction
	--
	-- @return void
	function self.tearDown()
		--
	end

	return self
end
