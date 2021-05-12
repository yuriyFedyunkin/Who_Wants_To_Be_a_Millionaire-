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
    
    private init() {}
}
