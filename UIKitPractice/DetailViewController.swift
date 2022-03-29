//
//  DetailViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class DetailViewController: UIViewController {
    var championName = ""
    var skillName = ""
    var skillId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        
        let championImageView = UIImageView()
        championImageView.image = UIImage(named: "\(championName.lowercased())_circle.png")
        championImageView.contentMode = .scaleAspectFill
        view.addSubview(championImageView)
        
        let skillImageView = UIImageView()
        skillImageView.image = UIImage(named: "\(championName.lowercased())_\(skillId.lowercased()).png")
        skillImageView.contentMode = .scaleAspectFill
        view.addSubview(skillImageView)
        
        let constraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            championImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            championImageView.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            championImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -75),
            championImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -25),
            
            skillImageView.topAnchor.constraint(equalTo: championImageView.topAnchor),
            skillImageView.bottomAnchor.constraint(equalTo: championImageView.bottomAnchor),
            skillImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 25),
            skillImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 75),
        ]
        label.translatesAutoresizingMaskIntoConstraints = false
        championImageView.translatesAutoresizingMaskIntoConstraints = false
        skillImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(constraints)
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .brown
        label.numberOfLines = 0
        return label
    }()
   
}
