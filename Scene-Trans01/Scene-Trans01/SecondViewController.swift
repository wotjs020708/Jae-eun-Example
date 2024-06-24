//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 어재선 on 6/4/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
