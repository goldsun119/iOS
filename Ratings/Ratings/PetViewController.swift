//
//  PlayersViewController.swift
//  Ratings
//
//  Created by kpugame on 2019. 3. 28..
//  Copyright © 2019년 kpugame. All rights reserved.
//

import UIKit

class PetViewController: UITableViewController {
    //players변수: Player 클래스 인스턴스 배열, 초기값은 playersData에서 가져와
    var players:[Player] = playersData

    
    @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue){
        
    }
    
    @IBAction func saveToPlayerDetail(segue:UIStoryboardSegue){
        if let playerDetailsViewController = segue.source as? PlayerDetails_ViewController{
            if let player = playerDetailsViewController.player{
                players.append(player)
                
                let indexPath = IndexPath(row: players.count-1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        // section은 1로 변경
        return 1
        //return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //section의 row개수는 players 배열 원소 개수로 변경
        return players.count
        //return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
       //indexPath = (Section,row)튜플
        //players배열에서 Player인스턴스를 꺼내서 name, game을 cell의 title, subtitle로 지정
        let player = players[indexPath.row] as Player
       /*  cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.game*/
     
//        if let nameLabel = cell.viewWithTag(100) as? UILabel{
//            nameLabel.text = player.name
//        }
//        if let gameLabel = cell.viewWithTag(101) as? UILabel{
//            gameLabel.text = player.game
//        }
//        if let ratingImageView = cell.viewWithTag(102) as? UIImageView{
//            ratingImageView.image = self.imageForRating(rating: player.rating)
//        }
        cell.player = player
        
        return cell
    }
    
    ////rating에 따라 서로 다른 별 개수 이미지를 반환하는 함수
//    func imageForRating(rating: Int) -> UIImage?{
//        let imageName = "\(rating)Stars"
//        return UIImage(named: imageName)
//    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
