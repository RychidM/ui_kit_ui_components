//
//  GradientButton.swift
//  UiKit_practice
//
//  Created by Rychid on 1/15/25.
//

import UIKit

protocol GradientButtonDelegate: AnyObject {
    func onButtonTapped()
}

class GradientButton: UIButton {
    
    weak var delegate : GradientButtonDelegate?

    private var icon: UIImage?
    private var btnHeight: CGFloat?
    private var btnCornerRadius: CGFloat?
    private var btnWidth: CGFloat?
    private var label: String?
    private var bgColr: UIColor?

    init(label: String? = nil, icon: UIImage? = UIImage(systemName: "play.fill"), btnHeight: CGFloat? = 56, btnCornerRadius: CGFloat? = 32, btnWidth: CGFloat? = 56, bgColor: UIColor? = nil) {
        self.icon = icon
        self.btnHeight = btnHeight
        self.btnCornerRadius = btnCornerRadius
        self.btnWidth = btnWidth
        self.label = label
        self.bgColr = bgColor
        super.init(frame: .zero)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {
        if let label = label {
            setTitle(label, for: .normal)
            titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 14)
            setTitleColor(.white, for: .normal)
        } else {
            setImage(icon, for: .normal)
            tintColor = .white
            bringSubviewToFront(imageView!)
        }
        frame = CGRect(x: 0, y: 0, width: btnWidth ?? UIScreen.main.bounds.width, height: btnHeight ?? 50)
        layer.cornerRadius = btnCornerRadius ?? 16
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(onButtonTapped), for: .touchUpInside)
        if let bgColr = bgColr {
            backgroundColor = bgColr
        } else {
            setupGradient()
        }
    }

    private func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.primaryBlue.cgColor, UIColor.primaryPurple.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = btnCornerRadius ?? 16
        layer.masksToBounds = true
        layer.insertSublayer(gradient, at: 0)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.sublayers?.first?.frame = bounds
    }
    
    @objc private func onButtonTapped() {
        delegate?.onButtonTapped()
    }
}

#Preview {
    GradientButton()
}

