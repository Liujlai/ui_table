//
//  addVViewController.swift
//  ui_1
//
//  Created by idea_liujl on 17/7/14.
//  Copyright © 2017年 idea_liujl. All rights reserved.
//

import UIKit

class addVViewController: UIViewController {
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var DoneB: UIBarButtonItem!
   
    
    var vacation = Vacation()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if sender as! NSObject == DoneB {
            if((textF.text?.isEmpty) != nil) {
                vacation.place = textF.text!
                
            }
        }
    }
    

}
