//
//  ViewController.swift
//  WeCash
//
//  Created by knight on 10/8/20.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate{
   
    

    var expenses: [ExpensesMO] = []
    @IBOutlet weak var balance: UILabel! {
        didSet {
            balance.numberOfLines = 0
        }
    }
    @IBOutlet weak var tableView: UITableView!
    var fetchResultController: NSFetchedResultsController<ExpensesMO>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.navigationController?.navigationBar.topItem?.title = "Home"
        
        // dummy data
        // balance.text = "$10,000"

        
        // balance tapped
        let tap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapBalanceWithdraw))
//        balance.isUserInteractionEnabled = true
//        balance.addGestureRecognizer(tap)
        
        setNeedsStatusBarAppearanceUpdate()
        
        // fetch data
        let fetchRequest: NSFetchRequest<ExpensesMO> = ExpensesMO.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "amount", ascending: true)
        fetchRequest.sortDescriptors  = [sortDescriptor]
        
        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            let context = appDelegate.persistentContainer.viewContext
            
            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultController.delegate = self
            
            do {
                try fetchResultController.performFetch()
                if let fetchObjects = fetchResultController.fetchedObjects {
                    expenses = fetchObjects
                }
            } catch {
                print(error)
            }
        }
        
        // Expenses tracking
       
        let keypathExp = NSExpression(forKeyPath: "amount")
        let expression = NSExpression(forFunction: "sum:", arguments: [keypathExp])
        let sumDesc = NSExpressionDescription()
        sumDesc.expression = expression
        sumDesc.name = "sum"
        sumDesc.expressionResultType = .doubleAttributeType

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Expense")
        request.returnsObjectsAsFaults = false
        request.propertiesToFetch = [sumDesc]
        request.resultType = .dictionaryResultType

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let record = try! context.fetch(request)
        for records in record {
            print(records)
        }
        
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "history", for: indexPath) as! HistoryTableCell
        cell.amount.text = "$ \(expenses[indexPath.row].amount)"
        cell.date.text = expenses[indexPath.row].created_at
        return cell
    }
    
    
    @objc func tapBalanceWithdraw(sender: UITapGestureRecognizer){
        performSegue(withIdentifier: "withdrawfund", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "withdrawfund" {
            print("withdrawfund")
        }
    }
    
    
  
   

}

