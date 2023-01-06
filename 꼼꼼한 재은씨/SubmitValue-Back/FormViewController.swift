//
//  FormViewController.swift
//  SubmitValue-Back
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
        if (sender.isOn == true) {
            self.isUpdateText.text = "자동갱신"
        } else {
            self.isUpdateText.text = "갱신안함"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분"
    }
    
    @IBAction func onSubmit(_ sender: AnyObject) {
        //전달해줄 대상 뷰 컨트롤러의 인스턴스 가져오기
        //presentingViewController = 되돌아 가야 할 화면, 현재의 뷰컨을 화면에 표시해주고 있는 뷰컨
        let preVC = self.presentingViewController
        guard let vc = preVC as? ViewController else {
            return
        }
        
        vc.paramEmail = self.email.text
        vc.paramUpdate = self.isUpdate.isOn
        vc.paramInterval = self.interval.value
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

