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
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    @IBAction func showResults(_ sender: UIButton) {
    }

}

extension MenuController: GameViewControllerDelegate {
    func didEndGame(with score: Int, of total: Int) {
        Game.shared.session = GameSession(numberOfQuestions: score, correctAnswers: total)
    }
    
    
}
