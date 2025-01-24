//
//  ProfileCard.swift
//  UiKit_practice
//
//  Created by Rychid on 1/18/25.
//

import UIKit

class ProfileCard: UIView {
    
    private var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var profilePhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "mark")
        photo.layer.cornerRadius = 43
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    private var card: UIView = {
        let cardView = UIView()
        cardView.backgroundColor = .cardBG
        cardView.layer.cornerRadius = 32
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private var profileName: UILabel = {
        let label = UILabel()
        label.text = "James P. Sullivan"
        label.font = UIFont(name: "Poppins-SemiBold", size: 18)
        label.textColor = .appPrimary
        label.textAlignment = .center
        return label
    }()
       
    private var profileBio: UILabel = {
        let label = UILabel()
        label.text = "Teacher"
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        label.textColor = .appPrimary.withAlphaComponent(0.6)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameBioStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [self.profileName, self.profileBio])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var followingStack: UIStackView = {
        
        var title : UILabel = {
            let lable = UILabel()
            lable.text = "Following".uppercased()
            lable.font = UIFont(name: "Poppins-Regular", size: 11)
            lable.textColor = .appPrimary.withAlphaComponent(0.6)
            return lable
        }()
        
        var count : UILabel = {
           let label = UILabel()
            label.text = "123"
            label.font = UIFont(name: "Poppins-SemiBold", size: 26)
            label.textColor = .appPrimary
            return label
        }()
        
        let stack = UIStackView(arrangedSubviews: [title, count])
        stack.alignment = .center
        stack.spacing = 4
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var followerStack: UIStackView = {
        
        var title : UILabel = {
            let lable = UILabel()
            lable.text = "Followers".uppercased()
            lable.font = UIFont(name: "Poppins-Regular", size: 11)
            lable.textColor = .appPrimary.withAlphaComponent(0.6)
            return lable
        }()
        
        var count : UILabel = {
           let label = UILabel()
            label.text = "323"
            label.font = UIFont(name: "Poppins-SemiBold", size: 26)
            label.textColor = .appPrimary
            return label
        }()
        
        let stack = UIStackView(arrangedSubviews: [title, count])
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var followingInfoStack: UIStackView = {
        let fStack = UIStackView(arrangedSubviews: [followingStack, followerStack])
        fStack.distribution = .fillEqually
        fStack.translatesAutoresizingMaskIntoConstraints = false
        return fStack
    }()
    
    private lazy var actionBtnStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [chatActionButton, callActionButton])
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var chatActionButton: ActionButton = {
        let actionBtn = ActionButton(icon: UIImage(named: "Chat"), iconColor: .primaryBlue.withAlphaComponent(0.4))
        return actionBtn
    }()
    
      
    var callActionButton: ActionButton = {
        let actionBtn = ActionButton(icon: UIImage(systemName: "phone.fill"), iconColor: .greenBeans.withAlphaComponent(0.4))
        return actionBtn
    }()
    
    
    private func setupView() {
        backgroundColor = .BG
        addSubview(container)
        container.widthAnchor.constraint(equalToConstant: 240).isActive = true
        container.heightAnchor.constraint(equalToConstant: 300).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        container.addSubview(card)
        card.widthAnchor.constraint(equalToConstant: container.frame.width).isActive = true
        card.heightAnchor.constraint(equalToConstant: 280).isActive = true
        card.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        card.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        card.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        card.addSubview(profilePhoto)
        profilePhoto.heightAnchor.constraint(equalToConstant: 86).isActive = true
        profilePhoto.widthAnchor.constraint(equalToConstant: 86).isActive = true
        profilePhoto.topAnchor.constraint(equalTo: card.topAnchor, constant: 40).isActive = true
        profilePhoto.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        
        card.addSubview(nameBioStack)
        nameBioStack.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        nameBioStack.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 10).isActive = true
        

        card.addSubview(followingInfoStack)
        followingInfoStack.topAnchor.constraint(equalTo: nameBioStack.bottomAnchor, constant: 20).isActive = true
        followingInfoStack.leftAnchor.constraint(equalTo: card.leftAnchor).isActive = true
        followingInfoStack.rightAnchor.constraint(equalTo: card.rightAnchor).isActive = true
        
        container.addSubview(actionBtnStack)
        actionBtnStack.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 10).isActive = true
        
    }
    
    init(){
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

#Preview {
    ProfileCard()
}
