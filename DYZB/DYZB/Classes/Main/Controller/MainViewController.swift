//
//  MainViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/19.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       addViewController(storyName: "Home")
       addViewController(storyName: "Live")
       addViewController(storyName: "Follow")
       addViewController(storyName: "Profile")
    }
    
    func addViewController(storyName: String) {
        let childVC = UIStoryboard(name: storyName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(childVC)
    }

}
