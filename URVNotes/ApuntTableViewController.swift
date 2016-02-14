//
//  ApuntTableViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit

class ApuntTableViewController: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var titolApuntLabel: UILabel!
    @IBOutlet weak var descripcioApuntTextArea: UITextView!
    
    @IBOutlet weak var comentarisLabel: UILabel!
    
    var apunt = Apunt()
    var imatges:[UIImage] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titolApuntLabel.text = apunt.titol
        self.descripcioApuntTextArea.text = apunt.descripcio
        
        if (self.apunt.comentaris.count == 1) {
            self.comentarisLabel.text = String(self.apunt.comentaris.count) + " comentari"
        } else {
            self.comentarisLabel.text = String(self.apunt.comentaris.count) + " comentaris"
        }
        
//        for img in self.apunt.imatges {
//            self.imatges.append(UIImage(data: img.data)!)
//        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        for img in self.apunt.imatges {
            self.imatges.append(UIImage(data: img.data)!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection View
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imatges.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("apuntImatgeCell", forIndexPath: indexPath) as! ImatgeApuntCollectionViewCell
        
        cell.imageView.image = self.imatges[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        return CGSize(width: (screenSize.width/4-1), height: (screenSize.width/4-1));
        
    }
     
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let vc = segue.destinationViewController as! ComentarisListTableViewController
        vc.apunt = self.apunt
    }
}
