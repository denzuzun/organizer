//
//  DescriptionViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import MessageUI
import UIKit

class DescriptionViewController: UIViewController, DescriptionViewControllerProtocol, UITextViewDelegate {
    @IBOutlet var destriptionTextView: UITextView!
    @IBOutlet var resultView: UIView!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var feedLabel: UILabel!
    @IBOutlet var drinkLabel: UILabel!
    @IBOutlet var camLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!

    @IBOutlet var confirmButton: UIButton!

    var presenter: DescriptionPresenterProtocol?
    var mailBody: String = ""
    var currentUserMail: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        resultView.isHidden = true
        destriptionTextView.delegate = self
        confirmButton.addTarget(self, action: #selector(showMail), for: .allEvents)
        presenter?.getData()
        presenter?.getOrganize()
        
        print("current mail: \(currentUserMail)")
    }

    @objc func showMail() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }

        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([currentUserMail!])
        mail.setMessageBody("\(mailBody)", isHTML: true)

        present(mail, animated: true)
        
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    @IBAction func didTapNext(_ sender: Any) {
        UIView.transition(with: resultView, duration: 0.4,
                          options: .transitionFlipFromBottom,
                          animations: {
                              self.resultView.isHidden = false
                          })
        detailLabel.isHidden = true
        presenter?.getData()
    }

    @IBAction func didTapConfirm(_ sender: Any) {
        // MARK: use detail data

        UIView.transition(with: resultView, duration: 0.4,
                          options: .transitionFlipFromBottom,
                          animations: {
                              self.resultView.isHidden = false
                          })
        detailLabel.isHidden = false
        detailLabel.text = destriptionTextView.text
        presenter?.getData()
    }

    @IBAction func didTapConfirmChoose(_ sender: Any) {
        // MARK: navigate to next

        UIView.transition(with: resultView, duration: 0.4,
                          options: .transitionFlipFromBottom,
                          animations: {
                              self.resultView.isHidden = true
                          })

        // MARK: save detail text

        presenter?.saveDetail(text: destriptionTextView.text)
    }

    func setData(model: EventModel) {
        print(model)
        placeLabel.text = model.place
        feedLabel.text = model.feed
        drinkLabel.text = model.drink
        camLabel.text = model.cam
        
        
    }
    
    func setMailBody(model: OrganizeModel) {
        mailBody = "<p>Organizasyon Bilgileri!</p>Tarih: \(model.date)</p>Butce: \(model.budget)</p> Konsept: \(model.concept)</p>Kisi Sayisi: \(model.personNumber)</p>Mekan: \(model.place)</p>Yemek: \(model.feed)</p>Icecek: \(model.drink)</p>Kamera-Muzik: \(model.cam ?? "Yok")"
    }
    
    
}

extension DescriptionViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
