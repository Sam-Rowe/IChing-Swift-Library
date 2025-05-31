// This script demonstrates how to test internal APIs using @testable import
// Run with: swift -I .build/debug -L .build/debug -lIChingCore internal-verify.swift

import Foundation

// Note: This approach would require @testable import which isn't available 
// from a regular executable. Instead, we can add additional tests to the test suite
// for internal API verification.

print("For testing internal APIs like SeededGenerator and generateALine,")
print("please add tests to the IChingCoreTests.swift file using @testable import.")
print("")
print("The current verify executable demonstrates the public API functionality.")
print("Run 'swift run verify' to test the public interface.")
print("")
print("To add internal API tests:")
print("1. Open Tests/IChingCoreTests/IChingCoreTests.swift")
print("2. Add new @Test functions that use @testable import IChingCore")
print("3. Run 'swift test' to execute all tests including internal API tests")
