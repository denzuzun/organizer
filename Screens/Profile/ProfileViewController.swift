//
//  ProfileViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewProtocol {
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var budgetLabel: UILabel!
    @IBOutlet var conceptLabel: UILabel!
    @IBOutlet var personNumberLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var drinkLabel: UILabel!
    @IBOutlet var camLabel: UILabel!

    var presenter: ProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.getOrganizeData()
        
    }

    func setData(model: OrganizeModel) {
        DispatchQueue.main.async { [self] in
            dateLabel.text = model.date
            budgetLabel.text = model.budget
            conceptLabel.text = model.concept
            personNumberLabel.text = model.personNumber
            placeLabel.text = model.place
            feedLabel.text = model.feed
            drinkLabel.text = model.drink
            camLabel.text = model.cam
        }
    }
}
