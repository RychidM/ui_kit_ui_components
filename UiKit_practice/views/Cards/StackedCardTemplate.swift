//
//  StackedCardTemplate.swift
//  UiKit_practice
//
//  Created by Rychid on 1/17/25.
//

import UIKit

class StackedCardTemplate: UIView {
    
    private var leadingImage: UIImage?
    private var content: UIView?
    private var trailingItem: UIView?
    
    init(leadingImage: UIImage? = nil, content: UIView? = nil, trailingItem: UIView? = nil) {
        self.leadingImage = leadingImage
        self.content = content
        self.trailingItem = trailingItem
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    
    private func setUpView() {
        // Set up main view
        addSubview(container)
        container.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        // Set up detail view
        container.addSubview(detailsView)
        detailsView.heightAnchor.constraint(equalToConstant: container.frame.height).isActive = true
        detailsView.widthAnchor.constraint(equalToConstant: (container.frame.width - 42)).isActive = true
        detailsView.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 42).isActive = true
        detailsView.rightAnchor.constraint(equalTo: container.rightAnchor).isActive = true
        
        
        // Set up leading view
        container.addSubview(leadingView)
        leadingView.leftAnchor.constraint(equalTo: container.leftAnchor).isActive = true
        leadingView.topAnchor.constraint(equalTo: container.topAnchor, constant: 8).isActive = true
        leadingView.widthAnchor.constraint(equalToConstant: 84).isActive = true
        leadingView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        container.bringSubviewToFront(leadingView)
        
    
        // Set up details view
        detailsView.addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: leadingView.rightAnchor, constant: 16).isActive = true
        contentView.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor).isActive = true
        
        
        // Set up trailing view
        detailsView.addSubview(trailingView)
        trailingView.rightAnchor.constraint(equalTo: detailsView.rightAnchor, constant: -20).isActive = true
        trailingView.centerYAnchor.constraint(equalTo: detailsView.centerYAnchor).isActive = true
        
    }

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
    
    private lazy var leadingView: UIImageView = {
        let image = UIImageView()
        image.image = self.leadingImage ?? UIImage(named: "alex")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.layer.cornerRadius = 20
        return image
    }()
    
    private lazy var contentView: UIView = {
        let mainContent = self.content ?? UIView()
        mainContent.translatesAutoresizingMaskIntoConstraints = false
        return mainContent
    }()
    
    private lazy var trailingView: UIView = {
        let trailingContent = self.trailingItem ?? UIView()
        trailingContent.translatesAutoresizingMaskIntoConstraints = false
        return trailingContent
    }()

}
