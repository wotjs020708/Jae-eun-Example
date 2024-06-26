//
//  ViewController.swift
//  MyMoviechart-SpinOff
//
//  Created by 어재선 on 6/24/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 임의로 5개 셀 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var content = cell.defaultContentConfiguration()
        content.text = "\(indexPath.row)번쨰 데이터 입니다."
        cell.contentConfiguration = content
        return cell
        
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row)번 쨰 데이터가 클릭됨")
    }
}

