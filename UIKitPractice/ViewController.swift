//
//  ViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/27.
//

import UIKit

class ViewController: UIViewController {
    var myView: UIView!
    var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addRect()
        addBtn()
        configureConstraints()

    }
    
    func addBtn() {
        btn = UIButton(type: .system)
        btn.setTitle("Test", for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(handleTouch), for: .touchUpInside)
    }
    
    func addRect() {
        myView = UIView()
        myView.backgroundColor = .black
        myView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myView!)
    }
    
    func configureConstraints() {
        let margin = view.layoutMarginsGuide
        let constraints = [
            myView.leadingAnchor.constraint(equalTo: margin.leadingAnchor, constant: 20),
            myView.trailingAnchor.constraint(equalTo: margin.trailingAnchor, constant: -20),
            myView.topAnchor.constraint(equalTo: margin.topAnchor, constant: 20),
            myView.bottomAnchor.constraint(equalTo: margin.bottomAnchor, constant: -20),
            btn.centerXAnchor.constraint(equalTo: margin.centerXAnchor),
            btn.centerYAnchor.constraint(equalTo: margin.centerYAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    @objc func handleTouch() {
        print("Touch!")
    }

}

