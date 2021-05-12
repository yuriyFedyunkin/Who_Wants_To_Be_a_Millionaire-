//
//  MenuController.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import UIKit

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Меню"
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "Game") as? GameViewController {
            vc.delegate = self
            vc.gameSession = GameSession(numberOfQuestions: vc.questions.count, correctAnswers: 0)
            Game.shared.session = vc.gameSession
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func showResults(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "Results") as? ResultsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension MenuController: GameViewControllerDelegate {
    func didEndGame(with session: GameSession?) {
        Game.shared.session = session
        
        if let answers = Game.shared.session?.correctAnswers,
           let questions = Game.shared.session?.numberOfQuestions {
            let result = Double(answers) / Double(questions) * 100
            Game.shared.results.append(Int(result))
        }
        
    }
    
    
}
