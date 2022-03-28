//
//  TableViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

class TableViewController: UITableViewController {
    var name: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        createTableView()
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        cell.label.text = name + ", cell No.\(indexPath.item)"
        
        return cell
    }
    
    func createTableView() {
        tableView = UITableView(frame: view.bounds)
        tableView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        tableView.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.rowHeight = 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("!!!\(indexPath.item)")
        let dvc = DetailViewController()
        dvc.title = "Detail for item \(indexPath.item) in \(title!)"
        navigationController?.show(dvc, sender: self)
    }

}

