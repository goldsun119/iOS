//
//  PlayerDetails_ViewController.swift
//  Ratings
//
//  Created by kpugame on 2019. 4. 1..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class PlayerDetails_ViewController: UITableViewController {
    var player:Player?
    
    var game:String = "배틀그라운드"{
        didSet{
            detailLabel.text?=game
        }
    }
    
    var rating:Int = 1{
        didSet{
            ratingImageView.image? = imageForRating(rating: rating)!
        }
    }
    
    @IBOutlet weak var ratingImageView: UIImageView!

    func imageForRating(rating:Int)->UIImage?{
    let imageName = "\(rating)Stars"
        return UIImage(named:imageName)
    }
    
    @IBAction func unwindWithSelectedStar(segue:UIStoryboardSegue){
        if let starPickerViewController = segue.source as? StarPickerViewController{
            rating = starPickerViewController.rating
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue){
        if let gamePickerViewController = segue.source as? GamePickerView_Controller, let selectedGame = gamePickerViewController.selectedGame{
            game = selectedGame
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail"{
            player = Player(name: nameTextField.text!, game: game, rating: rating)
        }
        
        if segue.identifier == "PickGame"{
            if let gamePickerViewController = segue.destination as? GamePickerView_Controller{
                gamePickerViewController.selectedGame = game
            }
        }
        
        if segue.identifier == "PickStar"{
            if let starPickerViewController = segue.destination as? StarPickerViewController{
                starPickerViewController.rating = rating
            }
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingImageView.image=imageForRating(rating: rating)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            nameTextField.becomeFirstResponder()
        }
    }

}
