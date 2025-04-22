// The Swift Programming Language
// https://docs.swift.org/swift-book


public class IChing {
    public static func ask(_ question: String) -> Reading {
        // TODO: Generate lines, create hexagram, possibly determine change
    }
    
    public enum IChing {
        public static func ask(_ question: String) -> Reading {
            let originalLines = generateHexagramLines()
            let hexagram = findHexagram(from: originalLines)

            let changingLines = generateChangingLines()
            if changingLines.contains(true) {
                let newLines = applyChanges(to: originalLines, changes: changingLines)
                let changedHexagram = findHexagram(from: newLines)

                let change = Change(
                    changingLines: changingLines,
                    resultingHexagram: changedHexagram
                )

                return Reading(question: question, hexagram: hexagram, change: change)
            } else {
                return Reading(question: question, hexagram: hexagram, change: nil)
            }
        }
    }

    private static func generateHexagramLines() -> [Bool] {
        return (0..<6).map { _ in Bool.random() }
    }

    private static func generateChangingLines() -> [Bool] {
        return (0..<6).map { _ in Bool.random() && Bool.random() } // roughly 25% chance of change
    }

    private static func applyChanges(to lines: [Bool], changes: [Bool]) -> [Bool] {
        zip(lines, changes).map { $1 ? !$0 : $0 }
    }

    private static func findHexagram(from lines: [Bool]) -> Hexagram {
        let binaryString = lines.map { $0 ? "1" : "0" }.joined()
        return Hexagram.all.first { $0.binary == binaryString }!
    }

}


