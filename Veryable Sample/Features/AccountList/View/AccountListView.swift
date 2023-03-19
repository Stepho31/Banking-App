//
//  AccountListView.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol AccountListDelegate: AnyObject {
    
    func didSelectAccount(_ account: Account, imageName: UIImage)
    
}

class AccountListView: UIView {
    
    private var viewModel: AccountsViewModel!

    //MARK: Public API

    //MARK: Inits
    init(delegate: AccountListDelegate) {
        self.del = delegate
        super.init(frame: .zero)
        setup()
    }
    required init?(coder: NSCoder) { nil }

    private func setup() {
        backgroundColor = ViewColor.background.color

        viewModelSetup()
        constrain()
    }
    
    private func viewModelSetup() {
        viewModel = AccountsViewModel()
        viewModel.getAccount(url: APIEndpoint.endPoint)
        
        viewModel.updateUI = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    private func constrain() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    //MARK: Overrides

    //MARK: Private members
    private weak var del: AccountListDelegate?

    //MARK: Lazy Loads
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = ViewColor.background.color
        addSubview(tableView)
        return tableView
    }()
}

extension AccountListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
         case 0:
             return viewModel.accounts.filter { $0.account_type.hasSuffix("bank") }.count
         case 1:
             return viewModel.accounts.filter { $0.account_type.hasSuffix("card") }.count
         default:
             return 0
         }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomTableViewCell else {
               fatalError("Unable to dequeue custom cell")
           }
           
           let accounts: [Account]
           let accountDesc: String
           let imageName: String
           let additionalInfo: String
           
           switch indexPath.section {
           case 0:
               accounts = viewModel.accounts.filter { $0.account_type.hasSuffix("bank") }
               accountDesc = accounts[indexPath.row].desc
               imageName = "bank"
               additionalInfo = "Bank Account: ACH - Same Day"
           case 1:
               accounts = viewModel.accounts.filter { $0.account_type.hasSuffix("card") }
               accountDesc = accounts[indexPath.row].desc
               imageName = "card"
               additionalInfo = "Card: Instant"
           default:
               fatalError("Invalid section")
           }
           
           let account = accounts[indexPath.row]
           cell.accountName = account.account_name
           cell.accountDesc = accountDesc
           cell.additionalLabel = additionalInfo
           
        if let image = UIImage(named: imageName) {
            let color = VBlue.normal.color
            let tintedImage = image.withTintColor(color)
            cell.accountImage = tintedImage
        }
           
           return cell
       }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = ViewColor.background.color

        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        headerView.addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        }

        switch section {
        case 0:
            label.text = "Bank Accounts"
        case 1:
            label.text = "Cards"
        default:
            label.text = ""
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected account
        let account: Account
        let imageName: String
        switch indexPath.section {
        case 0:
            account = viewModel.accounts.filter { $0.account_type.hasSuffix("bank") }[indexPath.row]
            imageName = "bank"
        case 1:
            account = viewModel.accounts.filter { $0.account_type.hasSuffix("card") }[indexPath.row]
            imageName = "card"
        default:
            fatalError("Invalid section")
        }

        // Notify the delegate
        del?.didSelectAccount(account, imageName: UIImage(named: imageName) ?? UIImage())
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

