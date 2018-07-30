//
//  ContainerViewController.swift
//  ShoppingCart
//
//  Created by Nikolay Sereda on 26.07.2018.
//  Copyright © 2018 Nikolay Sereda. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    //MARK: Properties
    private var isMenuShown = false
    var menuType: MenuCellType = .main {
        didSet {
            showController()
            toggleSideMenu()
        }
    }
    
    @IBOutlet weak var menuLeadingConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showController()
        
        //configure view for MenuViewController
        let menuViewController = childViewControllers[1] as! SideMenuViewController
        let menuView = menuViewController.view!
        
        // rounded corner for MenuViewController
        let path = UIBezierPath(roundedRect: menuView.frame, byRoundingCorners: [.topRight, .bottomRight], cornerRadii: CGSize(width: 130, height: 130))
        let mask = CAShapeLayer()
        mask.frame = menuView.frame
        mask.path = path.cgPath
        menuView.layer.mask = mask
        
        // grafient background for MenuViewController
        let gradient = CAGradientLayer()
        gradient.frame = menuView.frame
        gradient.colors = [#colorLiteral(red: 0.337254902, green: 1, blue: 0.6352941176, alpha: 1).cgColor, #colorLiteral(red: 0.1411764706, green: 0.262745098, blue: 0.9529411765, alpha: 1).cgColor, #colorLiteral(red: 0.337254902, green: 1, blue: 0.6352941176, alpha: 1).cgColor]
        gradient.locations = [-0.2, 0.3, 1.55]
        menuView.layer.insertSublayer(gradient, at: 0)
    }
    
    //MARK: Methods
    func showController() {
        
        guard let navigationController = self.childViewControllers[0] as? UINavigationController else {
            fatalError("Navigation controller expected")
        }
        
        if menuType == .main {
            let controller = storyboard?.instantiateViewController(withIdentifier: StoryboardIndentifiers.goods) as! ShowGoodsViewController
            navigationController.setViewControllers([controller], animated: true)
            controller.query = ServiceQueries.allGoods
        }
        if menuType == .bucket {
            let controller = storyboard?.instantiateViewController(withIdentifier: StoryboardIndentifiers.carts) as! ShowPurchasesViewController
            navigationController.setViewControllers([controller], animated: true)
            controller.purchases = QueryService.shared.user.purchases
        }
    }
    
    func toggleSideMenu() {
        UIView.animate(withDuration: 0.3) {
            self.menuLeadingConstraint.constant = self.isMenuShown ? -250 : 0
            self.view.layoutIfNeeded()
        }
        isMenuShown = !isMenuShown
    }

}
