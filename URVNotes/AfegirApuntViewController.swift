//
//  AfegirApuntViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit
import DKImagePickerController

class AfegirApuntViewController: UIViewController {

    let pickerController = DKImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerController.didSelectAssets = { (assets: [DKAsset]) in
            print("didSelectAssets")
            print(assets)
        }

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func pickImageAction(sender: AnyObject) {
        self.presentViewController(pickerController, animated: true) {}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
