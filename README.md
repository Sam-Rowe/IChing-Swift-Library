# I Ching Swift Library

A Swift library for I Ching divination that implements the traditional yarrow stalk method. This library provides both deterministic (for testing) and non-deterministic (traditional) hexagram generation.

## Features

- ✅ Accurate I Ching line value generation (6, 7, 8, 9) matching traditional yarrow stalk method
- ✅ Proper entropy implementation using multiple sources (question, time, system random)
- ✅ Support for both deterministic and non-deterministic divination
- ✅ Complete hexagram lookup (1-64) with changing lines
- ✅ Comprehensive test suite with 100% pass rate

## Installation

Add this package to your Swift project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/Sam-Rowe/IChing-Swift-Library.git", from: "1.0.1")
]
```

## Usage

### Basic Usage

```swift
import IChingCore

// Ask a question (non-deterministic, traditional I Ching)
let question = "What is the way?"
if let reading = IChing.ask(question) {
    print("Hexagram #\(reading.hexagram.number)")
} else {
    print("Failed to generate reading")
}
```

### Deterministic Usage (for testing)

```swift
import IChingCore

// Generate deterministic readings for testing
let question = "Should I take this path?"
let reading1 = IChing.ask(question, deterministic: true)
let reading2 = IChing.ask(question, deterministic: true)

// Both readings will be identical
if let r1 = reading1, let r2 = reading2 {
    print("Same result? \(r1.hexagram.number == r2.hexagram.number)") // true
}
```

### Multiple Readings Example

```swift
import IChingCore

print("=== Non-deterministic behavior (traditional I Ching) ===")
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
    print("All the same? \(allSame)") // Should typically be false
}

print("\n=== Testing with different questions ===")
let questions = [
    "Should I take this path?",
    "What does the future hold?",
    "How should I approach this situation?"
]

for question in questions {
    if let reading = IChing.ask(question) {
        print("'\(question)' -> Hexagram #\(reading.hexagram.number)")
    }
}
```

## Implementation Details

This library implements the traditional I Ching yarrow stalk divination method:

- **Line Values**: Generates proper I Ching line values (6, 7, 8, 9)
  - 6: Old Yin (changing line, becomes Yang)
  - 7: Young Yang (stable line)
  - 8: Young Yin (stable line)  
  - 9: Old Yang (changing line, becomes Yin)

- **Entropy Sources**: Uses multiple entropy sources for non-deterministic readings:
  - Question text hash
  - Current timestamp
  - System random number generator

- **Algorithm**: Performs three divination operations per line, matching the traditional yarrow stalk method

## Testing

Run the test suite to verify the implementation:

```bash
swift test
```

The test suite includes:
- Line value generation validation
- Distribution testing for all valid values (6, 7, 8, 9)
- Composite value range verification
- Entropy behavior testing
- Deterministic vs non-deterministic comparison

## Algorithm Accuracy

This implementation has been verified against JavaScript reference implementations and produces mathematically correct I Ching line values following the traditional yarrow stalk method. The core algorithm was fixed to perform exactly 3 operations per line generation, ensuring authentic I Ching divination results.

## Thanks and references

Software is a team game and we build on the shoulders of giants. I never forget that. 

With that in mind I want to thank @strobus for the [Node implementation of the I-Ching](https://github.com/strobus/i-ching) that I have used as a reference when I wanted to make this Swift implementation. 

I want to thank Wikipedia for the I-Ching page that helped me understand the process with Yarrow sticks. 

I want to thank Jon Redfern for your support and help with understanding the use cases and giving me the motivation to push myself outside of my boundaries. Go checkout [Jon's music if you haven't already](https://open.spotify.com/artist/1vI7P0C5GpcJcMol09kkKM)

Finally I want to thank GitHub for hosting and GitHub Copilot for helping me fix plenty of bugs along the way.

## License

[MIT License](./LICENSE)
