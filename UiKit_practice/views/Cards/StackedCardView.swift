//
//  StackedCardView.swift
//  UiKit_practice
//
//  Created by Rychid on 1/15/25.
//

import UIKit

class StackedCardView: UIView {
    
    private lazy var container: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 24
        container.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 100)
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private var detailsView: UIView = {
        let detail = UIView()
        detail.layer.cornerRadius = 24
        detail.backgroundColor = .cardBG
        detail.translatesAutoresizingMaskIntoConstraints = false
        return detail
    }()
    
    private var contactImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "alex")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    private var detailStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var contactName: UILabel = {
       let label = UILabel()
        label.text = "Mike Wozowlsky"
        label.font = UIFont(name: "Poppins-SemiBold", size: 15)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var contactRequest: UILabel = {
       let label = UILabel()
        label.text = "Friend Request"
        label.font = UIFont(name: "Poppins-Regular", size: 12)
        label.textColor = .black.withAlphaComponent(0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var actionStack : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 24
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var declineBtn: ActionButton = {
        let btn = ActionButton(icon: UIImage(systemName: "multiply"), btnBg: .sexyRed.withAlphaComponent(0.1))
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private var acceptBtn: ActionButton = {
        let btn = ActionButton(icon: UIImage(systemName: "checkmark"), iconColor: .greenBeans, btnBg: .greenBeans.withAlphaComponent(0.1))
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    @objc func onAcceptTapped(){
        print("Accept Tapped")
    }
    
    @objc func onDelcineTapped(){
        print("Decline Tapped")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .BG
        
        addSubview(container)
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        container.addSubview(detailsView)
        detailsView.heightAnchor.constraint(equalToConstant: container.frame.height).isActive = true
        detailsView.widthAnchor.constraint(equalToConstant: (container.frame.width - 42)).isActive = true
        detailsView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 42).isActive = true
        detailsView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        container.addSubview(contactImage)
        contactImage.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        contactImage.topAnchor.constraint(equalTo: container.topAnchor, constant: 8).isActive = true
        contactImage.widthAnchor.constraint(equalToConstant: 84).isActive = true
        contactImage.heightAnchor.constraint(equalToConstant: 84).isActive = true
        container.bringSubviewToFront(contactImage)
        
        container.addSubview(detailStack)
        detailStack.addArrangedSubview(contactName)
        detailStack.addArrangedSubview(contactRequest)
        detailStack.leftAnchor.constraint(equalTo: contactImage.rightAnchor, constant: 16).isActive = true
        detailStack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
        
        container.addSubview(actionStack)
        acceptBtn.delegate = self
        declineBtn.delegate = self
        actionStack.addArrangedSubview(declineBtn)
        actionStack.addArrangedSubview(acceptBtn)
        actionStack.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -40).isActive = true
        actionStack.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension StackedCardView : ActionButtonDelegate {
    
    func didTapActionButton(_ sender: ActionButton) {
        sender == acceptBtn ? onAcceptTapped() : onDelcineTapped()
    }
}

#Preview {
    StackedCardView()
}
