//
//  ResultsCaretaker.swift
//  Who_Wants_To_Be_a_Millionaire-
//
//  Created by Yuriy Fedyunkin on 12.05.2021.
//

import Foundation

final class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "records"
    
    func save(results: [Result]) {
        do {
            let data = try self.encoder.encode(results)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retrieveResults() -> [Result] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try self.decoder.decode([Result].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
