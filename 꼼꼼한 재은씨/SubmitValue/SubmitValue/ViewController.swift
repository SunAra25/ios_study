//
//  ViewController.swift
//  SubmitValue
//
//  Created by 아라 on 2023/01/05.

//  꼼꼼한 재은 씨의 swift 기본편 - 5장

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var isUpdate: UISwitch!
    @IBOutlet weak var interval: UIStepper!
    
    
    @IBOutlet weak var isUpdateText: UILabel!
    @IBOutlet weak var intervalText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //인스턴스가 초기화될 때 호출되는 메소드
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.intervalText.text = "\(value)분 마다"
    }
    
    @IBAction func submit(_ sender: Any) {
        //instantiateViewController는 기본적으로 UIViewController 타입임
        //ResultViewController에서 정의한 인스턴스를 사용해야해서 해당 객체로 타입캐스팅(다운캐스팅)
        
        //optional 캐스팅으로 인해 guard문을 사용한 optional 바인딩 처리
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else { return }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        //self.present(rvc, animated: true)
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //목적지 뷰컨 인스턴스 읽어오기. type = UIViewController
        let dest = segue.destination
        
        //다운캐스팅
        guard let rvc = dest as? ResultViewController else { return }
        
        rvc.paramEmail = self.email.text!
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
    }
}

