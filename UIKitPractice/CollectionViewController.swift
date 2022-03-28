//
//  CollectionViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        title = "Test"
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        configureConstraints()
    }
    func configureConstraints() {
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(constraints)
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.imageView.image = UIImage(systemName: "airplane")
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 30
        cell.label.text = "Hello World!\(indexPath.item)"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let tvc = TableViewController()
        tvc.name = "\(indexPath.item) th in CollectionView"
        tvc.title = tvc.name
//        let navi = UINavigationController(rootViewController: tvc)
//        navigationController?.show(navi, sender: self)
        navigationController?.show(tvc, sender: self)
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 300, height: 300)
    }
}
