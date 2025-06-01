//
//  Reading.swift
//  IChingCore
//
//  Created by Samuel Rowe on 22/04/2025.
//


// I think this is bull at the moment.
public struct Change {
    public let changingLines: [Bool]
    public let resultingHexagram: Hexagram
}

public struct Reading {
    public let question: String
    public let hexagram: Hexagram
    public let change: Change?

    public init(question: String, hexagram: Hexagram, change: Change?) {
        self.question = question
        self.hexagram = hexagram
        self.change = change
    }
}
