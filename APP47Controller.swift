//
//  APP47Controller.swift
//  Hybrid App47 IOS
//
//  Created by Ujwal Manjunath on 1/25/16.
//  Copyright © 2016 BedBathAndBeyond. All rights reserved.
//

import UIKit

class APP47Controller: UIViewController {
    
    static let id = "APP47Controller"
    @IBOutlet weak var configLabel: UILabel!
    @IBOutlet weak var configName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       configName.text = "\(EmbeddedAgent.configurationGroupNames())"
        if let groupName = EmbeddedAgent.configurationGroupNames().first as? String {
            configLabel.text = "\(EmbeddedAgent.configurationGroupAsDictionary(groupName))"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOnBackButton(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
