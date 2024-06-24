//
//  ViewController.swift
//  IBTest
//
//  Created by 어재선 on 5/31/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var uiTitle01: UILabel!
    
    @IBOutlet var uiTitle02: UILabel!
    
    @IBOutlet var uiTitle03: UILabel!
    
    @IBOutlet var uiTitle04: UILabel!
    
    @IBOutlet var uiTitle05: UILabel!
    
    
    @IBAction func clickBtn01(_ sender: Any) {
        // Button01 이 클릭 되었을때 Labe01의 텍스트 변경함
        self.uiTitle01.text = "Button01 clicked"
    }
    
    
    @IBAction func clickBtn02(_ sender: Any) {
        // Button02 이 클릭 되었을때 Labe02의 텍스트 변경함
        self.uiTitle02.text = "Button02 clicked"
        
    }
    
    
    @IBAction func clickBtn03(_ sender: Any) {
        // Button03 이 클릭 되었을때 Labe03의 텍스트 변경함
        self.uiTitle03.text = "Button03 clicked"
    }
    
    
    @IBAction func clickBtn04(_ sender: Any) {
        // Button04 이 클릭 되었을때 Labe04의 텍스트 변경함
        self.uiTitle04.text = "Button04 clicked"
        
    }
    
    
    @IBAction func clickBtn05(_ sender: Any) {
        // Button05 이 클릭 되었을때 Labe05의 텍스트 변경함
        self.uiTitle05.text = "Button05 clicked"
    }
}

