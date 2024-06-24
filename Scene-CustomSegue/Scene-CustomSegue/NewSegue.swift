//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 어재선 on 6/5/24.
//

import UIKit

class NewSegue: UIStoryboardSegue{
    
    override func perform() {
        // 세그웨이의 출발지 뷰 컨트롤러
        
        let srcUVC = self.source
        
        // 세그웨이의 목적지 뷰 컨트롤러
        
        let destUVC = self.destination
        
        // fromeview에서 toView로 뷰 전환한다.
    
        UIView.transition(from: srcUVC.view,
                          to: destUVC.view,
                          duration: 2,
                          options: .transitionFlipFromTop)
    }
    
}
