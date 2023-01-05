//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 아라 on 2023/01/05.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    //segue의 실행 처리 메소드
    override func perform(){
        //segue 출발지 뷰 컨트롤러 type : UIViewController
        let srcUVC = self.source
        //segue 목적지 뷰 컨트롤러 type : UIViewController
        let destUVC = self.destination
        //fromView에서 toView로 뷰 전환
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
    
}

