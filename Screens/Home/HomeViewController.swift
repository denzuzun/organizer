//
//  HomeViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    @IBOutlet var conceptPicker: UIPickerView!
    @IBOutlet var budget: UITextField!
    @IBOutlet var personNumber: UILabel!

    var presenter: HomePresenterProtocol?
    var selectedDate: String?
    var concepts = ["Dogum gunu partisi", "Baby Shower", "Dugun-Kina", "Mezuniyet"]
    var selectedConcept: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        conceptPicker.delegate = self
        conceptPicker.dataSource = self
        budget.delegate = self
        navigationController?.navigationBar.tintColor = UIColor(named: "yellow")
        changedPicker(conceptPicker)

        let logout = UIBarButtonItem(title: "", style: .plain, target: self, action: #selector(signOut))

        logout.image = UIImage(systemName: "arrow.forward.to.line.circle.fill")
        logout.tintColor = UIColor(named: "yellow")

        navigationItem.rightBarButtonItem = logout
    }
    
    
    @objc func signOut() {
        presenter?.signOut()
    }

    @IBAction func changedStepper(_ sender: UIStepper) {
        personNumber.text = String(Int(sender.value))
    }

    @IBAction func changedDate(_ sender: UIDatePicker) {
        print(sender.date)
        selectedDate = formatingDate(date: sender.date)
    }

    func changedPicker(_ sender: UIPickerView) {
        print(sender.description)
    }

    @IBAction func didTapChoose(_ sender: Any) {
        presenter?.navigateToChoose(budget: budget.text!)
        let model = HomeModel(cooncept: selectedConcept!, budget: budget.text!, personNumber: personNumber.text!, date: selectedDate!)

        print(model)
        presenter?.saveData(model: model)
    }
}

extension HomeViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return concepts.count
    }
}

extension HomeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return concepts[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedConcept = concepts[row]
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.returnKeyType = .done
        return true
    }
}
