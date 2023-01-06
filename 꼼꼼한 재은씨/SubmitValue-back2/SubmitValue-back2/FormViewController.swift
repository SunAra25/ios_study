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
        let preVC = self.navigationController?.viewControllers
        
        guard let vc = preVC as? ViewController else {
            return
        }
        
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
