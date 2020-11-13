//
//  AddFundTableViewController.swift
//  WeCash
//
//  Created by knight on 10/8/20.
//

import UIKit
import CoreData

class AddFundTableViewController: UITableViewController, UITextFieldDelegate {
  
    
    
    var dropDownList = ["Food Items", "Utilties Bills", "Family", "Internet Bills", "Other"]
    
    
    var expenses: ExpensesMO!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var addFund: UIBarItem!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var categoryExpenses: UITextField!
    var categorySelected: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phoneNumber.becomeFirstResponder()
        
    }
    
    @IBAction func depositTapped(_ sender: UIButton){
        // process the deposit
    
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate){
            expenses = ExpensesMO(context: appDelegate.persistentContainer.viewContext)
            
              
            
            let now = Date()
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone.current
            formatter.dateFormat = "yyyy-MM-dd HH:mm"
            let dateString = formatter.string(from: now)
            
            expenses.phoneNumber = phoneNumber.text
            expenses.email = emailAddress.text
            expenses.category = categorySelected
            expenses.created_at = dateString
            
            if let expenseAmount = Double(amount.text!){
                expenses.amount = expenseAmount
            }
            
            
            
            let alert = UIAlertController(title: "", message: "Saved Expenses", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
            
            appDelegate.saveContext()
            self.navigationController?.popToRootViewController(animated: true)

                    
            }
            
        }
        
    }
   

