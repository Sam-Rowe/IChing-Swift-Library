
public struct Hexagram: Sendable {
    public let number: Int
    public let character: UTF16
    public let chineseName: UTF16
    public let images: [String]
    public let familyRelationship: String
    public let names: [String]
    public let binary: String
    public let lines: [Bool] // true for solid, false for broken
    public static let all: [Hexagram] = []
        
    public init(number: Int, character: UTF16, names: [String], lines: [Bool], images: [String] = [], familyRelationship: String, chineseName: UTF16) {
        self.number = number
        self.character = character
        self.names = names
        self.lines = lines
        self.images = []
        self.familyRelationship = familyRelationship
        self.chineseName = chineseName
        self.binary = lines.map { $0 ? "1" : "0" }.joined()
    }
}

public struct Trigram: Sendable {
    public let number: Int
    public let character: UTF16
    public let chineseName: UTF16
    public let images: [String]
    public let familyRelationship: String
    public let names: [String]
    public let binary: String
    public let lines: [Bool] // true for solid, false for broken
    public static let all: [Hexagram] = []
        
    public init(number: Int, character: UTF16, names: [String], lines: [Bool], images: [String] = [], familyRelationship: String, chineseName: UTF16) {
        self.number = number
        self.character = character
        self.names = names
        self.lines = lines
        self.images = []
        self.familyRelationship = familyRelationship
        self.chineseName = chineseName
        self.binary = lines.map { $0 ? "1" : "0" }.joined()
    }
}
