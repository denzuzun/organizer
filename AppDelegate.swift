//
//  AppDelegate.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import Swinject
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var assembler: Assembler?
    var window: UIWindow?
    var rootViewController: UIViewController? {
        get { window?.rootViewController }
        set {
            window?.rootViewController = newValue
            window?.makeKeyAndVisible()
        }
    }

    /// - Initializing window
    private func initWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        initWindow()
        initDI()
        initRoot()

        return true
    }

    private func initDI() {
        assembler = Assembler([
            /// sceens
            HomeAssembly(),
            SelectionAssembly(),
            DescriptionAssembly(),
            AdvancedAssembly(),
            FinishAssembly(),
            LoginAssembly(),
            TabbarAssembly(),
            SigninAssembly(),
            ProfileAssembly(),
        ])
        assembler?.apply(assembly: ViewControllerFactoryAssembly(assembler: assembler!))
    }

    private func initRoot() {
        let loginViewController = assembler?.resolver.resolve(LoginViewController.self)
        let bar = assembler?.resolver.resolve(TabbarViewController.self)

        if Auth.auth().currentUser != nil {
            rootViewController = bar!
        } else {
            rootViewController = UINavigationController(rootViewController: loginViewController as! LoginViewController)
        }
    }
}
