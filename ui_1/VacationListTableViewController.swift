//
//  VacationListTableViewController.swift
//  ui_1
//
//  Created by idea_liujl on 17/7/14.
//  Copyright © 2017年 idea_liujl. All rights reserved.
//

import UIKit

class VacationListTableViewController: UITableViewController {
    var vacationList = [Vacation]()
    
    func loadInitData(){
       let vacation1 = Vacation()
        vacation1.place = "🤔"
        vacationList.append(vacation1)
        
        let vacation2 = Vacation()
        vacation2.place = "😒"
        vacationList.append(vacation2)
        
        let vacation3 = Vacation()
        vacation3.place = "😄"
        vacationList.append(vacation3)
        
        let vacation4 = Vacation()
        vacation4.place = "😯"
        vacationList.append(vacation4)
        
        
        let vacation5 = Vacation()
        vacation5.place = "🙀"
        vacationList.append(vacation5)
        
        let vacation6 = Vacation()
        vacation6.place = "🙄"
        vacationList.append(vacation6)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        loadInitData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableView.setEditing(editing, animated: true)
    }
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
//            删除数组所在行
            vacationList.removeAtIndex(indexPath.row)
//            删除单元格所在行
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vacationList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Pcell", forIndexPath: indexPath)

        // Configure the cell...
       let v1 = vacationList[indexPath.row]
        cell.textLabel?.text = v1.place
        
        if v1.visited{
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }else{
            cell.accessoryType = UITableViewCellAccessoryType.None
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let v1 = vacationList[indexPath.row]
        v1.visited = !v1.visited
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//        刷新
        tableView.reloadData()
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
    
    @IBAction func unwindToList(segue: UIStoryboardSegue){
       let source = segue.sourceViewController as! addVViewController
        let v1 = source.vacation
        if v1.place != "" {
            vacationList.append(v1)
            tableView.reloadData()
        }
    }
    
    
}
