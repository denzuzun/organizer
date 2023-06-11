//
//  FinishViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import UIKit

class FinishViewController: UIViewController, FinishViewProtcol {
    @IBOutlet var placeButton: UIButton!
    @IBOutlet var feedButton: UIButton!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var drinkButton: UIButton!
    @IBOutlet var drinkLabel: UILabel!
    @IBOutlet var camButton: UIButton!
    @IBOutlet var camLabel: UILabel!

    var state1: Bool = false
    var state2: Bool = false
    var state3: Bool = false
    var state4: Bool = false

    var stateArray = [Bool]()
    var modelData = [String]()
    var presenter: FinishPresenterProtocol?

    var place: String?
    var feed: String?
    var drink: String?
    var cam: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        stateArray.append(state1)
        stateArray.append(state2)
        stateArray.append(state3)
        stateArray.append(state4)
        setCheckBox()
        presenter?.getData()
    }

    func setData(model: EvaluationModel) {
        //

        modelData.append(model.place!)
        modelData.append(model.feed!)
        modelData.append(model.drink!)
        modelData.append(model.cam!)

        DispatchQueue.main.async { [self] in
            placeLabel.text = model.place
            feedLabel.text = model.feed
            drinkLabel.text = model.drink
            camLabel.text = model.cam
        }
        print(modelData)
    }

    @IBAction func didTapPlaceButton(_ sender: Any) {
        state1 = !state1

        state1 ? placeButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : placeButton.setImage(UIImage(systemName: "circle"), for: .normal)

        state1 ? place = modelData[0] : nil
    }

    @IBAction func didTapFeedButton(_ sender: Any) {
        state2 = !state2

        state2 ? feedButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : feedButton.setImage(UIImage(systemName: "circle"), for: .normal)

        state2 ? feed = modelData[1] : nil
    }

    @IBAction func didTapDrinkButton(_ sender: Any) {
        state3 = !state3

        state3 ? drinkButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : drinkButton.setImage(UIImage(systemName: "circle"), for: .normal)

        state3 ? drink = modelData[2] : nil
    }

    @IBAction func didTapCamButton(_ sender: Any) {
        state4 = !state4

        state4 ? camButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : camButton.setImage(UIImage(systemName: "circle"), for: .normal)

        state4 ? cam = modelData[3] : nil
    }

    @IBAction func didTapFinishButton(_ sender: Any) {
        presenter?.saveEvaluationData(p: place, f: feed, d: drink, cm: cam)
        setCheckBox()
    }
    
    
    @IBAction func didTapSOS(_ sender: Any) {
        presenter?.navigateToAdvanced()
    }
    
    
    
}

extension FinishViewController {
    func setCheckBox() {
        DispatchQueue.main.async { [self] in
            placeButton.setImage(UIImage(systemName: "circle"), for: .normal)
            feedButton.setImage(UIImage(systemName: "circle"), for: .normal)
            drinkButton.setImage(UIImage(systemName: "circle"), for: .normal)
            camButton.setImage(UIImage(systemName: "circle"), for: .normal)
        }
    }
}
