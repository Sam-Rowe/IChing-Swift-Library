// Auto-generated from JSON

public struct Hexagram: Sendable {
    public let number: Int
    public let character: String
    public let chineseName: String
    public let images: [String]
    public let familyRelationship: String
    public let names: [String]
    public let binary: String
    public let lines: [Bool] // true for solid, false for broken

        
    public init(number: Int, character: String, names: [String], lines: [Bool], images: [String] = [], familyRelationship: String, chineseName: String) {
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
    public let character: String
    public let chineseName: String
    public let images: [String]
    public let familyRelationship: String
    public let names: [String]
    public let binary: String
    public let lines: [Bool] // true for solid, false for broken
        
    public init(number: Int, character: String, names: [String], lines: [Bool], images: [String] = [], familyRelationship: String, chineseName: String) {
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


extension Hexagram {
public static let all: [Hexagram] = [
    Hexagram(
        number: 1,
        character: "䷀",
        names: ["Force", "The Creative"],
        lines: [true, true, true, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "乾"
    ),
    Hexagram(
        number: 2,
        character: "䷁",
        names: ["Field", "The Receptive"],
        lines: [false, false, false, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "坤"
    ),
    Hexagram(
        number: 3,
        character: "䷂",
        names: ["Sprouting", "Difficulty at the Beginning"],
        lines: [true, false, false, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "屯"
    ),
    Hexagram(
        number: 4,
        character: "䷃",
        names: ["Enveloping", "Youthful Folly"],
        lines: [false, true, false, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "蒙"
    ),
    Hexagram(
        number: 5,
        character: "䷄",
        names: ["Attending", "Waiting"],
        lines: [true, true, true, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "需"
    ),
    Hexagram(
        number: 6,
        character: "䷅",
        names: ["Arguing", "Conflict"],
        lines: [false, true, false, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "訟"
    ),
    Hexagram(
        number: 7,
        character: "䷆",
        names: ["Leading", "The Army"],
        lines: [false, true, false, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "師"
    ),
    Hexagram(
        number: 8,
        character: "䷇",
        names: ["Grouping", "Holding Together [Union]"],
        lines: [false, false, false, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "比"
    ),
    Hexagram(
        number: 9,
        character: "䷈",
        names: ["Small Accumulating", "The Taming Power of the Small"],
        lines: [true, true, true, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "小畜"
    ),
    Hexagram(
        number: 10,
        character: "䷉",
        names: ["Treading", "Conduct"],
        lines: [true, true, false, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "履"
    ),
    Hexagram(
        number: 11,
        character: "䷊",
        names: ["Pervading", "Peace"],
        lines: [true, true, true, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "泰"
    ),
    Hexagram(
        number: 12,
        character: "䷋",
        names: ["Obstruction", "Standstill (Stagnation)"],
        lines: [false, false, false, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "否"
    ),
    Hexagram(
        number: 13,
        character: "䷌",
        names: ["Concording People", "Fellowship with Men"],
        lines: [true, false, true, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "同人"
    ),
    Hexagram(
        number: 14,
        character: "䷍",
        names: ["Great Possessing", "Possession in Great Measure"],
        lines: [true, true, true, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "大有"
    ),
    Hexagram(
        number: 15,
        character: "䷎",
        names: ["Humbling", "Modesty"],
        lines: [false, false, true, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "謙"
    ),
    Hexagram(
        number: 16,
        character: "䷏",
        names: ["Providing-For", "Enthusiasm"],
        lines: [false, false, false, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "豫"
    ),
    Hexagram(
        number: 17,
        character: "䷐",
        names: ["Following"],
        lines: [true, false, false, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "隨"
    ),
    Hexagram(
        number: 18,
        character: "䷑",
        names: ["Correcting", "Work on What Has Been Spoiled [Decay]"],
        lines: [false, true, true, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "蠱"
    ),
    Hexagram(
        number: 19,
        character: "䷒",
        names: ["Nearing", "Approach"],
        lines: [true, true, false, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "臨"
    ),
    Hexagram(
        number: 20,
        character: "䷓",
        names: ["Viewing", "Contemplation (View)"],
        lines: [false, false, false, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "觀"
    ),
    Hexagram(
        number: 21,
        character: "䷔",
        names: ["Gnawing Bite", "Biting Through"],
        lines: [true, false, false, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "噬嗑"
    ),
    Hexagram(
        number: 22,
        character: "䷕",
        names: ["Adorning", "Grace"],
        lines: [true, false, true, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "賁"
    ),
    Hexagram(
        number: 23,
        character: "䷖",
        names: ["Stripping", "Splitting Apart"],
        lines: [false, false, false, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "剝"
    ),
    Hexagram(
        number: 24,
        character: "䷗",
        names: ["Returning", "Return (The Turning Point)"],
        lines: [true, false, false, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "復"
    ),
    Hexagram(
        number: 25,
        character: "䷘",
        names: ["Without Embroiling", "Innocence (The Unexpected)"],
        lines: [true, false, false, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "無妄"
    ),
    Hexagram(
        number: 26,
        character: "䷙",
        names: ["Great Accumulating", "The Taming Power of the Great"],
        lines: [true, true, true, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "大畜"
    ),
    Hexagram(
        number: 27,
        character: "䷚",
        names: ["Swallowing", "The Corners of the Mouth (Providing Nourishment)"],
        lines: [true, false, false, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "頤"
    ),
    Hexagram(
        number: 28,
        character: "䷛",
        names: ["Great Exceeding", "Preponderance of the Great"],
        lines: [false, true, true, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "大過"
    ),
    Hexagram(
        number: 29,
        character: "䷜",
        names: ["Gorge", "The Abysmal (Water)"],
        lines: [false, true, false, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "坎"
    ),
    Hexagram(
        number: 30,
        character: "䷝",
        names: ["Radiance", "The Clinging, Fire"],
        lines: [true, false, true, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "離"
    ),
    Hexagram(
        number: 31,
        character: "䷞",
        names: ["Conjoining", "Influence (Wooing)"],
        lines: [false, false, true, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "咸"
    ),
    Hexagram(
        number: 32,
        character: "䷟",
        names: ["Persevering", "Duration"],
        lines: [false, true, true, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "恆"
    ),
    Hexagram(
        number: 33,
        character: "䷠",
        names: ["Retiring", "Retreat"],
        lines: [false, false, true, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "遯"
    ),
    Hexagram(
        number: 34,
        character: "䷡",
        names: ["Great Invigorating", "The Power of the Great"],
        lines: [true, true, true, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "大壯"
    ),
    Hexagram(
        number: 35,
        character: "䷢",
        names: ["Prospering", "Progress"],
        lines: [false, false, false, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "晉"
    ),
    Hexagram(
        number: 36,
        character: "䷣",
        names: ["Darkening of the Light"],
        lines: [true, false, true, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "明夷"
    ),
    Hexagram(
        number: 37,
        character: "䷤",
        names: ["Dwelling People", "The Family [The Clan]"],
        lines: [true, false, true, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "家人"
    ),
    Hexagram(
        number: 38,
        character: "䷥",
        names: ["Polarizing", "Opposition"],
        lines: [true, true, false, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "睽"
    ),
    Hexagram(
        number: 39,
        character: "䷦",
        names: ["Limping", "Obstruction"],
        lines: [false, false, true, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "蹇"
    ),
    Hexagram(
        number: 40,
        character: "䷧",
        names: ["Taking-Apart", "Deliverance"],
        lines: [false, true, false, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "解"
    ),
    Hexagram(
        number: 41,
        character: "䷨",
        names: ["Diminishing", "Decrease"],
        lines: [true, true, false, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "損"
    ),
    Hexagram(
        number: 42,
        character: "䷩",
        names: ["Augmenting", "Increase"],
        lines: [true, false, false, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "益"
    ),
    Hexagram(
        number: 43,
        character: "䷪",
        names: ["Displacement", "Break-through (Resoluteness)"],
        lines: [true, true, true, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "夬"
    ),
    Hexagram(
        number: 44,
        character: "䷫",
        names: ["Coupling", "Coming to Meet"],
        lines: [false, true, true, true, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "姤"
    ),
    Hexagram(
        number: 45,
        character: "䷬",
        names: ["Clustering", "Gathering Together [Massing]"],
        lines: [false, false, false, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "萃"
    ),
    Hexagram(
        number: 46,
        character: "䷭",
        names: ["Ascending", "Pushing Upward"],
        lines: [false, true, true, false, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "升"
    ),
    Hexagram(
        number: 47,
        character: "䷮",
        names: ["Confining", "Oppression (Exhaustion)"],
        lines: [false, true, false, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "困"
    ),
    Hexagram(
        number: 48,
        character: "䷯",
        names: ["Welling", "The Well"],
        lines: [false, true, true, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "井"
    ),
    Hexagram(
        number: 49,
        character: "䷰",
        names: ["Skinning", "Revolution (Molting)"],
        lines: [true, false, true, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "革"
    ),
    Hexagram(
        number: 50,
        character: "䷱",
        names: ["Holding", "The Caldron"],
        lines: [false, true, true, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "鼎"
    ),
    Hexagram(
        number: 51,
        character: "䷲",
        names: ["Shake", "The Arousing (Shock, Thunder)"],
        lines: [true, false, false, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "震"
    ),
    Hexagram(
        number: 52,
        character: "䷳",
        names: ["Bound", "Keeping Still, Mountain"],
        lines: [false, false, true, false, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "艮"
    ),
    Hexagram(
        number: 53,
        character: "䷴",
        names: ["Infiltrating", "Development (Gradual Progress)"],
        lines: [false, false, true, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "漸"
    ),
    Hexagram(
        number: 54,
        character: "䷵",
        names: ["Converting the Maiden", "The Marrying Maiden"],
        lines: [true, true, false, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "歸妹"
    ),
    Hexagram(
        number: 55,
        character: "䷶",
        names: ["Abouding", "Abundance [Fullness]"],
        lines: [true, false, true, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "豐"
    ),
    Hexagram(
        number: 56,
        character: "䷷",
        names: ["Sojourning", "The Wanderer"],
        lines: [false, false, true, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "旅"
    ),
    Hexagram(
        number: 57,
        character: "䷸",
        names: ["Ground", "The Gentle (The Penetrating, Wind)"],
        lines: [false, true, true, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "巽"
    ),
    Hexagram(
        number: 58,
        character: "䷹",
        names: ["Open", "The Joyous, Lake"],
        lines: [true, true, false, true, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "兌"
    ),
    Hexagram(
        number: 59,
        character: "䷺",
        names: ["Dispersing", "Dispersion [Dissolution]"],
        lines: [false, true, false, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "渙"
    ),
    Hexagram(
        number: 60,
        character: "䷻",
        names: ["Articulating", "Limitation"],
        lines: [true, true, false, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "節"
    ),
    Hexagram(
        number: 61,
        character: "䷼",
        names: ["Center Returing", "Inner Truth"],
        lines: [true, true, false, false, true, true],
        images: [],
        familyRelationship: "",
        chineseName: "中孚"
    ),
    Hexagram(
        number: 62,
        character: "䷽",
        names: ["Small Exceeding", "Preponderance of the Small"],
        lines: [false, false, true, true, false, false],
        images: [],
        familyRelationship: "",
        chineseName: "小過"
    ),
    Hexagram(
        number: 63,
        character: "䷾",
        names: ["Already Fording", "After Completion"],
        lines: [true, false, true, false, true, false],
        images: [],
        familyRelationship: "",
        chineseName: "既濟"
    ),
    Hexagram(
        number: 64,
        character: "䷿",
        names: ["Not Yet Fording", "Before Completion"],
        lines: [false, true, false, true, false, true],
        images: [],
        familyRelationship: "",
        chineseName: "未濟"
    ),
]
}

extension Trigram {
public static let all: [Trigram] = [
    Trigram(
        number: 1,
        character: "☰",
        names: ["Force", "The Creative"],
        lines: [true, true, true],
        images: ["heaven"],
        familyRelationship: "father",
        chineseName: "乾"
    ),
    Trigram(
        number: 2,
        character: "☷",
        names: ["Field", "The Receptive"],
        lines: [false, false, false],
        images: ["earth"],
        familyRelationship: "mother",
        chineseName: "坤"
    ),
    Trigram(
        number: 3,
        character: "☳",
        names: ["Shake", "The Arousing"],
        lines: [true, false, false],
        images: ["thunder"],
        familyRelationship: "first son",
        chineseName: "震"
    ),
    Trigram(
        number: 4,
        character: "☵",
        names: ["Gorge", "The Abysmal"],
        lines: [false, true, false],
        images: ["water"],
        familyRelationship: "second son",
        chineseName: "坎"
    ),
    Trigram(
        number: 5,
        character: "☶",
        names: ["Bound", "Keeping Still"],
        lines: [false, false, true],
        images: ["mountain"],
        familyRelationship: "third son",
        chineseName: "艮"
    ),
    Trigram(
        number: 6,
        character: "☴",
        names: ["Ground", "The Gentle"],
        lines: [false, true, true],
        images: ["wind", "wood"],
        familyRelationship: "first daughter",
        chineseName: "巽"
    ),
    Trigram(
        number: 7,
        character: "☲",
        names: ["Radiance", "The Clinging"],
        lines: [true, false, true],
        images: ["fire"],
        familyRelationship: "second daughter",
        chineseName: "離"
    ),
    Trigram(
        number: 8,
        character: "☱",
        names: ["Open", "The Joyous"],
        lines: [true, true, false],
        images: ["swamp", "lake"],
        familyRelationship: "third daughter",
        chineseName: "兌"
    ),
]
}
