//
//  ViewController.swift
//  Hospital
//
//  Created by kpugame on 2019. 4. 22..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dropDown1 : DropDown?
    var dropDown2 : DropDown?
    var dropDown3 : DropDown?
    
    @IBOutlet weak var sidoCd: UIButton!
    @IBOutlet weak var gunguCd: UIButton!
    @IBOutlet weak var kind: UIButton!
    
    let si : [String] = ["서울", "부산", "대구", "인천", "광주", "세종", "대전", "울산", "경기도", "강원도"]
    let siNum : [String:Int] = ["서울":6110000, "부산":6260000, "대구":6270000, "인천":6280000, "광주":6290000, "세종":5690000, "대전":6300000, "울산":6310000, "경기도":6410000, "강원도":6420000]
    
    let seoul : [String] = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"]
    let seoulNum : [String:Int] = ["강남구":3220000, "강동구":3240000, "강북구":3080000, "강서구":3150000, "관악구":3200000, "광진구":3040000, "구로구":3160000, "금천구":3170000, "노원구":3100000, "도봉구":3090000, "동대문구":3050000, "동작구":3190000, "마포구":3130000, "서대문구":3120000, "서초구":3210000, "성동구":3030000, "성북구":3070000, "송파구":3230000, "양천구":3140000, "영등포구":3180000, "용산구":3020000, "은평구":3110000, "종로구":3000000, "중구":3010000, "중랑구":3060000]
    
    let busan : [String] = ["강서구", "금정구", "기장군", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구"]
    let busanNum : [String:Int] = ["강서구":3360000, "금정구":3350000, "기장군":3400000, "남구":3310000, "동구":3270000, "동래구":3300000, "부산진구":3290000, "북구":3320000, "사상구":3390000, "사하구":3340000, "서구":3260000, "수영구":3380000, "연제구":3370000, "영도구":3280000, "중구":3250000, "해운대구":3330000]
    
    let daegu : [String] = ["남구", "달서구", "달성군", "동구", "북구", "서구", "수성구", "중구"]
    let daeguNum : [String:Int] = ["남구":3440000, "달서구":3470000, "달성군":3480000, "동구":3420000, "북구":3450000, "서구":3430000, "수성구":3460000, "중구":3410000]
    
    let incheon : [String] = ["강화군", "계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "옹진군", "중구"]
    let incheonNum : [String:Int] = ["강화군":3570000, "계양구":3550000, "남동구":3530000, "동구":3500000, "미추홀구":3510500, "부평구":3540000, "서구":3560000, "연수구":3520000, "옹진군":3580000, "중구":3490000]
    
    let gwangju : [String] = ["광산구", "남구", "동구", "북구", "서구"]
    let gwangjuNum : [String:Int] = ["광산구":3630000, "남구":3610000, "동구":3590000, "북구":3620000, "서구":3600000]
    
    let daejeon : [String] = ["대덕구", "동구", "서구", "유성구", "중구"]
    let daejeonNum : [String:Int] = ["대덕구":680000, "동구":640000, "서구":660000, "유성구":670000, "중구":650000]
    
    let ulsan : [String] = ["남구", "동구", "북구", "울주군", "중구"]
    let ulsanNum : [String:Int] = ["남구":3700000, "동구":3710000, "북구":3720000, "울주군":3730000, "중구":3690000]
    
    let gyunggi : [String] = ["가평군", "고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "양평군", "여주시", "연천군", "오산시", "용인시" , "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시"]
    let gyunggiNum : [String:Int] = ["가평군":4160000, "고양시":3940000, "과천시":3970000, "광명시":3900000, "광주시":5540000, "구리시":3980000, "군포시":4020000, "김포시":4090000, "남양주시":3990000, "동두천시":3920000, "부천시":3860000, "성남시":3780000, "수원시":3740000, "시흥시":4010000, "안산시":3930000, "안성시":4080000, "안양시":3830000, "양주시":5590000, "양평군":4170000, "여주시":5700000, "연천군":4140000, "오산시":4000000, "용인시":4050000 , "의왕시":4030000, "의정부시":3820000, "이천시":4070000, "파주시":4060000, "평택시":3910000, "포천시":5600000, "하남시":4040000, "화성시":5530000]
    
    let gangwon: [String] = ["강릉시", "고성군", "동해시", "삼척시", "속초시", "양구군", "양양군", "영월군", "원주시", "인제군", "정선군", "철원군", "춘천시", "태백시", "평창군", "홍천군", "화천군", "횡성군"]
    let gangwonNum : [String:Int] = ["강릉시":4200000, "고성군":4340000, "동해시":4210000, "삼척시":4240000, "속초시":4230000, "양구군":4320000, "양양군":4350000, "영월군":4270000, "원주시":4190000, "인제군":4330000, "정선군":4290000, "철원군":4300000, "춘천시":4180000, "태백시":4220000, "평창군":4280000, "홍천군":4250000, "화천군":4310000, "횡성군":4260000]
    
    
    var resultSi : Int?
    var resultGu : Int?
    
    var temp : [String:Int]?
    
    
    var url : String = "http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic?serviceKey=aTIaQ2xH3YX61QqRvQYCrHyJtrpYj7Omi1vFIfUCIzM4908KtnLBetjsGy99joagT9qF6OdjJK1qDsoOA6xKpw%3D%3D"
    
    var urlStartDate : String = "&bgnde=20190501"
    
    var urlEndDate : String = "&endde=20190601"
    
    var urlKind : String = "&upkind=417000"
    
    var urlSi : String = "&upr_cd="
    
    var urlGu : String = "&org_cd="
    
    var urlPlus : String = "&state=notice&pageNo=1&numOfRows=10"
    
    @IBAction func doneToSerchController(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temp?.removeAll()
        urlSi.removeAll()
        urlGu.removeAll()
        
        dropDown1 = DropDown()
        dropDown2 = DropDown()
        
        dropDown1?.anchorView = sidoCd // UIView or UIBarButtonItem
        dropDown2?.anchorView = gunguCd // UIView or UIBarButtonItem
        
        dropDown1?.bottomOffset = CGPoint(x: 0, y: (dropDown1?.anchorView?.plainView.bounds.height)!)
        dropDown2?.bottomOffset = CGPoint(x: 0, y: (dropDown2?.anchorView?.plainView.bounds.height)!)
        
        dropDown1?.dataSource = si
        
        sidoCd.addTarget(self, action: #selector(dropDownButton1), for: .touchUpInside)
        
        dropDown1?.selectionAction = {
            [unowned self](index: Int, item: String) in self.sidoCd.setTitle(item, for: .normal)
            
            self.resultSi = self.siNum[item]
            self.urlSi = "&upr_cd=" + String(self.resultSi!)
            if( item == "서울")
            {
                self.dropDown2?.dataSource = self.seoul
                self.temp = self.seoulNum
            }
            else if (item == "부산")
            {
                self.dropDown2?.dataSource = self.busan
                self.temp = self.busanNum
            }
            else if (item == "대구")
            {
                self.dropDown2?.dataSource = self.daegu
                self.temp = self.daeguNum
            }
            else if (item == "인천")
            {
                self.dropDown2?.dataSource = self.incheon
                self.temp = self.incheonNum
            }
            else if (item == "광주")
            {
                self.dropDown2?.dataSource = self.gwangju
                self.temp = self.gwangjuNum
            }
            else if (item == "세종")
            {
                self.dropDown2?.dataSource = []
                self.urlGu = ""
            }
            else if (item == "대전")
            {
                self.dropDown2?.dataSource = self.daejeon
                self.temp = self.daejeonNum
            }
            else if (item == "울산")
            {
                self.dropDown2?.dataSource = self.ulsan
                self.temp = self.ulsanNum
            }
            else if (item == "경기도")
            {
                self.dropDown2?.dataSource = self.gyunggi
                self.temp = self.gyunggiNum
            }
            else if (item == "강원도")
            {
                self.dropDown2?.dataSource = self.gangwon
                self.temp = self.gangwonNum
            }
        }
        
        self.gunguCd.addTarget(self, action: #selector(self.dropDownButton2), for: .touchUpInside)
        self.dropDown2?.selectionAction = {
            [unowned self](index: Int, item: String) in self.gunguCd.setTitle(item, for: .normal)
            self.resultGu = self.temp?[item]
            self.urlGu = "&org_cd=" + String(self.resultGu!)
        }
    }
    
    @objc func dropDownButton1() {
        dropDown1?.show()
    }
    @objc func dropDownButton2() {
        dropDown2?.show()
    }
    @objc func dropDownButton3() {
        dropDown3?.show()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "segueToTableView"
        {
            if let navController = segue.destination as? UINavigationController {
                if let shelterTableViewController = navController.topViewController as? ShelterTableViewController{
                    shelterTableViewController.url = url + urlStartDate + urlEndDate + urlKind + urlSi + urlGu + urlPlus
                }
            }
        }
        if segue.identifier == "segueToView"
        {
            if let navController = segue.destination as? UINavigationController {
                if let collectionViewController = navController.topViewController as? CollectionViewController{
                    collectionViewController.url = url + urlStartDate + urlEndDate + urlKind + urlSi + urlGu + urlPlus
                }
            }
        }
    }
}

