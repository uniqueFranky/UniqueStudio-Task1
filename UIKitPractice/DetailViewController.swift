//
//  DetailViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        configureConstraints()
        // Do any additional setup after loading the view.
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .red
        return label
    }()
    
    func configureConstraints() {
        let constraints = [
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        label.translatesAutoresizingMaskIntoConstraints = false;
        view.addConstraints(constraints)
    }
   

}
