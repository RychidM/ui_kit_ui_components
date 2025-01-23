//
//  CollectionCard.swift
//  UiKit_practice
//
//  Created by Rychid on 1/23/25.
//

import UIKit

class CollectionCard: UIView {

    private var container : UIView = {
        let card = UIView()
        card.backgroundColor = .cardBG
        card.layer.cornerRadius = 20
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private var collectionImg : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "shirts")
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 15
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var infoStack : UIStackView = {
        
        var title : UILabel = {
            let label = UILabel()
            label.textColor = .primaryPurple.withAlphaComponent(0.6)
            label.font = UIFont(name: "Poppins-Regular", size: 11)
            label.text = "NEW COLLECTION"
            return label
        }()
        
        var subTitle : UILabel = {
           let label = UILabel()
            label.textColor = .appPrimary
            label.font = UIFont(name: "Poppins-SemiBold", size: 15)
            label.text = "SUMMER OUTFITS"
            return label
        }()
        
        let stack = UIStackView(arrangedSubviews: [title, subTitle])
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    private var btn : GradientButton = {
        let button = GradientButton(icon: UIImage(systemName: "chevron.right"), btnHeight: 40, btnCornerRadius: 10, btnWidth: 40)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func setupView() {
        
        addSubview(container)
        container.widthAnchor.constraint(equalToConstant: 192).isActive = true
        container.heightAnchor.constraint(equalToConstant: 280).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        container.addSubview(collectionImg)
        collectionImg.widthAnchor.constraint(equalToConstant: container.frame.width).isActive = true
        collectionImg.heightAnchor.constraint(equalToConstant: 128).isActive = true
        collectionImg.topAnchor.constraint(equalTo: container.topAnchor,constant: 10).isActive = true
        collectionImg.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 10).isActive = true
        collectionImg.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10).isActive = true
        
        container.addSubview(infoStack)
        infoStack.topAnchor.constraint(equalTo: collectionImg.bottomAnchor, constant: 22).isActive = true
        infoStack.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        
        container.addSubview(btn)
        btn.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -16).isActive = true
        btn.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .BG
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
     

}


#Preview {
    CollectionCard()
}
