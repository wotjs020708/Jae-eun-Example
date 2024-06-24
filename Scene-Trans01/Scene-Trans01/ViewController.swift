//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 어재선 on 6/4/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
            // 이동 뷰 트롤러 객체를 StoryboardID 정보를 이용하여 참조.
//        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let uvc = storyboard.instantiateViewController(withIdentifier: "SecondVC")
//        if let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC"){
//            
//            // 화면 전환 할 때의 애니메이션 타입
//            uvc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
//            
//            // 인자값으로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
//            self.present(uvc, animated: true)
//            
//        }
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }
    
}

