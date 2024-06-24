//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 어재선 on 6/5/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        
        // 세기웨이를 실행한다
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
}

