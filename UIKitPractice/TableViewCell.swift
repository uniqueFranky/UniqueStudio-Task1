//
//  TableViewCell.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class TableViewCell: UITableViewCell {
    var skill: Skill!
    var champName: String!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        addSubview(imageVieww)
        accessoryType = .disclosureIndicator
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var imageVieww: UIImageView = {
        let imageVieww = UIImageView()
        return imageVieww
    }()
    var label: UILabel = {
        let label = UILabel()
        label.text = "CellTest"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    func configureConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageVieww.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageVieww.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -30),
            imageVieww.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageVieww.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageVieww.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        addConstraints(constraints)
    }
    
}
