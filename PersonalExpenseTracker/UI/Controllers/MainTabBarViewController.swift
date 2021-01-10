//
//  MainTabBarViewController.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit

class MainTabController: UITabBarController {

    var freshLaunch = true

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 1 // second tab
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

