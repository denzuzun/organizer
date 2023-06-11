//
//  TabbarAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation
import Swinject

class TabbarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabbarViewController.self) { r in
            let view = TabbarViewController(nibName: "TabbarViewController", bundle: nil)
            let factory = r.resolve(ViewControllerFactory.self)!

            view.factory = factory
            return view
        }
    }
}
