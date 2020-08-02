require("test.TestsLoader")
require("test.TestRunner")

local suite  = TestsLoader()
local runner = TestRunner(suite.getTests())

runner.run()
runner.printReport()