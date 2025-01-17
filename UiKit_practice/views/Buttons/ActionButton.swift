//
//  ActionButton.swift
//  UiKit_practice
//
//  Created by Rychid on 1/14/25.
//

import UIKit

protocol ActionButtonDelegate: AnyObject {
    func didTapActionButton(_ sender: ActionButton)
}

class ActionButton: UIButton {
    
    weak var delegate: ActionButtonDelegate?
    
    private var icon: UIImage?
    private var iconColor: UIColor?
    private var btnBG: UIColor?
    
    init(icon: UIImage? = nil, iconColor: UIColor? = .sexyPink, btnBg: UIColor? = .cardBG) {
        self.icon = icon
        self.btnBG = btnBg
        self.iconColor = iconColor
        super.init(frame: .zero)
        setupBtn()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBtn()
    }
    
    private lazy var actionIcon : UIButton = {
        let button = UIButton(type: .system)
        button.setImage(icon ?? UIImage(systemName: "Heart"), for: .normal)
        button.backgroundColor = btnBG
        button.tintColor = iconColor
        button.layer.cornerRadius = 14
        button.addTarget(self, action: #selector(actionBtnTapped), for: .touchUpInside)
        return button
    }()
    
    fileprivate func setupBtn() {
        addSubview(actionIcon)
        actionIcon.translatesAutoresizingMaskIntoConstraints = false
        actionIcon.widthAnchor.constraint(equalToConstant: 44).isActive = true
        actionIcon.heightAnchor.constraint(equalToConstant: 44).isActive = true
        actionIcon.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        actionIcon.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc private func actionBtnTapped() {
        delegate?.didTapActionButton(self)
        print("Tapped inside djslhasljf")
    }
    
}

#Preview {
    ActionButton(icon: UIImage(named: "Heart"), iconColor: .sexyPink)
}
