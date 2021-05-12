//
//  Game.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import Foundation

class Game {
    static let shared = Game()
    
    var session: GameSession?
   
    var results = [Result]() {
        didSet {
                resultsCaretaker.save(results: results)
            }
    }
    
    private let resultsCaretaker = ResultsCaretaker()
    
    private init() {
        self.results = self.resultsCaretaker.retrieveResults()

    }
    
    func addResult(_ result: Result) {
        self.results.append(result)
    }
    
}

struct Result: Codable {
    let value: Int
    let date: Date
}

