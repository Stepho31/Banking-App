//
//  DetailViewController.swift
//  Veryable Sample
//
//  Created by Stephen Byron on 3/18/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let account: Account
    private let imageName: UIImage
    
    init(account: Account, imageName: UIImage) {
           self.account = account
           self.imageName = imageName
           super.init(nibName: nil, bundle: nil)
           self.title = "Details"
           
       }
    
    required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

    override func viewDidLoad() {
        super.viewDidLoad()
  

        view.backgroundColor = ViewColor.background.color
                
                let headerImageView = UIImageView()
                headerImageView.image = imageName.withTintColor(VBlue.normal.color)
                headerImageView.contentMode = .scaleAspectFit
                view.addSubview(headerImageView)
                
                let accountName = UILabel()
                accountName.text = account.account_name
                accountName.font = .vryAvenirNextDemiBold(16)
                accountName.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
                accountName.textAlignment = .center
                view.addSubview(accountName)
                
                let accountDesc = UILabel()
                accountDesc.text = account.desc
                accountDesc.font = .vryAvenirNextRegular(14)
                accountDesc.textColor = UIColor(red: 126/255, green: 126/255, blue: 126/255, alpha: 1)
                accountDesc.textAlignment = .center
                view.addSubview(accountDesc)
                
                let button = UIButton(type: .system)
                button.setTitle("Done", for: .normal)
                button.setTitleColor(.white, for: .normal)
                button.titleLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
                button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
                button.backgroundColor = VBlue.normal.color
                view.addSubview(button)
                
                headerImageView.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
                    make.centerX.equalToSuperview()
                    make.height.equalTo(100)
                    make.width.equalTo(100)
                }
                
                accountName.snp.makeConstraints { make in
                    make.top.equalTo(headerImageView.snp.bottom).offset(16)
                    make.leading.trailing.equalToSuperview().inset(16)
                }
                
                accountDesc.snp.makeConstraints { make in
                    make.top.equalTo(accountName.snp.bottom).offset(8)
                    make.leading.trailing.equalToSuperview().inset(16)
                }
                
                button.snp.makeConstraints { make in
                    make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
                    make.leading.trailing.equalToSuperview().inset(16)
                    make.height.equalTo(50)
                }

   
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

}
