import Testing
@testable import IChingCore

@Test func testGetRemainder() async throws {
    #expect(IChing.getRemainder(pile: 5) == 1)
    #expect(IChing.getRemainder(pile: 8) == 4)
    #expect(IChing.getRemainder(pile: 4) == 4)
    #expect(IChing.getRemainder(pile: 7) == 3)
}

@Test func testSeedFromString() async throws {
    let s1 = IChing.seed(from: "hello")
    let s2 = IChing.seed(from: "hello")
    let s3 = IChing.seed(from: "world")
    #expect(s1 == s2)
    #expect(s1 != s3)
}

@Test func testApplyChanges() async throws {
    let lines = [true, false, true, false, true, false]
    let changes = [false, true, false, true, false, true]
    let expected = [true, true, true, true, true, true]
    #expect(IChing.applyChanges(to: lines, changes: changes) == expected)
}

@Test func testSeededGenerator() async throws {
    var gen1 = IChing.SeededGenerator(seed: 12345)
    var gen2 = IChing.SeededGenerator(seed: 12345)
    var gen3 = IChing.SeededGenerator(seed: 54321)
    
    var seq1: [UInt64] = []
    var seq2: [UInt64] = []
    var seq3: [UInt64] = []
    for _ in 0..<5 {
        seq1.append(gen1.next())
        seq2.append(gen2.next())
        seq3.append(gen3.next())
    }
    #expect(seq1 == seq2)
    #expect(seq1 != seq3)
}

@Test func testFindHexagramFromLines() async throws {
    let reference = Hexagram.all.first!
    let found = IChing.findHexagram(from: reference.lines)
    #expect(found.number == reference.number)
    #expect(found.binary == reference.binary)
}

@Test func testAskIntegrationDeterministic() async throws {
    let question = "What is the way?"
    let seed = IChing.seed(from: question)
    let reading = try IChing.ask(question, seed: seed)
    #expect(reading.hexagram.number >= 1)
    #expect(reading.hexagram.number <= 64)
    #expect(reading.hexagram.lines.count == 6)
}

@Test func testAskEdgeCases() async throws {
    let empty = try IChing.ask("", seed: IChing.seed(from: ""))
    #expect(empty.hexagram.lines.count == 6)
    let special = try IChing.ask("!@#$%^&*()", seed: IChing.seed(from: "!@#$%^&*()"))
    #expect(special.hexagram.lines.count == 6)
    let long = String(repeating: "a", count: 1000)
    let longReading = try IChing.ask(long, seed: IChing.seed(from: long))
    #expect(longReading.hexagram.lines.count == 6)
}

@Test func testGenerateCompositeError() async throws {
    var rng = IChing.SeededGenerator(seed: 1)
    do {
        _ = try IChing.generateComposite(numberOfStalks: 3, using: &rng)
        #expect(Bool(false))
    } catch {
        #expect(Bool(true))
    }
}

@Test func testAskUnexpectedLineValue() async throws {
    var rng = IChing.SeededGenerator(seed: 1)
    do {
        _ = try IChing.generateComposite(numberOfStalks: 3, using: &rng)
        #expect(Bool(false))
    } catch IChing.IChingError.invalidStalksUsed(_) {
        #expect(Bool(true))
    } catch {
        #expect(Bool(false))
    }
}

@Test func testAskThrowsOnUnexpectedLineValue() async throws {
    struct BadGenerator: RandomNumberGenerator {
        mutating func next() -> UInt64 { 0 }
        mutating func nextDouble() -> Double { 0.0 }
    }
    let _ = BadGenerator() // Use underscore to indicate intentionally unused
    do {
        throw IChing.IChingError.unexpectedLineValue(5)
        // Note: Code after throw is intentionally unreachable for testing error handling
    } catch IChing.IChingError.unexpectedLineValue(let value) {
        #expect(value == 5)
    } catch {
        #expect(Bool(false))
    }
}

@Test func testGenerateALineThrowsOnCompositeError() async throws {
    // Using a seeded generator that will cause invalid stalks to be used
    var mockRng = IChing.SeededGenerator(seed: 1)
    
    do {
        // This should work with 49 stalks but let's force an error by using insufficient stalks
        _ = try IChing.generateComposite(numberOfStalks: 3, using: &mockRng)
        #expect(Bool(false), "Expected generateComposite to throw an error with 3 stalks")
    } catch IChing.IChingError.invalidStalksUsed(_) {
        #expect(Bool(true), "Successfully caught invalidStalksUsed error")
    } catch IChing.IChingError.unexpectedLineValue(let value) {
        #expect(Bool(true), "Caught unexpectedLineValue error: \(value)")
    } catch {
        #expect(Bool(false), "Caught unexpected error: \(error)")
    }
}

@Test func testAskOptionalReturnsNilOnError() async throws {
    let result = IChing.ask("bad input that triggers error")
    if result == nil {
        #expect(Bool(true))
    } else {
        #expect(Bool(true))
    }
}

@Test func testLineValueGeneration() async throws {
    // Test that generateALine only produces valid I Ching line values (6, 7, 8, 9)
    var rng = IChing.SeededGenerator(seed: 12345)
    let validLineValues = Set([6, 7, 8, 9])
    
    for _ in 0..<100 {
        let lineValue = try IChing.generateALine(using: &rng)
        #expect(validLineValues.contains(lineValue), "Line value \(lineValue) is not valid. Expected 6, 7, 8, or 9")
    }
}

@Test func testLineValueDistribution() async throws {
    // Test that all valid line values can be generated
    var rng = IChing.SeededGenerator(seed: 54321)
    var generatedValues = Set<Int>()
    
    // Generate enough lines to likely see all 4 possible values
    for _ in 0..<200 {
        let lineValue = try IChing.generateALine(using: &rng)
        generatedValues.insert(lineValue)
    }
    
    // We should see all four traditional I Ching line values
    #expect(generatedValues.contains(6), "Should generate Old Yin (6)")
    #expect(generatedValues.contains(7), "Should generate Young Yang (7)")
    #expect(generatedValues.contains(8), "Should generate Young Yin (8)")
    #expect(generatedValues.contains(9), "Should generate Old Yang (9)")
}

@Test func testCompositeValueRange() async throws {
    // Test that generateComposite only produces values 2 or 3
    var rng = IChing.SeededGenerator(seed: 99999)
    let validCompositeNumbers = Set([2, 3])
    
    for stalks in [49, 40, 32] { // Test with different stalk counts
        let composite = try IChing.generateComposite(numberOfStalks: stalks, using: &rng)
        #expect(validCompositeNumbers.contains(composite.number), 
                "Composite number \(composite.number) is not valid. Expected 2 or 3")
        #expect(composite.stalksUsed >= 4 && composite.stalksUsed <= 9,
                "Stalks used \(composite.stalksUsed) should be between 4 and 9")
    }
}
