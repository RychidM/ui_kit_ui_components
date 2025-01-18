//
//  RestaurantCard.swift
//  UiKit_practice
//
//  Created by Rychid on 1/17/25.
//

import UIKit

class RestaurantCard: UIView, ActionButtonDelegate {
    func didTapActionButton(_ sender: ActionButton) {
        sender == chatActionButton ? chatTapped() : likeTapped()
    }
    
    
    private lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 30
        view.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 113)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var actionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 30
//        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.shadowColor = UIColor.black.cgColor
        return stack
    }()
    
    private var chatActionButton: ActionButton = {
        let btn = ActionButton(icon: UIImage(named: "Chat"),  iconColor: .mintBlue)
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var favouriteActionButton: ActionButton = {
        let btn = ActionButton(icon: UIImage(named: "Heart"))
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var cardDesign: StackedCardTemplate = {
        
        var mainView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        var titleView: UILabel = {
            let label = UILabel()
            label.text = "Papa's Pizza"
            label.font = UIFont(name: "Poppins-SemiBold", size: 15)
            label.textColor = .appPrimary
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
          
        var subTitleView: UILabel = {
            let label = UILabel()
            label.text = "Dome - Kwabenya"
            label.font = UIFont(name: "Poppins-Regular", size: 12)
            label.textColor = .appPrimary.withAlphaComponent(0.6)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        mainView.addArrangedSubview(titleView)
        mainView.addArrangedSubview(subTitleView)
        
        let newOne = StackedCardTemplate(leadingImage: UIImage(named: "pizza"),  content: mainView)
        newOne.translatesAutoresizingMaskIntoConstraints = false
        return newOne
    }()
    
    
    private func setUpView() {
        backgroundColor = .BG
        addSubview(container)
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: 113).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        container.addSubview(actionStack)
        actionStack.addArrangedSubview(chatActionButton)
        actionStack.addArrangedSubview(favouriteActionButton)
        actionStack.topAnchor.constraint(equalTo: container.topAnchor, constant: -20).isActive = true
        actionStack.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -40).isActive = true
        
        
        container.addSubview(cardDesign)
        cardDesign.heightAnchor.constraint(equalToConstant: 100).isActive = true
        cardDesign.widthAnchor.constraint(equalToConstant: container.frame.width).isActive = true
        cardDesign.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        cardDesign.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        container.bringSubviewToFront(actionStack)
        
        chatActionButton.delegate = self
        favouriteActionButton.delegate = self
    }
    
    init() {
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func chatTapped() {
        print("DeBug: Chat tapped")
    }
    
    private func likeTapped() {
        print("DeBug: Like tapped")
    }

}

#Preview {
    RestaurantCard()
}
