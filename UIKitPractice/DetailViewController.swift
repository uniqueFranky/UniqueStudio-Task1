//
//  DetailViewController.swift
//  UIKitPractice
//
//  Created by 闫润邦 on 2022/3/28.
//

import UIKit
import AVKit
import AVFoundation

class DetailViewController: UIViewController {
    var championName = ""
    var skillName = ""
    var skillId = ""
    var videoable = false
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
        
        let button = UIButton()
        button.setTitle("Tap to See the Video", for: .normal)
        button.backgroundColor = .darkGray
        if !videoable {
            button.setTitle("The Skill Cannot Be Displayed as A Video", for: .normal)
            button.backgroundColor = .black
            button.isEnabled = false
        }
        button.addTarget(self, action: #selector(loadMovie), for: .touchUpInside)
        view.addSubview(button)
        
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
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 50)
        ]
        
        label.translatesAutoresizingMaskIntoConstraints = false
        championImageView.translatesAutoresizingMaskIntoConstraints = false
        skillImageView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(constraints)
    }
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .brown
        label.numberOfLines = 0
        return label
    }()
    
    let playerViewController = AVPlayerViewController()

    @objc func loadMovie() {
        guard let videoURL = Bundle.main.url(forResource: "\(championName.lowercased())_\(skillId.lowercased()).mp4", withExtension: nil)
            else {
                fatalError("Couldn't find video in main bundle.")
        }
        let player = AVPlayer(url: videoURL)
        playerViewController.player = player

        self.present(playerViewController, animated: true) { [self] in
            playerViewController.player!.play()
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.playerItemDidReachEnd),
                                                             name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                                             object: nil) // Add observer
        }
    }
    
    @objc func playerItemDidReachEnd() {
        playerViewController.dismiss(animated: true, completion: nil)
    }
    
}
