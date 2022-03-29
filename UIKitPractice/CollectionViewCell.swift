//
//  CollectionViewCell.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(positionImageView)
        configureConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("No!")
    }
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var positionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Hello World!"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        return label
    }()

    
    func configureConstraints() {

        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            positionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            positionImageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -30),
            positionImageView.topAnchor.constraint(equalTo: label.topAnchor),
            positionImageView.bottomAnchor.constraint(equalTo: label.bottomAnchor),
        ]
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        positionImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(constraints)

    }
}
