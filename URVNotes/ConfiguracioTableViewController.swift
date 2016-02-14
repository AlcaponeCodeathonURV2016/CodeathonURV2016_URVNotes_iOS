//
//  ConfiguracioTableViewController.swift
//  URVNotes
//
//  Created by Pau Martín on 13/2/16.
//  Copyright © 2016 Alcapone. All rights reserved.
//

import UIKit

class ConfiguracioTableViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var profileUserImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnamesTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var grauTextField: UITextField!
    @IBOutlet weak var assignaturesTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileUserImage.layer.cornerRadius = profileUserImage.frame.size.width * 0.5;
        
        self.nameTextField.delegate = self
        self.surnamesTextField.delegate = self
        self.emailTextField.delegate = self
        self.grauTextField.delegate = self
        self.assignaturesTextField.delegate = self
        
        self.nameTextField.text = current_user.nom
        self.surnamesTextField.text = current_user.cognoms
        self.emailTextField.text = current_user.email
        
        self.nameTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.surnamesTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.emailTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.grauTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        self.assignaturesTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func textFieldDidChange(textField: UITextField) {
        switch textField.tag {
        case 0:
            try! realm.write {
                current_user.nom = textField.text!
            }
            
        case 1:
            try! realm.write {
                current_user.cognoms = textField.text!
            }

        case 2:
            try! realm.write {
                current_user.email = textField.text!
            }
            
//        case 3: current_user.graus = textField.text!
        default: break
        }       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
