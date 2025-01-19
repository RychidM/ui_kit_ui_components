//
//  ProfileCardVariant.swift
//  UiKit_practice
//
//  Created by Rychid on 1/19/25.
//

import UIKit

class ProfileCardVariant: UIView {

    private var container : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var card: UIView = {
        let card = UIView()
        card.backgroundColor = .cardBG
        card.layer.cornerRadius = 16
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private var avatar : UIImageView = {
       let photo = UIImageView()
        photo.image = UIImage(named: "mark")
        photo.contentMode = .scaleAspectFill
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    
    private var bioStack : UIStackView = {
        
        var userName : UILabel = {
           let name = UILabel()
            name.text = "James P. Sullivan"
            name.font = UIFont(name: "Poppins-SemiBold", size: 16)
            name.textColor = .appPrimary
            return name
        }()
        
        var aboutUser : UILabel = {
            let aboutText = UILabel()
            aboutText.text = "Software Engineer"
            aboutText.font = UIFont(name: "Poppins-Regular", size: 12)
            aboutText.textColor = .appPrimary.withAlphaComponent(0.6)
            return aboutText
        }()
        
        let stack = UIStackView(arrangedSubviews: [userName, aboutUser])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var actionBtnStack : UIStackView = {
        
        var chatBtn : ActionButton = {
            let btn = ActionButton(icon: UIImage(named: "Chat"), iconColor: .primaryBlue.withAlphaComponent(0.4))
            return btn
        }()
        
        var callBtn : ActionButton = {
            let btn = ActionButton(icon: UIImage(systemName: "phone.fill"), iconColor: .greenBeans.withAlphaComponent(0.4))
            return btn
        }()
        
        let stack : UIStackView = UIStackView(arrangedSubviews: [chatBtn, callBtn])
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        backgroundColor = .BG
        addSubview(container)
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: 232).isActive = true
        container.heightAnchor.constraint(equalToConstant: 327).isActive = true
        
        container.addSubview(card)
        card.widthAnchor.constraint(equalToConstant: container.frame.width).isActive = true
        card.heightAnchor.constraint(equalToConstant: 314).isActive = true
        card.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        card.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        card.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        card.addSubview(avatar)
        avatar.widthAnchor.constraint(equalToConstant: 200).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 200).isActive = true
        avatar.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        avatar.topAnchor.constraint(equalTo: card.topAnchor, constant: 16).isActive = true
        
        card.addSubview(bioStack)
        bioStack.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20).isActive = true
        bioStack.centerXAnchor.constraint(equalTo: card.centerXAnchor).isActive = true
        
        container.addSubview(actionBtnStack)
        actionBtnStack.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 20).isActive = true
    }

}

#Preview {
    ProfileCardVariant()
}
