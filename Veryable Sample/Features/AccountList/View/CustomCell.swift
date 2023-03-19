//
//  CustomCell.swift
//  Veryable Sample
//
//  Created by Stephen Byron on 3/17/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - Public API
    
    var accountName: String? {
        didSet {
            nameLabel.text = accountName
        }
    }
    
    var accountDesc: String? {
        didSet {
            descLabel.text = accountDesc
        }
    }
    
    var accountImage: UIImage? {
        didSet {
            accountImageView.image = accountImage
        }
    }
    
    var additionalLabel: String? {
         didSet {
             additionalTextLabel.text = additionalLabel
         }
     }
     
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private members
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextDemiBold(14)
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        addSubview(label)
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.font = .vryAvenirNextRegular(12)
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        addSubview(label)
        return label
    }()
    
    private lazy var accountImageView: UIImageView = {
        let imageView = UIImageView()
        addSubview(imageView)
        return imageView
    }()
    
    private lazy var additionalTextLabel: UILabel = {
         let label = UILabel()
         label.font = .vryAvenirNextRegular(12)
         label.textColor = UIColor(red: 126/255, green: 126/255, blue: 126/255, alpha: 1)
         addSubview(label)
         return label
     }()
    
    private lazy var chevronImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "arrow"))
        addSubview(imageView)
        return imageView
    }()
    
    
    private func setup() {
        
        accountImageView.snp.makeConstraints {
            $0.top.left.equalToSuperview().inset(8)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.left.equalTo(accountImageView.snp.right).offset(8)
            $0.right.equalToSuperview().inset(8)
            $0.height.equalTo(20)
        }

        descLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.left.equalTo(accountImageView.snp.right).offset(8)
            $0.height.equalTo(20)
        }
        additionalTextLabel.snp.makeConstraints {
            $0.top.equalTo(descLabel.snp.bottom).offset(2)
            $0.left.equalTo(accountImageView.snp.right).offset(8)
            $0.right.equalToSuperview().inset(8)
            $0.height.equalTo(20)
        }
        chevronImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(28)
            $0.right.equalToSuperview().inset(8)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
}
