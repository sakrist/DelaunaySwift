import XCTest

import DelaunayTests

var tests = [XCTestCaseEntry]()
tests += DelaunayTests.allTests()
XCTMain(tests)
