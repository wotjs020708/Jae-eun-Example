//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 어재선 on 6/27/24.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    @IBOutlet var wv:WKWebView!
    var mvo: MovieVO! // 목록 화면에서 전달하는 영화 정보를 받을 변수
}
