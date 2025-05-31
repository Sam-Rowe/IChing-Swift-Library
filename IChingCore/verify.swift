import Foundation
@testable import IChingCore

var rng = IChing.SeededGenerator(seed: 12345)
print("Testing line value generation:")
var counts = [6: 0, 7: 0, 8: 0, 9: 0]
for _ in 0..<1000 {
    let line = try! IChing.generateALine(using: &rng)
    counts[line] = (counts[line] ?? 0) + 1
}
print("Line value distribution over 1000 generations:")
for (value, count) in counts.sorted(by: { $0.key < $1.key }) {
    print("  \(value): \(count) times (\(Double(count)/10.0)%)")
}

print("\nTesting a full I Ching reading:")
let reading = try! IChing.ask("What is the meaning of life?", seed: 42)
print("Question: What is the meaning of life?")
print("Hexagram: #\(reading.hexagram.number)")
print("Lines: \(reading.hexagram.lines)")
