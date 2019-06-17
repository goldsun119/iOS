//
//  DetailHospitalTableViewController.swift
//  Hospital
//
//  Created by kpugame on 2019. 5. 1..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class DetailTableViewController2: UITableViewController {

    @IBOutlet var detailTableView: UITableView!
    
    
    let postsname : [String] = ["종", "발견일", "발견 위치", "나이", "색", "특징", "보호소명", "주소", "전화번호"]
    let postsname1 : [String] = ["종", "발견일", "발견 위치", "나이", "색", "특징"]
    let postsname2 : [String] = ["보호소명", "주소", "전화번호"]
    
    var posts: [String] = ["","","","","","", "", "", "",""]
    
    var posts1:[String] = ["", "", "", "", "", ""]
    var posts2:[String] = ["","",""]
    
    var tem = Dictionary<String, String>()
    
    var elements = NSMutableDictionary()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMap2View"
        {
            if let mapViewController = segue.destination as? MapViewController
            {
                mapViewController.posts = posts
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.reloadData()
        for i in 0..<postsname.count{
            if i < 6{
                posts1[i] = posts[i]
            }
            else
            {
                posts2[i-6] = posts[i]
            }
        }
        tem["종"] = posts[0]
        tem["발견일"] = posts[1]
        tem["발견 위치"] = posts[2]
        tem["나이"] = posts[3]
        tem["색"] = posts[4]
        tem["특징"] = posts[5]
        tem["보호소명"] = posts[6]
        tem["주소"] = posts[7]
        tem["전화번호"] = posts[8]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 헤더에 들어갈 레이블 객체
        let textHeader = UILabel(frame: CGRect(x: 35, y: 5, width: 200, height: 30))
        textHeader.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight(2.5))
        textHeader.textColor = UIColor(red: 0.03, green: 0.28, blue: 0.71, alpha: 1.0)
        
        // 헤더에 들어갈 이미지 뷰 객체
        let icon = UIImageView()
        icon.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        
        // 섹션에 따라 타이틀, 이미지 설정
        if section == 0 {
            textHeader.text = "동물 정보"
            icon.image = UIImage(imageLiteralResourceName: "pet")
        } else {
            textHeader.text = "보호소 정보"
            icon.image = UIImage(imageLiteralResourceName: "home")
        }
        
        // 레이블과 이미지 뷰를 담을 컨테이너용 뷰 객체
        let v = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        v.backgroundColor = UIColor(red: 0.93, green: 0.96, blue: 0.99, alpha: 1.0)
        
        // 뷰에 레이블과 이미지 뷰 추가
        v.addSubview(textHeader)
        v.addSubview(icon)
        
        return v
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0{
            return 6
        }
        else{
            return 3
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
            
            cell.textLabel?.text = postsname1[indexPath.row]
            cell.detailTextLabel?.text = posts1[indexPath.row]
            
            // Configure the cell...
            
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShelterCell", for: indexPath)
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
            
            cell.textLabel?.text = postsname2[indexPath.row]
            cell.detailTextLabel?.text = posts2[indexPath.row]
            
            // Configure the cell...
            
            return cell
        }
    }
}
