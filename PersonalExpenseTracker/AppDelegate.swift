//
//  AppDelegate.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = Facade.share
       // Fabric.with([Crashlytics.self])
        
//        StoreReviewHelper.incrementAppOpenedCount()
        self.afterUpdateProcess()

        return true
    }

    private func afterUpdateProcess() {
        switch PETAppUpdate.status {
        case .updated(_, let current):
            if current.isVersion(lessThanOrEqualTo: "1.1") {
                PersistentModel.sharedInstance.updateGeneralCategoriesIfNeeded()
            }
        default:
            break
        }
    }

}
