//
//  ViewController.swift
//  SubmitValue-back2
//
//  Created by 아라 on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultEmail: UILabel!
    @IBOutlet weak var resultUpdate: UILabel!
    @IBOutlet weak var resultInterval: UILabel!
    
    var paramEmail: String?
    var paramUpdate: Bool?
    var paramInterval: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

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

