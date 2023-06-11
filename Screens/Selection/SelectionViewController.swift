//
//  SelectionViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import UIKit

class SelectionViewController: UIViewController, SelectionViewProtocol {
    @IBOutlet var pFirstButton: UIButton!
    @IBOutlet var pSecondButton: UIButton!
    @IBOutlet var pThirdButton: UIButton!

    @IBOutlet var fFirstButton: UIButton!
    @IBOutlet var fSecondButton: UIButton!
    @IBOutlet var fThirdButton: UIButton!

    @IBOutlet var dFirstButton: UIButton!
    @IBOutlet var dSecondButton: UIButton!
    @IBOutlet var dThirdButton: UIButton!

    @IBOutlet var cFirstButton: UIButton!
    @IBOutlet var cSecondButton: UIButton!
    
    var budget: String?

    var state1: Bool = false
    var state2: Bool = false
    var state3: Bool = false
    var state4: Bool = false
    var state5: Bool = false
    var state6: Bool = false
    var state7: Bool = false
    var state8: Bool = false
    var state9: Bool = false
    var state10: Bool = false
    var state11: Bool = false

    var presenter: SelectionPresenterProtocol?
    var stateArr = [Bool]()
    var data = ["Deniz Manzarasi", "Tarihi Mekan", "Bogaz Turu", "Et Menu", "Tavuk Menu", "Deniz Urunleri", "Alkolsuz Kokteyl", "Alkol", "Sarap", "Evet", "Hayir"]

    var pl: String?
    var fd: String?
    var dk: String?
    var cs: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        stateArr.append(state1)
        stateArr.append(state2)
        stateArr.append(state3)
        stateArr.append(state4)
        stateArr.append(state5)
        stateArr.append(state6)
        stateArr.append(state7)
        stateArr.append(state8)
        stateArr.append(state9)
        stateArr.append(state10)
        stateArr.append(state11)
        setCheckBoxImage()

        navigationController?.navigationBar.tintColor = UIColor(named: "yellow")
    }

    @IBAction func tapedPFirstButton(_ sender: Any) {
        state1 = !state1

        state1 ? pFirstButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : pFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)

        pl = data[0]
    }

    @IBAction func tappedPSecondButton(sender: Any) {
        state2 = !state2

        state2 ? pSecondButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : pSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        pl = data[1]
    }

    @IBAction func tappedPThirdButton(_ sender: Any) {
        state3 = !state3

        state3 ? pThirdButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : pThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        pl = data[2]
    }

    @IBAction func tappedFFirstButton(sender: Any) {
        state4 = !state4

        state4 ? fFirstButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : fFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fd = data[3]
    }

    @IBAction func tappedFSecondButton(sender: Any) {
        state5 = !state5

        state5 ? fSecondButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : fSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fd = data[4]
    }

    @IBAction func tappedFThirdButton(_ sender: Any) {
        state6 = !state6

        state6 ? fThirdButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : fThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fd = data[5]
    }

    @IBAction func tappedDFirstButton(sender: Any) {
        state7 = !state7

        state7 ? dFirstButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : dFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dk = data[6]
    }

    @IBAction func tappedDSecondButton(sender: Any) {
        state8 = !state8

        state8 ? dSecondButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : dSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dk = data[7]
    }

    @IBAction func tappedDThirdButton(_ sender: Any) {
        state9 = !state9

        state9 ? dThirdButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : dThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dk = data[8]
    }

    @IBAction func tappedCFirstButton(sender: Any) {
        state10 = !state10

        state10 ? cFirstButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : cFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        cs = data[9]
    }

    @IBAction func tappedCSecondButton(sender: Any) {
        state11 = !state11

        state11 ? cSecondButton.setImage(UIImage(systemName: "circle.fill"), for: .normal) : cSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        cs = data[10]
    }

    // MARK: router

    @IBAction func didTapChoose(_ sender: Any) {
        presenter?.navigateToDescription(p: pl!, f: fd!, d: dk!, cm: cs!, budget: budget!)
        setCheckBoxImage()
    }
}

extension SelectionViewController {
    func setCheckBoxImage() {
        pFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        pSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        pThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        fThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
        dThirdButton.setImage(UIImage(systemName: "circle"), for: .normal)
        cFirstButton.setImage(UIImage(systemName: "circle"), for: .normal)
        cSecondButton.setImage(UIImage(systemName: "circle"), for: .normal)
    }
}
