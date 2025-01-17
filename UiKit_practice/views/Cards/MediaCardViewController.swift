//
//  MediaCardViewController.swift
//  UiKit_practice
//
//  Created by Rychid on 1/14/25.
//

import UIKit

class MediaCardViewController: UIViewController {
    
    private var mediaCard: UIView = {
        let card = UIView()
        card.backgroundColor = .cardBG
        card.layer.cornerRadius = 24
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private var albumArt: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "DaBaby")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    private var songTitle: UILabel = {
       let label = UILabel()
        label.text = "FIND MY WAY"
        label.font = UIFont(name: "Poppins-SemiBold", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var artistName: UILabel = {
       let label = UILabel()
        label.text = "DaBaby"
        label.font = UIFont(name: "Poppins-Regular", size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var playButton : GradientButton = {
        let button = GradientButton(btnHeight: 40, btnCornerRadius: 20, btnWidth: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .BG
        
        // Media Card
        view.addSubview(mediaCard)
        mediaCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mediaCard.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mediaCard.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        mediaCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Album art
        mediaCard.addSubview(albumArt)
        albumArt.leftAnchor.constraint(equalTo: mediaCard.leftAnchor, constant: 8).isActive = true
        albumArt.topAnchor.constraint(equalTo: mediaCard.topAnchor, constant: 8).isActive = true
        albumArt.heightAnchor.constraint(equalToConstant: 84).isActive = true
        albumArt.widthAnchor.constraint(equalToConstant: 84).isActive = true
        
        // Song Title
        mediaCard.addSubview(songTitle)
        songTitle.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 16).isActive = true
        songTitle.topAnchor.constraint(equalTo: mediaCard.topAnchor, constant: 30).isActive = true
        
        // Artist name
        mediaCard.addSubview(artistName)
        artistName.leftAnchor.constraint(equalTo: albumArt.rightAnchor, constant: 16).isActive = true
        artistName.topAnchor.constraint(equalTo: songTitle.bottomAnchor, constant: 8).isActive = true
        
        // Play Button
        mediaCard.addSubview(playButton)
        playButton.rightAnchor.constraint(equalTo: mediaCard.rightAnchor, constant: -29).isActive = true
        playButton.centerYAnchor.constraint(equalTo: mediaCard.centerYAnchor).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        playButton.delegate = self
    }

}

extension MediaCardViewController: GradientButtonDelegate {
    func onButtonTapped() {
        print("DEBUG: Button Tapped")
    }
    
    
}

#Preview {
    MediaCardViewController()
}
