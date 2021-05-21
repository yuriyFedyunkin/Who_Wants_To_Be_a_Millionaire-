//
//  ResultsViewController.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import UIKit

class ResultsViewController: UITableViewController {

    let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Game.shared.results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Result", for: indexPath)
        let result = Game.shared.results[indexPath.row]
        cell.textLabel?.text = dateFormatter.string(from: result.date) + " результат: \(result.value)%"
        cell.isUserInteractionEnabled = false
        return cell
    }
 

}
