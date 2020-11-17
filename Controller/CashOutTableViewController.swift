//
//  CashOutTableViewController.swift
//  WeCash
//
//  Created by knight on 10/8/20.
//

import UIKit

class CashOutTableViewController: UITableViewController {

    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var amount: UITextField!
    
    var balance: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func withdrawTapped(segue: UIButton){
        print("process withdraw")
    }

    // MARK: - Table view data source

 

}
