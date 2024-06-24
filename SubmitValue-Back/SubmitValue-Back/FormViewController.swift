//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 어재선 on 6/6/24.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField! // 이메일
    @IBOutlet var isUpdate: UISwitch! // 자동갱신 여부
    @IBOutlet var interval: UIStepper! // 갱신주기
    
    @IBOutlet var isUpdateText: UILabel! // 자동갱신 텍스트
    @IBOutlet var intervalText: UILabel! // 개신주기 택스트
    
    @IBAction func onSwitch(_ sender: UISwitch) {
        if (sender.isOn) == true {
            isUpdateText.text = "갱신함"
        } else {
            isUpdateText.text = "개신안함"
        }
    }
    @IBAction func onStepper(_ sender: UIStepper) {
        let value = Int(sender.value)
        intervalText.text = "\(value)"
        
    }
    
    // Submit 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func onSubmit(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온다, Viewcontroller 타입으로 캐스팅한다.
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
//        
//        // 값을 전달한다.
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
        // Appdelegate 객체의 인스턴스를 가져온다.
//        let ad = UIApplication.shared.delegate as? AppDelegate
//        
//        // 값을 저장한다.
//        ad?.paramEmail = self.email.text
//        ad?.paramUpdate = self.isUpdate.isOn
//        ad?.paramInterval = self.interval.value
//        
        // UserDefault 객체의 인스터스를 가져온다
        let ud = UserDefaults.standard
        
        // 값을 저장한다.
        ud.setValue(self.email.text, forKey: "email")
        ud.setValue(self.isUpdate.isOn, forKey: "isUpdate")
        ud.setValue(self.interval.value, forKey: "interval")
        
        // 이전 화면으로 복귀
        self.presentingViewController?.dismiss(animated: true)
        
    }
    
}
