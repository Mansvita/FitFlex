//
//  AboutVC.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import UIKit

class AboutVC: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackBTTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

}
