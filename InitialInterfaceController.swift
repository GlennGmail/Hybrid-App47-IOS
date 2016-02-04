//
//  InitialInterface.swift
//  Hybrid App47 IOS
//
//  Created by Ujwal Manjunath on 1/20/16.
//  Copyright © 2016 BedBathAndBeyond. All rights reserved.
//

import UIKit

enum TableCells:String {
    case HybridTest5 = "HybridTest5"
    case APP47 = "Download App 47 COnfig"
    case OmniturePOC = "Omniture POC"
    
    static let all = [HybridTest5, APP47, OmniturePOC]

}

class InitialInterfaceController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension InitialInterfaceController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableCells.all.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
         cell.textLabel!.text = TableCells.all[indexPath.row].rawValue
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       
        switch indexPath.row {
            
            case 0: let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(Test5HybridController.id) as! Test5HybridController
                    self.navigationController?.pushViewController(controller, animated: true)
                
            case 1: let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(APP47Controller.id) as! APP47Controller
                    self.navigationController?.pushViewController(controller, animated: true)
            
            case 2: let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier(OmnitureController.id) as! OmnitureController
                self.navigationController?.pushViewController(controller, animated: true)
            
            default: break
        }
    }
    
}