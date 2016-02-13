//
//  AfegirApuntTableViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit
import DKImagePickerController

class AfegirApuntTableViewController: UITableViewController, UITextFieldDelegate , UICollectionViewDataSource, UICollectionViewDelegate{

    let pickerController = DKImagePickerController()
    var imatges = [DKAsset]()
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var assignaturaTextField: UITextField!
    @IBOutlet weak var descriptionTextArea: UITextView!
    @IBOutlet weak var collectionViewImatges: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleTextField.delegate = self
        self.assignaturaTextField.delegate = self
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            self.imatges = assets
            if(self.imatges.count == 0) {
                self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1))!.hidden = true
            }else{
                self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 1))!.hidden = false
            }
            self.collectionViewImatges.reloadData()
            self.tableView.reloadData()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pickImageAction(sender: AnyObject) {
        self.presentViewController(pickerController, animated: true) {}
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1 && indexPath.section == 1 {
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            let height = Int(ceil(Double(self.imatges.count)/4.0))*(Int(screenSize.width)/4)
            return CGFloat(height)
        }
        return 44.0
    }
    
    // MARK: - Collection View
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imatges.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("apuntImatgeCell", forIndexPath: indexPath) as! ImatgeApuntCollectionViewCell
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        self.imatges[indexPath.item].fetchImageWithSize(layout.itemSize.toPixel(), completeBlock: { image, info in
            cell.imageView.image = image
        })
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        return CGSize(width: (screenSize.width/4-1), height: (screenSize.width/4-1));
        
    }
    
    @IBAction func publicate(sender: AnyObject) {
        
    }

}
