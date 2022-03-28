//
//  CollectionViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit
private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    let label = UILabel()
    var champions: [Champion] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        title = "👊Legue of Legends👊"
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        label.text = "Select a champion"
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 40)
        view.addSubview(label)
        configureConstraints()
        champions = loadData("data.json")
    }
    func configureConstraints() {
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -30),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(constraints)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return champions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        
        // Configure the cell
        cell.imageView.image = UIImage(named: "\(champions[indexPath.item].name.lowercased())loadscreen.png")
        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 255, alpha: 1)
        cell.label.text = champions[indexPath.item].name
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let tvc = TableViewController()
        tvc.name = "\(champions[indexPath.item].name)"
        tvc.title = tvc.name + "Skills"
        let navi = UINavigationController(rootViewController: tvc)
        navigationController?.show(navi, sender: self)
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 200, height: 400)
    }
}

func loadData<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
