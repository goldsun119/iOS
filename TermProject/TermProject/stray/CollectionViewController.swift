//
//  CollectionViewController.swift
//  StrayPet
//
//  Created by kpugame on 2019. 6. 3..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController, XMLParserDelegate {

    
    @IBOutlet var collectionview: UICollectionView!
    
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
    
    var posts3: [String] = ["","","","","","", "", "", "", ""]
    
    func beginParsing()
    {
        posts = []
        parser = XMLParser(contentsOf: (URL(string:url!))!)!
        parser.delegate = self
        parser.parse()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDetail"
        {
            if let cell = sender as? UICollectionViewCell
            {
                let indexPath = collectionView.indexPath(for: cell)
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
                posts3[9] = posts2!["filename"]!
                
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        
        let s = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "kindCd") as! NSString as String
        cell.collectioncell_textview.text = s
        if let url = URL(string: (posts.object(at: indexPath.row) as AnyObject).value(forKey: "filename") as! NSString as String)
        {
            if let data = try? Data(contentsOf: url)
            {
                cell.collectioncell_imageview.image = UIImage(data: data)
            }
        }
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
