//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit

class AccountListViewController: UIViewController {
    //MARK: Public API

    //MARK: Inits
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Accounts".uppercased()
    }
    required init?(coder: NSCoder) { nil }

    //MARK: Overrides
    override func loadView() {
        view = customView
        
    }

    //MARK: Private members

    //MARK: Lazy Loads
    private lazy var customView: AccountListView = {
        AccountListView(delegate: self)
    }()
}

extension AccountListViewController: AccountListDelegate {
    func didSelectAccount(_ account: Account, imageName: UIImage) {
          let detailVC = DetailViewController(account: account, imageName: imageName)
          navigationController?.pushViewController(detailVC, animated: true)
          navigationItem.backButtonTitle = ""
            
      }

}
