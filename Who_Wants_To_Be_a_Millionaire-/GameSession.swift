//
//  GameSession.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import Foundation

class GameSession {
    
    var numberOfQuestions: Int?
    var correctAnswers: Int?
    
    init(numberOfQuestions: Int, correctAnswers: Int) {
        self.numberOfQuestions = numberOfQuestions
        self.correctAnswers = correctAnswers
    }
    
}
