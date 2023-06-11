//
//  ViewControllerFactory.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import Swinject

protocol ViewControllerFactoryProtocol: AnyObject {
    var homeViewController: HomeViewProtocol { get }
    var selectionViewController: SelectionViewProtocol { get }
    var descriptionViewController: DescriptionViewControllerProtocol { get }
    var advancedViewController: AdvancedViewProtocol { get }
    var finishViewController: FinishViewProtcol { get }
    var loginViewController: LoginViewProtocol { get }
    var signinViewController: SigninViewProtocol { get }
    var profileViewController: ProfileViewProtocol { get }
    var tabbarViewController: TabbarViewController { get }
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var homeViewController: HomeViewProtocol {
        assembler.resolver.resolve(HomeViewController.self)!
    }

    var selectionViewController: SelectionViewProtocol {
        assembler.resolver.resolve(SelectionViewController.self)!
    }

    var descriptionViewController: DescriptionViewControllerProtocol {
        assembler.resolver.resolve(DescriptionViewController.self)!
    }

    var advancedViewController: AdvancedViewProtocol {
        assembler.resolver.resolve(AdvancedViewController.self)!
    }

    var finishViewController: FinishViewProtcol {
        assembler.resolver.resolve(FinishViewController.self)!
    }

    var loginViewController: LoginViewProtocol {
        assembler.resolver.resolve(LoginViewController.self)!
    }

    var signinViewController: SigninViewProtocol {
        assembler.resolver.resolve(SigninViewController.self)!
    }

    var profileViewController: ProfileViewProtocol {
        assembler.resolver.resolve(ProfileViewController.self)!
    }

    var tabbarViewController: TabbarViewController {
        assembler.resolver.resolve(TabbarViewController.self)!
    }
}
