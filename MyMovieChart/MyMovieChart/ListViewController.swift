//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 어재선 on 6/14/24.
//

import UIKit

class ListViewController: UITableViewController {
    
    var page = 1
    
    
        // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
            return datalist
    }()
    
    
    @IBAction func more(_ sender: Any) {
        // 현재 페이지 값에 1을 추가한다.
        self.page += 1
        
        callMovieAPI()
        
        self.tableView.reloadData()
    }
    
    @IBOutlet var moreBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            callMovieAPI()
        
    }
    
    func callMovieAPI() {
        // 호핀 API 호출을 위한 URL를 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=30&genreId=&order=releasedateasc"

        let apiURI: URL! = URL(string: url)
        
        // REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 데이터 전송 결과를ㄹ 로그로 출력 (반드시 필요한 코든는 아님
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result =\(log)")
        
        // JSON 객체를 파싱하여 NSDictionary 객체로 받음
        do {
            
            
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하면 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
        
            // Iterator 처리를 하면서 API 데이터를 MovieV0 객체에 저장한다.
            for row in movie {
                // 순화 상수를 NSDictionary xkdlqdmfh zotmxld
                
                let r = row as! NSDictionary
                
                //테이블 뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                
                //movie 배열의 각 테이더를 mvo 상수의 속성에 대입
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                // 섬네일 결로를 인자값으로 하는 URL 객체를 생성
                let url: URL! = URL(string: mvo.thumbnail!)
                
                // 이미지를 읽어와 Data 객체에 저장
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                
                self.list.append(mvo)
                // 전체 데이터 카운트 얻는다.
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                // totalCounjtrk 읽어온 데이터 크기와 같거나 클 경우 더보기 버튼을 막는다
                if(self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
                
            }
        } catch { NSLog("[arse Error") }
    }
    
    func getThumbnailImage( _ index: Int) -> UIImage{
        // 인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어옴
        let mvo = self.list[index]
        
        // 메모리제이션 : 저장된 이미지가 있으면 그것을 봔환하고, 없을 경우 내려 받아 저장한 후 반환
        if let seavedImage = mvo.thumbnailImage {
            return seavedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData) // UIImage를 MovieVO 객체에 우선 저장
            
            return mvo.thumbnailImage! // 저장된 이미지를 반환
        }
        
    }
    
}


extension ListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 주어진 행에 맞는 데이터 소스를 읽어 온다.
        let row = self.list[indexPath.row]
        // 테이블 셀 객체를 직접 생성하는 대신 큐로 부터 가져옴
        
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        // 영화제목이 표시될 레이블을 title 변수로 받음
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
       
        // 이미지 객체를 대입한다.
        DispatchQueue.main.async(execute: {
            
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 변째 행입니다.")
    }
}


//MARK: - 화면 전환 시 값을 넘겨주기 위한 세그웨이 관련 처리
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 실행된 세그웨이의 식별자가 "segue_detail" 이면
        if segue.identifier == "segue_detail" {
            
            //senddr 인자를 캐스팅하여 테이블 셀 객체로 변환한다.
            let cell = sender as! MovieCell
            
            // 사용자가 클릭한 행을 찾아낸다.
            let path = self.tableView.indexPath(for: cell)
            
            // API 영화 데이터 배열 중에서 선택된 행의 대한 데이터 추출한다.
            let movieinfo = self.list[path!.row]
            
            // 행 정보를 통해 선택된 영화 데이터를 찾은 다음, 목적지 뷰 컨트롤의 mvo 변수에 대입한다.
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieinfo
            

        }
     }
}
