//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 아라 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    override func viewDidLoad() {
        //화면이 처음 만들어질 때 오직 한 번만 호출
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    //뷰가 스크린에 나타날 때마다 호출되는 메소드
    //fullscreen일 때 호출됨
    override func viewWillAppear(_ animated: Bool) {
        if let email = paramEmail {
            resultEmail.text = email
        }
        if let update = paramUpdate {
            resultUpdate.text = update==true ? "자동갱신":"갱신안함"
        }
        if let interval = paramInterval {
            resultInterval.text = "\(Int(interval))분"
        }
    }
}

