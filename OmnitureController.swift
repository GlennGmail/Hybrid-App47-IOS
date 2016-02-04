//
//  OmnitureController.swift
//  Hybrid App47 IOS
//
//  Created by Ujwal Manjunath on 1/26/16.
//  Copyright © 2016 BedBathAndBeyond. All rights reserved.
//

import UIKit

class OmnitureController: UIViewController {

    static let id = "OmnitureController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapOnBackButton(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }

}
