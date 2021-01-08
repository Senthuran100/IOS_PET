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
//        self.showSplashScreen()
    }

//    private func showSplashScreen() {
//        guard UserDefaults.standard.bool(forKey: "introduced") == false ||
//            PETAppConfig.isSnapshot else {
//                return
//        }
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let splashVC = storyboard.instantiateViewController(
//            withIdentifier: "splashController"
//            ) as? SplashViewController else {
//            return
//        }
//        if PETAppConfig.isSnapshot {
//            Facade.share.model.addSampleData()
//        }
//        present(splashVC, animated: false)
//    }
}

