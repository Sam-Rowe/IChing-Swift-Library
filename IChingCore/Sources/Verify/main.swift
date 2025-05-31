import Foundation
import IChingCore

print("Testing I Ching functionality with public API:")

print("\n=== Non-deterministic behavior (traditional I Ching) ===")
let question = "What is the way?"
let reading1 = IChing.ask(question)
let reading2 = IChing.ask(question)
let reading3 = IChing.ask(question)

if let r1 = reading1, let r2 = reading2, let r3 = reading3 {
    print("Same question asked 3 times:")
    print("Reading 1: Hexagram #\(r1.hexagram.number)")
    print("Reading 2: Hexagram #\(r2.hexagram.number)")
    print("Reading 3: Hexagram #\(r3.hexagram.number)")
    
    let allSame = (r1.hexagram.number == r2.hexagram.number) && (r2.hexagram.number == r3.hexagram.number)
    print("All the same? \(allSame) (should typically be false)")
} else {
    print("Failed to generate readings")
}

print("\n=== Deterministic behavior (for testing) ===")
let det1 = IChing.ask(question, deterministic: true)
let det2 = IChing.ask(question, deterministic: true)

if let d1 = det1, let d2 = det2 {
    print("Deterministic readings for '\(question)':")
    print("Reading 1: Hexagram #\(d1.hexagram.number)")
    print("Reading 2: Hexagram #\(d2.hexagram.number)")
    print("Same result? \(d1.hexagram.number == d2.hexagram.number) (should be true)")
} else {
    print("Failed to generate deterministic readings")
}

print("\nTesting with different questions:")
let questions = [
    "Should I take this path?",
    "What does the future hold?",
    "How should I approach this situation?",
    "",
    "!@#$%^&*()"
]

for question in questions {
    if let reading = IChing.ask(question) {
        print("'\(question.isEmpty ? "empty" : question)' -> Hexagram #\(reading.hexagram.number)")
    } else {
        print("'\(question)' -> Failed")
    }
}
