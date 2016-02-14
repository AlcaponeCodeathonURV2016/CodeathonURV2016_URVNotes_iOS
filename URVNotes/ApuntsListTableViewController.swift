//
//  ApuntsListTableViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit
import RealmSwift

class ApuntsListTableViewController: UITableViewController {
    var apunts = realm.objects(Apunt)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView.init(frame: CGRectZero)
        
        apunts = realm.objects(Apunt)
    }
    override func viewWillAppear(animated: Bool) {
        apunts = realm.objects(Apunt)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.apunts.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("apuntTableViewCell", forIndexPath: indexPath) as! ApuntTableViewCell

        let apunt = apunts[indexPath.row]
        cell.nameLabel.text = apunt.titol
        cell.authorNameLabel.text = (apunt.propietari?.nom)! + " " + (apunt.propietari?.cognoms)!
        cell.likesCounterLabel.text = String(apunt.likes)
        cell.dislikesCounterLabel.text = String(apunt.dislikes)
        if apunt.imatges.count > 0 {
            cell.apuntImage.image = UIImage(data: apunt.imatges[0].data)
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            try! realm.write {
                realm.delete(self.apunts[indexPath.row])
            }
            self.apunts = realm.objects(Apunt)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        self.tableView.reloadData()
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let vc = segue.destinationViewController as! ApuntTableViewController
        vc.apunt = self.apunts[indexPath.row]
        vc.title = self.apunts[indexPath.row].titol
    }
}