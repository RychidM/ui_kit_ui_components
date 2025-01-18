//
//  ProductCard.swift
//  UiKit_practice
//
//  Created by Rychid on 1/18/25.
//

import UIKit

class ProductCard: UIView {

    
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
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        container.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private lazy var container: StackedCardTemplate = {
        
        var productImage = UIImage(named: "coffee_mug")
            
        var infoContentStack: UIStackView = {
                let stack = UIStackView()
                stack.axis = .vertical
                stack.spacing = 4
                stack.translatesAutoresizingMaskIntoConstraints = false
                return stack
            }()
        
        var productName: UILabel = {
            let label = UILabel()
            label.text = "Adinkra Coffee Mug"
            label.font = UIFont(name: "Poppins-SemiBold", size: 15)
            label.textColor = .appPrimary
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        var productDesc: UILabel = {
            let desc = UILabel()
            desc.text = "High quality ceramic mug"
            desc.font = UIFont(name: "Poppins-Regular", size: 12)
            desc.textColor = .appPrimary.withAlphaComponent(0.6)
            desc.numberOfLines = 2
            desc.translatesAutoresizingMaskIntoConstraints = false
            return desc
        }()
        
        infoContentStack.addArrangedSubview(productName)
        infoContentStack.addArrangedSubview(productDesc)

        var priceTag: UILabel = {
            let label = UILabel()
            label.text = "$12.99"
            label.font = UIFont(name: "Poppins-SemiBold", size: 13)
            label.textColor = .primaryBlue
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let stack = StackedCardTemplate(leadingImage: productImage, content: infoContentStack, trailingItem: priceTag)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
        
    }()

}

#Preview {
    ProductCard()
}
