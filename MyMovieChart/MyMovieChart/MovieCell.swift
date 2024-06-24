//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 어재선 on 6/19/24.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet var title: UILabel! // 영화 제목
    
    @IBOutlet var opendate: UILabel! // 영화 설명
    
    @IBOutlet var rating: UILabel! // 개봉일
    
    @IBOutlet var desc: UILabel! // 평점
    
    @IBOutlet var thumbnail: UIImageView!
}
