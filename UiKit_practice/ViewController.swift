//
//  ViewController.swift
//  UiKit_practice
//
//  Created by Rychid on 1/14/25.
//

import UIKit

class ViewController: UIViewController {
    
//    private var iconButton = ActionButton(icon: "Chat", iconColor: .sexyRed)

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(iconButton)
//        iconButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        for family in UIFont.familyNames {
            let fontNames = UIFont.fontNames(forFamilyName: family)
            print("\(family): \(fontNames)")
        }
    }


}

#Preview {
    ViewController()
}

