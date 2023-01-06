//
//  FormViewController.swift
//  SubmitValue-back2
//
//  Created by 아라 on 2023/01/06.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            self.isUpdateText.text = "자동갱신"
        }else {
            self.isUpdateText.text = "갱신안함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        //AppDelegate 객체 인스턴스
        //        let ad = UIApplication.shared.delegate as? AppDelegate
        //
        //        ad?.paramEmail = self.email.text
        //        ad?.paramUpdate = self.isUpdate.isOn
        //        ad?.paramInterval = self.interval.value
        //
        //        self.presentingViewController?.dismiss(animated: true)
        //    }
        //UserDefault 객체의 인스턴스
        let ud = UserDefaults.standard
        
        ud.set(self.email.text, forKey: "email")
        ud.set(self.isUpdate.isOn, forKey: "isUpdate")
        ud.set(self.interval.value, forKey: "interval")
        
        self.presentingViewController?.dismiss(animated: true)
    }
}
