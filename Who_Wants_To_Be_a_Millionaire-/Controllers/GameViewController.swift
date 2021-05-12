//
//  GameViewController.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import UIKit

protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(with session: GameSession?)
}

class GameViewController: UIViewController {
    var gameSession: GameSession?
    var correctAnswer = 0
    var questionIndex = 0
    
    weak var delegate: GameViewControllerDelegate?
    
    var questions = [
            Question(question: "Что хором кричат дети на новогоднем празднике?",
                     answers: ["Спасите-помогие!", "'Спартак' - чемпион!", "Снегурочка!", "Шайбу- шайбу"],
                     correctAnswer: 2),
            Question(question: "Где находятся сусеки, о которых упоминается в сказке 'Колобок'?",
                     answers: ["В амбаре", "В огороде", "В бане", "На поле"],
                     correctAnswer: 0),
            Question(question: "Что можно найти в раковинах некоторых моллюсков?",
                     answers: ["Янтарь", "Жемчуг", "Аквамарин", "Малахит"],
                     correctAnswer: 1),
            Question(question: "Кому в работе нужный постромки?",
                     answers: ["Кузнецу", "Извозчику", "Хирургу", "Охотнику"],
                     correctAnswer: 1),
            Question(question: "Кем была тетушка Аксал в 'Королевстве кривых зеркал'?",
                     answers: ["Прачкой", "Королевой", "Фрейлиной", "Кухаркой"],
                     correctAnswer: 3)
    ]
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        var title: String
        
        let ac = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        if sender.tag == correctAnswer {
            title = "Верно"
            ac.title = title
            gameSession?.correctAnswers! += 1
            questionIndex += 1
            
            if questionIndex < questions.count {
                ac.addAction(UIAlertAction(title: "Дальше", style: .default, handler: startGame))
                present(ac, animated: true)
            } else {
                ac.title = "Это был последний вопрос"
                ac.addAction(UIAlertAction(title: "В меню", style: .default) {
                    [weak self] _ in
                    self?.navigationController?.popToRootViewController(animated: true)
                })
                present(ac, animated: true)
                delegate?.didEndGame(with: gameSession)
            }
            
        } else {
            title = "Неверный ответ"
            ac.title = title
            ac.addAction(UIAlertAction(title: "В меню", style: .default) {
                [weak self] _ in
                self?.navigationController?.popToRootViewController(animated: true)
            })
            present(ac, animated: true)
            delegate?.didEndGame(with: gameSession)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameSession = GameSession(numberOfQuestions: questions.count, correctAnswers: 0)
        startGame()
    }
    
    func startGame(action: UIAlertAction! = nil) {
        let question = questions[questionIndex]
        correctAnswer = question.correctAnswer
        questionLabel.text = question.question
        answerButton1.setTitle(question.answers[0], for: .normal)
        answerButton2.setTitle(question.answers[1], for: .normal)
        answerButton3.setTitle(question.answers[2], for: .normal)
        answerButton4.setTitle(question.answers[3], for: .normal)
    }

   
}


/*
 1."Что хором кричат дети на новогоднем празднике?"
 - Спасите-помогие!
 - "Спартак" - чемпион!
 - Снегурочка! - верный
 - Шайбу- шайбу
 
 2. "Где находятся сусеки, о которых упоминается в сказке "Колобок"?"
 - В амбаре - верный
 - В огороде
 - В бане
 - На поле
 
 3. Что можно найти в раковинах некоторых моллюсков?
 - янтарь
 - жемчуг - верный
 - аквамарин
 - малахит
 
 4. Кому в работе нужный постромки?
 - Кузнецу
 - Извозчику - верный
 - Хирургу
 - Охотнику
 
 5. Кем была тетушка Аксал в "Королевстве кривых зеркал"?
 - Прачкой
 - Королевой
 - Фрейлиной
 - Кухаркой - верный
 
 
 */
