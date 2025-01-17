//
//  GradientButtonViewController.swift
//  UiKit_practice
//
//  Created by Rychid on 1/14/25.
//

import UIKit

class GradientButtonViewController: UIViewController {
    
    private var icon: UIImage?
    private var btnHeight: CGFloat?
    private var btnCornerRadius: CGFloat?
    private var btnWidth: CGFloat?
    private var label: String?
    
    
    init(label: String? = nil, icon: UIImage? = UIImage(systemName: "play.fill"), btnHeight: CGFloat? = 56, btnCornerRadius: CGFloat? = 32, btnWidth: CGFloat? = 56) {
        self.icon = icon
        self.btnHeight = btnHeight
        self.btnCornerRadius = btnCornerRadius
        self.btnWidth = btnWidth
        self.label = label
        super.init(nibName: nil as String?, bundle: nil as Bundle?)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var gradientButton: UIButton = {
        let button = UIButton(type: .system)
        
        if (label != nil) {
            button.setTitle(label!, for: .normal)
            button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 14)
            button.setTitleColor(.white, for: .normal)
        } else {
            button.setImage(icon!, for: .normal)
            button.tintColor = .white
            button.bringSubviewToFront(button.imageView!)
        }
        button.frame = CGRect(x: 0, y: 0, width: btnWidth ?? view.frame.width, height: btnHeight ?? 50)
        button.layer.cornerRadius = btnCornerRadius ?? 16
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    

    fileprivate func setupGradientButton() {
        let gradient = CAGradientLayer()
        gradient.frame = gradientButton.bounds
        gradient.colors = [UIColor.primaryBlue.cgColor, UIColor.primaryPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = btnCornerRadius ?? 16
        
        view.backgroundColor = .BG
        view.addSubview(gradientButton)
        gradientButton.layer.masksToBounds = true
        gradientButton.layer.insertSublayer(gradient, at: 0)
        gradientButton.heightAnchor.constraint(equalToConstant: btnHeight ?? 50).isActive = true
        gradientButton.widthAnchor.constraint(equalToConstant: btnWidth ?? view.frame.width).isActive = true
        gradientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        gradientButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientButton()
    }

}

#Preview {
    GradientButtonViewController(btnHeight: 56, btnCornerRadius: 56/2, btnWidth: 56)
}
