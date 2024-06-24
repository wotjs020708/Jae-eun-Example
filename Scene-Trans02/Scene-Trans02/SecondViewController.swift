//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by 어재선 on 6/5/24.
//

import UIKit
class SecondViewController: UIViewController {
    
    
    @IBAction func back(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true)
    }
    @IBAction func back2(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
