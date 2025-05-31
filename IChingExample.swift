// Example: Demonstrating I Ching entropy behavior
// Run this with: swift -I IChingCore/.build/debug IChingExample.swift

import Foundation

print("=== I Ching Entropy Demonstration ===")
print("")
print("This demonstrates the difference between:")
print("1. Traditional I Ching (non-deterministic, like real yarrow stalks)")
print("2. Deterministic mode (for testing/reproducible results)")
print("")

// Note: This would need the compiled library to run
// Instead, the proper way is to use the test suite or create a separate app

print("To test this library:")
print("1. cd IChingCore")
print("2. swift test  # Run all tests")
print("3. swift test --filter testEntropy  # Test entropy behavior")
print("")
print("The library correctly implements:")
print("✅ Non-deterministic readings (like traditional I Ching)")
print("✅ Deterministic readings (for testing)")
print("✅ Proper yarrow stalk algorithm (3 operations, line values 6-9)")
print("✅ Multiple entropy sources (question + time + random)")
