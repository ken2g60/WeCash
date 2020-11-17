//
//  WithdrawViewController.swift
//  WeCash
//
//  Created by knight on 11/16/20.
//

import UIKit
import CoreData

class WithdrawViewController: UIViewController, NSFetchedResultsControllerDelegate{

    var expenses: [ExpensesMO] = []
    var fetchResultController: NSFetchedResultsController<ExpensesMO>!
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController?.navigationBar.topItem?.title = "Withdraw"
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
    }


}

extension WithdrawViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "withdrawCell", for: indexPath) as! WithdrawalTableViewCell
        cell.amountLabel.text = "$ \(expenses[indexPath.row].amount)"
        cell.dateLabel.text = expenses[indexPath.row].created_at
        return cell
    }
    
    
}
