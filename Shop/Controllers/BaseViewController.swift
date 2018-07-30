//
//  BaseViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 26.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: Properties
    var closeGestureRecogniser: UITapGestureRecognizer!
    
    //MARK: View lyfecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add recogniser
        closeGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(closeMenu))
        
        //add menu button
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "icon_menu"), style: .plain, target: self, action: #selector(toggleMenuButtonTapped(_:)))
    }
    
    //MARK: Private Methods
    @objc private func toggleMenuButtonTapped(_ sender: UIBarButtonItem) {
        (navigationController?.parent as! ContainerViewController).toggleSideMenu()
        view.addGestureRecognizer(closeGestureRecogniser)
    }
    
    @objc private func closeMenu() {
        (navigationController?.parent as! ContainerViewController).toggleSideMenu()
        view.removeGestureRecognizer(closeGestureRecogniser)
    }
    
}
