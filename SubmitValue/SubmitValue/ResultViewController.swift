//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by 어재선 on 6/6/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 화면에 값을 표시하는데 사용될레이블
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    // email 값을 받을 변수
    var paramEmail: String = ""
    
    // update 값을 받을 변수
    var paramUpdata: Bool = false
    
    // Interval 값을 받을 변수
    var paramInterval: Double = 0
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = (self.paramUpdata == true ? "자동갱신" : "자동갱신 하지 않음")
        self.resultInterval.text = "\(Int(paramInterval))분 마다 갱신"
    }
    
    @IBAction func onBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
