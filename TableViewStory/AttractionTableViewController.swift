//
//  AttractionTableViewController.swift
//  TableViewStory
//
//  Created by katu on 11/09/2024.
//

import UIKit

class AttractionTableViewController: UITableViewController {
    
    var attractionImages = [String] ()
    var attractionNames = [String] ()
    var webAddresses = [String] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func initialize() {
        
        attractionNames = ["Buckingham Palace",
                           "The Eiffel Tower",
                           "The Grand Canyon",
                           "Windsor Castle",
                           "Empire State Building"]
        
        attractionImages = ["buckinghamPalace.jpg",
                            "Eiffel.jpg",
                            "GrandCanyon.jpg",
                            "Windsor.jpg",
                            "EmpireState.jpg"]
        
        webAddresses = ["https://en.wikipedia.org/wiki/Buckingham_Palace",
                        "https://en.wikipedia.org/wiki/Eiffel_Tower",
                        "https://en.wikipedia.org/wiki/Grand_Canyon",
                        "https://en.wikipedia.org/wiki/Windsor_Castle",
                        "https://en.wikipedia.org/wiki/Empire_State_Building"]
        
        tableView.estimatedRowHeight = 50
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attractionNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionTableCell", for: indexPath)
            as! AttractionTableViewCell
        
        let row = indexPath.row
        cell.attractionLabel.font =
        UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        cell.attractionLabel.text = attractionNames[row]
        cell.attractionImage.image = UIImage(named: attractionImages[row])
        return cell
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [
            UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
                
                let row = indexPath.row
                self.attractionNames.remove(at: row)
                self.attractionImages.remove(at: row)
                self.webAddresses.remove(at: row)
                completionHandler(true)
                tableView.reloadData()
            })
        ])
        return configuration
    }
                

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAttractionDetails" {
               let detailViewController = segue.destination
                    as! AttractionDetailViewController
               let myIndexPath = self.tableView.indexPathForSelectedRow!
               let row = myIndexPath.row
               detailViewController.webSite = webAddresses[row]
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
