//
//  TableViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class TableViewController: UIViewController{
    var name: String = ""
    var champion: Champion?
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createView()
        
    }
    func createView() {
        tableView = UITableView(frame: view.bounds)
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableCell")

        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(champion!.name)_0.jpeg")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let button = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem = button
        
        let constraints = [
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        view.addConstraints(constraints)
    }
    @objc func goBack() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champion!.skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        let skill = champion!.skills[indexPath.item]
        cell.label.text = "\(skill.id): \(skill.name)"
        cell.skill = skill
        cell.champName = champion!.name

        cell.imageVieww.image = UIImage(named: "\(champion!.name.lowercased())_\(skill.id.lowercased()).png")
        cell.imageVieww.contentMode = .scaleAspectFill
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("!!!\(indexPath.item)")
        let dvc = DetailViewController()
        let skill = champion!.skills[indexPath.item]
        dvc.title = "Detail for \(skill.name)"
//        dvc.label.text = skill.description
        dvc.championName = champion!.name
        dvc.skillName = skill.name
        dvc.skillId = skill.id
        tableView.deselectRow(at: indexPath, animated: true)
        navigationController?.show(dvc, sender: self)
    }
}

