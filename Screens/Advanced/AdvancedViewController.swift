//
//  AdvancedViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import UIKit

class AdvancedViewController: UIViewController, AdvancedViewProtocol {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var categorySegment: UISegmentedControl!

    @IBOutlet var budgetLabel: UILabel!
    @IBOutlet var saveButton: UIButton!

    var placeResult: String?
    var feedResult: String?
    var drinkResult: String?
    var camMusicResult: String?

    var selectedPlace: [String]?
    var selectedFeed: [String]?
    var selectedDrink: [String]?
    var selectedCam: [String]?

    var presenter: AdvancedPresenterProtocol?
    var buttonState: Int = 0
    var navigate: Int = 0
    var budget: String?
    var budget1: String?
    var budget2: String?
    var budget3: String?
    

    private var cellID = "cell"

    // MARK: Mekan

    var landscape = [["Beykoz", "1450"], ["Beyoğlu", "2800"], ["Kanlıca", "1987"], ["Ortaköy", "3000"]]
    var history = [["Beyoğlu Tarihi Mekan", "2800"], ["İstanbul Tarihi Mekan", "3400"], ["İzmir Tarihi Mekan", "5670"], ["Yalova Tarihi Mekan", "345"]]
    var boat = [["Tekne Adem", "2670"], ["Tekne Ayda", "3000"], ["Tekne Sword", "4500"], ["Tekne Yunus", "3500"]]

    // MARK: Yiyecek

    var meat = [["Ajia Catering Meat Menu", "234"], ["Chole Catering Meat Menu", "456"], ["Desert Catering Meat Menu", "451"], ["Quick Catering Meat Menu", "322"]]
    var chicken = [["Particular Catering Chicken Menu", "200"], ["Quails Catering Chicken Menu", "211"], ["Vanessa Catering Chicken Menu", "190"], ["Vers Catering Chicken Menu", "214"]]
    var seaFeed = [["Adem Catering Seafood", "345"], ["Alya Catering Seafood", "341"], ["Elya Catering Seafood", "213"], ["Hürmet Catering Seafood", "213"]]

    // MARK: Icecek

    var wine = [["Medar", "345"], ["Lasos", "341"], ["İsabey", "234"], ["Cabernet Red Wine", "321"]]
    var alcohol = [["Smirnoff", "345"], ["Jose", "780"], ["Golden Grain", "560"], ["Almeco", "235"]]
    var dealcohol = [["Pomegranate Cocktail ", "238"], ["Pineapple Cocktail", "389"], ["Mix Cocktail", "123"], ["Lime Cocktail", "239"]]

    // MARK: Kamera muzik

    var cameraMucis = [["Camera", "2346"], ["Music", "4345"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        let nibCell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: cellID)

        budgetLabel.text = budget
    }

    @IBAction func changedSegment(_ sender: Any) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    @IBAction func didTapSaveButton(_ sender: Any) {
        if navigate == 0 {
            if camMusicResult == "Evet" {
                if selectedPlace != nil && selectedFeed != nil && selectedDrink != nil && selectedCam != nil {
                    presenter?.savePlace(data: selectedPlace!)
                    presenter?.saveFeed(data: selectedFeed!)
                    presenter?.saveDrink(data: selectedDrink!)
                    presenter?.saveCam(data: selectedCam!)
                } else {
                    displayAlert(message: "Lutfen tum cesitleri seciniz..")
                }

                presenter?.navigateToDescription()
            } else {
                if selectedPlace != nil && selectedFeed != nil && selectedDrink != nil {
                    presenter?.savePlace(data: selectedPlace!)
                    presenter?.saveFeed(data: selectedFeed!)
                    presenter?.saveDrink(data: selectedDrink!)
                } else {
                    displayAlert(message: "Lutfen tum cesitleri seciniz..")
                }

                presenter?.navigateToDescription()
            }
        } else {
            presenter?.navigateToBar()
        }
    }
}

extension AdvancedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cnt = 0

        if categorySegment.selectedSegmentIndex == 3 {
            if camMusicResult == "Evet" {
                cnt = 2
            }
        } else {
            cnt = 4
        }

        return cnt
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TableViewCell

        switch categorySegment.selectedSegmentIndex {
        case 0:
            if placeResult == "Deniz Manzarasi" {
                cell.setCellData(data: landscape[indexPath.row])
            } else if placeResult == "Tarihi Mekan" {
                cell.setCellData(data: history[indexPath.row])
            } else {
                cell.setCellData(data: boat[indexPath.row])
            }
        case 1:
            if feedResult == "Et Menu" {
                cell.setCellData(data: meat[indexPath.row])
            } else if feedResult == "Tavuk Menu" {
                cell.setCellData(data: chicken[indexPath.row])
            } else {
                cell.setCellData(data: seaFeed[indexPath.row])
            }
        case 2:
            if drinkResult == "Alkolsuz Kokteyl" {
                cell.setCellData(data: dealcohol[indexPath.row])
            } else if drinkResult == "Alkol" {
                cell.setCellData(data: alcohol[indexPath.row])
            } else {
                cell.setCellData(data: wine[indexPath.row])
            }
        case 3:
            if camMusicResult == "Evet" {
                cell.setCellData(data: cameraMucis[indexPath.row])
            } else {
                break
            }
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch categorySegment.selectedSegmentIndex {
        case 0:
            if placeResult == "Deniz Manzarasi" {
                selectedPlace = landscape[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget!)! - Int(landscape[indexPath.row][1])!)
                budget1 = budgetLabel.text
            } else if placeResult == "Tarihi Mekan" {
                selectedPlace = history[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget!)! - Int(history[indexPath.row][1])!)
                budget1 = budgetLabel.text
            } else {
                selectedPlace = boat[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget!)! - Int(boat[indexPath.row][1])!)
                budget1 = budgetLabel.text
            }
        case 1:
            if feedResult == "Et Menu" {
                selectedFeed = meat[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget1!)! - Int(meat[indexPath.row][1])!)
                budget2 = budgetLabel.text
            } else if feedResult == "Tavuk Menu" {
                selectedFeed = chicken[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget1!)! - Int(chicken[indexPath.row][1])!)
                budget2 = budgetLabel.text
            } else {
                selectedFeed = seaFeed[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget1!)! - Int(seaFeed[indexPath.row][1])!)
                budget2 = budgetLabel.text
            }
        case 2:
            if drinkResult == "Alkolsuz Kokteyl" {
                selectedDrink = dealcohol[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget2!)! - Int(dealcohol[indexPath.row][1])!)
                budget3 = budgetLabel.text
            } else if drinkResult == "Alkol" {
                selectedDrink = alcohol[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget2!)! - Int(alcohol[indexPath.row][1])!)
                budget3 = budgetLabel.text
            } else {
                selectedDrink = wine[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget2!)! - Int(wine[indexPath.row][1])!)
                budget3 = budgetLabel.text
            }
        case 3:
            if camMusicResult == "Evet" {
                selectedCam = cameraMucis[indexPath.row]
                buttonState += 1
                budgetLabel.text = String(Int(budget3!)! - Int(cameraMucis[indexPath.row][1])!)
            } else {
                break
            }
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        130
    }
}
