//
//  ProductLargeCard.swift
//  UiKit_practice
//
//  Created by Rychid on 1/23/25.
//

import UIKit

class ProductLargeCard: UIView {

    private var card : UIView = {
        let container = UIView()
        container.layer.cornerRadius = 20
        container.backgroundColor = .cardBG
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private var imgCard : UIImageView = {
       let img = UIImageView()
        img.image = UIImage(named: "coffee_mug_banner")
        img.layer.cornerRadius = 10
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var prodInfoStack : UIStackView = {
        
        var title : UILabel = {
            let label = UILabel()
            label.text = "Coffee Mug"
            label.font = UIFont(name: "Poppins-Bold", size: 15)
            label.textColor = .appPrimary
            return label
        }()
        
        var subTitle : UILabel = {
            let label = UILabel()
            label.text = "100% Organic Coffee"
            label.font = UIFont(name: "Poppins-Regular", size: 13)
            label.textColor = .appPrimary.withAlphaComponent(0.4)
            return label
        }()
        
        let stack = UIStackView(arrangedSubviews: [title, subTitle])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    
    private var btnStack : UIStackView = {
        
        var cartBtn : GradientButton  = {
            let btn = GradientButton(icon: UIImage(named: "Bag"), btnHeight: 40, btnCornerRadius: 12, btnWidth: 40)
            return btn
        }()
        
        var price : UILabel = {
            let label = UILabel()
            label.text = "$12.99"
            label.textColor = .primaryBlue
            label.font = UIFont(name: "Poppins-SemiBold", size: 12)
            return label
        }()
        
       let stack = UIStackView(arrangedSubviews: [price, cartBtn])
        stack.distribution = .equalCentering
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    func setupViews() {
        addSubview(card)
        card.widthAnchor.constraint(equalToConstant: 180).isActive = true
        card.heightAnchor.constraint(equalToConstant: 240).isActive = true
        card.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        card.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        card.addSubview(imgCard)
        imgCard.widthAnchor.constraint(equalToConstant: card.frame.width).isActive = true
        imgCard.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imgCard.topAnchor.constraint(equalTo: card.topAnchor, constant: 10).isActive = true
        imgCard.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 10).isActive = true
        imgCard.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -10).isActive = true
        
        card.addSubview(prodInfoStack)
        prodInfoStack.topAnchor.constraint(equalTo: imgCard.bottomAnchor, constant: 10).isActive = true
        prodInfoStack.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 10).isActive = true
        
        card.addSubview(btnStack)
        btnStack.leftAnchor.constraint(equalTo: card.leftAnchor, constant: 10).isActive = true
        btnStack.rightAnchor.constraint(equalTo: card.rightAnchor, constant: -10).isActive = true
        btnStack.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -10).isActive = true
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .BG
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    

}

#Preview {
    ProductLargeCard()
}
