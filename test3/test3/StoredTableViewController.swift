//
//  HospitalTableViewController.swift
//  Hospital
//
//  Created by kpugame on 2019. 4. 22..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class StoredTableViewController: UITableViewController {
    
    @IBOutlet var tbData: UITableView!
    
    var posts = NSMutableArray()
    var posts2: [String:String]?
    
    var posts3: [String] = ["","","","","","", "", "", ""]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail2"
        {
            if let cell = sender as? UITableViewCell
            {
                let indexPath = tableView.indexPath(for: cell)
                posts2 = (posts[(indexPath?.row)!] as AnyObject) as? [String : String]
                posts3[0] = posts2!["종"]!
                posts3[1] = posts2!["발견일"]!
                posts3[2] = posts2!["발견 위치"]!
                posts3[3] = posts2!["나이"]!
                posts3[4] = posts2!["색"]!
                posts3[5] = posts2!["특징"]!
                posts3[6] = posts2!["보호소명"]!
                posts3[7] = posts2!["주소"]!
                posts3[8] = posts2!["전화번호"]!
                if let detailTableViewController = (segue.destination as! UINavigationController).topViewController as! DetailTableViewController2?
                {
                    detailTableViewController.posts = posts3
                }
            }
        }

    }
    
    @IBAction func doneToStoredTableViewController(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "종") as! NSString as String
        cell.detailTextLabel?.text = "특징: " + ((posts.object(at: indexPath.row) as AnyObject).value(forKey: "특징") as! NSString as String)
        
        if let url = URL(string: (posts.object(at: indexPath.row) as AnyObject).value(forKey: "filename") as! NSString as String)
        {
            if let data = try? Data(contentsOf: url)
            {
                cell.imageView?.image = UIImage(data: data)
            }
        }
        
        return cell
    }
}
