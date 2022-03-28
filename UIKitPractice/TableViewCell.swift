//
//  TableViewCell.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(label)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "CellTest"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    

    func configureConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]
        addConstraints(constraints)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
