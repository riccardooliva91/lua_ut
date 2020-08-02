require("lua_ut.TestsLoader")
require("lua_ut.TestRunner")

local suite  = TestsLoader()
local runner = TestRunner(suite.getTests())

runner.run()
runner.printReport()