//
//  ComentarisListTableViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 14/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit
import RealmSwift

class ComentarisListTableViewController: UITableViewController {

    var comentaris:[Comentari] = []
    var apunt = Apunt()
    var comentariTextField:UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        for comment in apunt.comentaris {
            comentaris.append(comment)
        }
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.comentaris.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("comentariCell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel!.text = self.comentaris[indexPath.row].descripcio
        cell.detailTextLabel!.text = self.comentaris[indexPath.row].owner!.nom + " " + self.comentaris[indexPath.row].owner!.cognoms

        return cell
    }

    @IBAction func afegirComentariAction(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Afegir comentari", message: "", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default, handler: {
            alert -> Void in
            let comentari = Comentari(value: ["id":NSUUID().UUIDString,
                "owner":current_user,
                "apunt":self.apunt,
                "descripcio":String(alertController.textFields![0].text),
                "likes": 0,
                "dislikes": 0,
                "data": NSDate()]);
            
            try! realm.write {
                realm.add(comentari)
                self.apunt.comentaris.append(comentari)
            }
            self.tableView.reloadData()
        })
        let cancelAction = UIAlertAction(title: "Cancela", style: .Default) { (action) in }
        alertController.addAction(OKAction)
        alertController.addAction(cancelAction)
        alertController.addTextFieldWithConfigurationHandler(addTextField)
        self.presentViewController(alertController, animated: true) { }
    }
    
    func addTextField(textField: UITextField!){
        // add the text field and make the result global
        textField.placeholder = "Comentari"
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
