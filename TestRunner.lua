-- Test runner
-- This takes in the list of classes and take cares launching the tests. Counts successes, failures and generates a report
function TestRunner(list)

	-- public methods
	local self          = {}

	-- @var table
	local tests         = {}

	-- @var table
	local successes     = {}

	-- @var table
	local failures      = {}

	-- @var number
	local numberOfTests = 0

	-- Init
	tests               = list

	-- Run the tests
	--
	-- @return void
	function self.run()
		print('Running Emma\'s test suite...')
		print(string.format('%s test classes found.', #tests))

		local test
		for i = 1, #tests do
			test          = require(tests[i])
			for key, value in pairs(test) do
				if string.len(key) > 4 and 'test' == string.sub(key, 1, 4) and 'function' == type(value) then
					numberOfTests = numberOfTests + 1
					test.setUp()
					test[key]()
					test.tearDown()
				end
			end

			local testSuccesses, testFailures = test.getReport()
			for j = 1, #testSuccesses do
				table.insert(successes, testSuccesses[j])
			end
			for z = 1, #testFailures do
				table.insert(failures, testFailures[z])
			end
		end
	end

	-- Print the suite result
	--
	-- @return void
	function self.printReport()
		local errors = 'All tests passed.'
		if #failures > 0 then
			errors = '\27[101;93mERRORS:\27[0m' .. '\n'
		end
		for i = 1, #failures do
			errors = errors .. string.format('%s: %s', failures[i].test, failures[i].message) .. '\n'
		end

		local color = '\27[32;10m'
		if #failures > 0 then
			color = '\27[101;93m'
		end

		local count = string.format(
				'%sResult: %s tests, %s assertions (%s successes, %s failures)%s',
				color,
				numberOfTests,
				#successes + #failures,
				#successes,
				#failures,
				'\27[0m'
		)

		print(errors)
		print(count)
	end

	return self

end