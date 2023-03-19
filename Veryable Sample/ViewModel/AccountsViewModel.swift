//
//  AccountsViewModel.swift
//  Veryable Sample
//
//  Created by Stephen Byron on 3/17/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation

class AccountsViewModel {
    
    var accounts: [Account] = [] {
        didSet {
            updateUI?()
            
              // Separate the accounts into two arrays based on their name ending
              let cardAccounts = accounts.filter { $0.account_type.hasSuffix("card") }
              let bankAccounts = accounts.filter { $0.account_type.hasSuffix("bank") }
              
              // Assign the two arrays to the cardAccounts and bankAccounts properties respectively
              self.cardAccounts = cardAccounts
              self.bankAccounts = bankAccounts
        }
    }
    
    var cardAccounts: [Account] = []
    var bankAccounts: [Account] = []
    
    var updateUI: (()->())?
    
    func getAccount(url: String) {
        Task {
            let networkManager = NetworkManager()
            
            guard let url = URL(string: url) else {
                return
            }
            do {
                let apiData = try await networkManager.getDataFromURL(url: url)
                let parsedData = try JSONDecoder().decode([Account].self, from: apiData)
                
                
                print(parsedData)
                accounts = parsedData.self
                
                
            } catch let error {
                print(error)
            }
        }
    }
}
