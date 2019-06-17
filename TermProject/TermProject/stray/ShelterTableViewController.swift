//
//  HospitalTableViewController.swift
//  Hospital
//
//  Created by kpugame on 2019. 4. 22..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class ShelterTableViewController: UITableViewController, XMLParserDelegate {
    
    @IBOutlet var tbData: UITableView!
    
    var url : String?
    
    var parser = XMLParser()
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    
    var careNm = NSMutableString()
    var careAddr = NSMutableString()
    
    var kindCd = NSMutableString()
    var happenDt = NSMutableString()
    var happenPlace = NSMutableString()
    var age = NSMutableString()
    var colorCd = NSMutableString()
    var careTel = NSMutableString()
    var specialMark = NSMutableString()
    
    var XPos = NSMutableString()
    var YPos = NSMutableString()
    
    var filename = NSMutableString()
    
    var posts2: [String:String]?
    
    var posts3: [String] = ["","","","","","", "", "", ""]
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
        tbData!.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail"
        {
            if let cell = sender as? UITableViewCell
            {
                let indexPath = tableView.indexPath(for: cell)
                posts2 = (posts[(indexPath?.row)!] as AnyObject) as? [String : String]
                posts3[0] = posts2!["kindCd"]!
                posts3[1] = posts2!["happenDt"]!
                posts3[2] = posts2!["happenPlace"]!
                posts3[3] = posts2!["age"]!
                posts3[4] = posts2!["colorCd"]!
                posts3[5] = posts2!["specialMark"]!
                posts3[6] = posts2!["careNm"]!
                posts3[7] = posts2!["careAddr"]!
                posts3[8] = posts2!["careTel"]!
                if let detailTableViewController = (segue.destination as! UINavigationController).topViewController as! DetailTableViewController?
                {
                    detailTableViewController.posts = posts3
                }
            }
        }

    }
    
    func parser(_ parser:XMLParser, didStartElement elementName : String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict : [String: String])
    {
        element = elementName as NSString
        if (elementName as NSString).isEqual(to: "item")
        {
            elements = NSMutableDictionary()
            elements=[:]
            careNm = NSMutableString()
            careNm = ""
            careAddr = NSMutableString()
            careAddr = ""
            careTel = NSMutableString()
            careTel = ""
            colorCd = NSMutableString()
            colorCd = ""
            kindCd = NSMutableString()
            kindCd = ""
            happenPlace = NSMutableString()
            happenPlace = ""
            age = NSMutableString()
            age = ""
            happenDt = NSMutableString()
            happenDt = ""
            
            
            filename = NSMutableString()
            filename = ""
            
            specialMark = NSMutableString()
            specialMark = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        //["종", "발견일", "발견 위치", "나이", "색", "특징", "보호소명", "주소", "전화번호"]
        if element.isEqual(to: "kindCd")
        {
            kindCd.append(string)
        }
        else if element.isEqual(to: "happenDt")
        {
            happenDt.append(string)
        }
        else if element.isEqual(to: "happenPlace")
        {
            happenPlace.append(string)
        }
        else if element.isEqual(to: "age")
        {
            age.append(string)
        }
        else if element.isEqual(to: "colorCd")
        {
            colorCd.append(string)
        }
        else if element.isEqual(to: "specialMark")
        {
            specialMark.append(string)
        }
        else if element.isEqual(to: "careNm")
        {
            careNm.append(string)
        }
        else if element.isEqual(to: "careAddr")
        {
            careAddr.append(string)
        }
        else if element.isEqual(to: "careTel")
        {
            careTel.append(string)
        }
        else if element.isEqual(to: "filename")
        {
            filename.append(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item")
        {
            //["종", "발견일", "발견 위치", "나이", "색", "특징", "보호소명", "주소", "전화번호"]
            if !kindCd.isEqual(nil)
            {
                elements.setObject(kindCd, forKey: "kindCd" as NSCopying)
            }
            if !happenDt.isEqual(nil)
            {
                elements.setObject(happenDt, forKey: "happenDt" as NSCopying)
            }
            if !happenPlace.isEqual(nil)
            {
                elements.setObject(happenPlace, forKey: "happenPlace" as NSCopying)
            }
            if !age.isEqual(nil)
            {
                elements.setObject(age, forKey: "age" as NSCopying)
            }
            if !colorCd.isEqual(nil)
            {
                elements.setObject(colorCd, forKey: "colorCd" as NSCopying)
            }
            if !specialMark.isEqual(nil)
            {
                elements.setObject(specialMark, forKey: "specialMark" as NSCopying)
            }
            if !careNm.isEqual(nil)
            {
                elements.setObject(careNm, forKey: "careNm" as NSCopying)
            }
            if !careAddr.isEqual(nil)
            {
                elements.setObject(careAddr, forKey: "careAddr" as NSCopying)
            }
            if !careTel.isEqual(nil)
            {
                elements.setObject(careTel, forKey: "careTel" as NSCopying)
            }
            if !filename.isEqual(nil)
            {
                elements.setObject(filename, forKey: "filename" as NSCopying)
            }
            posts.add(elements)
        }
    }
    
    @IBAction func doneToShelterTableViewController(segue:UIStoryboardSegue)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
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

        cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "kindCd") as! NSString as String
        cell.detailTextLabel?.text = "특징: " + ((posts.object(at: indexPath.row) as AnyObject).value(forKey: "specialMark") as! NSString as String)
        
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
