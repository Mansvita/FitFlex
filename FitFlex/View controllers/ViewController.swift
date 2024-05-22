//
//  ViewController.swift
//  FitFlex
//
//  Created by Mac on 27/06/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnTapped(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let VC = storyBoard.instantiateViewController(withIdentifier: "GymVC") as! GymVC
        self.navigationController?.pushViewController(VC, animated: true)
    }
}

