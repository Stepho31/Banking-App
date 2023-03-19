//
//  CustomSectionHeaderView.swift
//  Veryable Sample
//
//  Created by Stephen Byron on 3/18/23.
//  Copyright © 2023 Veryable Inc. All rights reserved.
//

import UIKit

class CustomSectionHeaderView: UIView {
    
    private let titleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.boldSystemFont(ofSize: 18) // set custom font
           label.textColor = .black
           label.textAlignment = .center
           return label
       }()
       
       init(title: String) {
           super.init(frame: .zero)
           titleLabel.text = title
           addSubview(titleLabel)
           titleLabel.snp.makeConstraints { make in
               make.leading.equalToSuperview().offset(16)
               make.trailing.equalToSuperview().offset(-16)
               make.top.bottom.equalToSuperview()
           }
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
