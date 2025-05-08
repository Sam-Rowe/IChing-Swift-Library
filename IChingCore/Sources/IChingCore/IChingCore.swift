// The Swift Programming Language
// https://docs.swift.org/swift-book

// Import a seed for randomness from the crypto library
import Foundation




public class IChing {
    private var entropy: Double = 0.0
    
    public static func ask(_ question: String) -> Reading? {
        let seed = seed(from: question)
        return try? ask(question, seed: seed)
    }
    
    // Now throws on error
    static func ask(_ question: String, seed: UInt64) throws -> Reading {
        var rng = SeededGenerator(seed: seed)
        var hexagramReadingLines: [Int] = []
        var changingReadingLines: [Int] = []
        for _ in 0..<6 {
            let line = try generateALine(using: &rng)
            switch line {
            case 9:
                hexagramReadingLines.append(1)
                changingReadingLines.append(1)
            case 8:
                hexagramReadingLines.append(0)
                changingReadingLines.append(0)
            case 7:
                hexagramReadingLines.append(1)
                changingReadingLines.append(0)
            case 6:
                hexagramReadingLines.append(0)
                changingReadingLines.append(1)
            default:
                throw IChingError.unexpectedLineValue(line)
            }
        }
        let hexagramLinesBool = hexagramReadingLines.map { $0 == 1 }
        let hexagram = findHexagram(from: hexagramLinesBool)
        return Reading(question: question, hexagram: hexagram, change: nil)
    }
    
    internal struct composite {
        var stalksUsed: Int
        var number: Int
    }
    
    
    internal static func generateALine(using rng: inout SeededGenerator) throws -> Int {
        var stalks: Int = 49
        var lineSum = 0
        for _ in 1..<3 {
            let comp = try generateComposite(numberOfStalks: stalks, using: &rng)
            stalks -= comp.stalksUsed
            lineSum += comp.number
        }
        return lineSum
    }
    
    enum IChingError: Error {
        case invalidStalksUsed(Int)
        case unexpectedState
        case unexpectedLineValue(Int)
    }
    
    
    internal static func generateComposite(numberOfStalks: Int, using rng: inout SeededGenerator) throws -> composite {
        var returnValue: composite = composite(stalksUsed: 0, number: 0)
        var stalksUsed: Int = 0
        var remainder: Int = 0
        var leftPileSize = Int(ceil(rng.nextDouble() * Double(numberOfStalks - 9) + 4))
        var rightPileSize = numberOfStalks - leftPileSize
        
        // Take one stalk from right pile and put it between the little finger and the next finger on the left hand
        rightPileSize -= 1
        stalksUsed += 1
        
        // Take bundles of 4 from the left pile until 4 or less remain
        // Place between the middle and ring finger on left hand
        remainder = getRemainder(pile: leftPileSize)
        leftPileSize -= remainder
        stalksUsed += remainder
        
        // Take Bundles of 4 from the right pile until there are less than 4 remaining
        // Place them between the middle and ring fingers on the left hand
        remainder = getRemainder(pile: rightPileSize)
        rightPileSize -= remainder
        stalksUsed += remainder
        
        returnValue.stalksUsed = stalksUsed
        
        if stalksUsed == 9 || stalksUsed == 8 {
            returnValue.number = 2
        } else if stalksUsed == 5 || stalksUsed == 4 {
            returnValue.number = 3
        } else {
            throw IChingError.invalidStalksUsed(stalksUsed)
        }
        
        return returnValue
        
    }
    
    internal static func getRemainder(pile: Int) -> Int {
        let rem = pile % 4
        if rem == 0 {
            return 4
        }
        return rem
    }
    
    internal static func seed(from string: String) -> UInt64 {
        var hasher = Hasher()
        hasher.combine(string)
        return UInt64(bitPattern: Int64(hasher.finalize()))
    }

    internal struct SeededGenerator: RandomNumberGenerator {
        private var state: UInt64

        init(seed: UInt64) {
            self.state = seed != 0 ? seed : 0xdeadbeef
        }

        mutating func next() -> UInt64 {
            state = 6364136223846793005 &* state &+ 1
            return state
        }

        mutating func nextDouble() -> Double {
            return Double(next()) / Double(UInt64.max)
        }
    }


    private static func floatFromStringSeed(_ string: String) -> Double {
        var rng = SeededGenerator(seed: seed(from: string))
        return Double(rng.next() % UInt64.max) / Double(UInt64.max)
    }

    private func getTrueRandomFloat() -> Double {
        return Double.random(in: 0.0 ... 1.0)
    }
    

    private static func generateHexagramLines() -> [Bool] {
        return (0..<6).map { _ in Bool.random() }
    }

    private static func generateChangingLines() -> [Bool] {
        return (0..<6).map { _ in Bool.random() && Bool.random() } // roughly 25% chance of change
    }

    internal static func applyChanges(to lines: [Bool], changes: [Bool]) -> [Bool] {
        zip(lines, changes).map { $1 ? !$0 : $0 }
    }

    internal static func findHexagram(from lines: [Bool]) -> Hexagram {
        let binaryString = lines.map { $0 ? "1" : "0" }.joined()
        return Hexagram.all.first { $0.binary == binaryString }!
    }

}










