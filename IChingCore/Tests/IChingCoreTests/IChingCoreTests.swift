import Testing
@testable import IChingCore

@Test func testGetRemainder() async throws {
    #expect(IChing.getRemainder(pile: 5) == 1)
    #expect(IChing.getRemainder(pile: 8) == 4) // 8 % 4 == 0, so should return 4
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
    #expect(seq1 == seq2) // Same seed, same sequence
    #expect(seq1 != seq3) // Different seed, different sequence
}

@Test func testFindHexagramFromLines() async throws {
    // Use the first hexagram in the list as a reference
    let reference = Hexagram.all.first!
    let found = IChing.findHexagram(from: reference.lines)
    #expect(found.number == reference.number)
    #expect(found.binary == reference.binary)
}

@Test func testAskIntegrationDeterministic() async throws {
    let question = "What is the way?"
    let seed = IChing.seed(from: question)
    let reading = IChing.ask(question, seed: seed)
    // Check reading is not nil and hexagram is valid
    #expect(reading.hexagram.number >= 1)
    #expect(reading.hexagram.lines.count == 6)
}

@Test func testAskEdgeCases() async throws {
    let empty = IChing.ask("", seed: IChing.seed(from: ""))
    #expect(empty.hexagram.lines.count == 6)
    let special = IChing.ask("!@#$%^&*()", seed: IChing.seed(from: "!@#$%^&*()"))
    #expect(special.hexagram.lines.count == 6)
    let long = String(repeating: "a", count: 1000)
    let longReading = IChing.ask(long, seed: IChing.seed(from: long))
    #expect(longReading.hexagram.lines.count == 6)
}

@Test func testGenerateCompositeError() async throws {
    var rng = IChing.SeededGenerator(seed: 1)
    do {
        _ = try IChing.generateComposite(numberOfStalks: 3, using: &rng) // Too few stalks
        #expect(false) // Should not reach here
    } catch {
        #expect(true) // Should throw
    }
}
