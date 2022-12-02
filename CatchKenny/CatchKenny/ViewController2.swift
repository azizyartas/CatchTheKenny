//
//  ViewController2.swift
//  CatchKenny
//
//  Created by Aziz Yartaş on 2.12.2022.
//

import UIKit

class ViewController2: UIViewController {

    var interval = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func beginnerButton(_ sender: Any) {
        interval = 1.0
        performSegue(withIdentifier: "toViewContoller3", sender: nil)
        
    }
    @IBAction func intermediateButton(_ sender: Any) {
        interval = 0.7
        performSegue(withIdentifier: "toViewContoller3", sender: nil)
    }
    
    @IBAction func advencedButton(_ sender: Any) {
        interval = 0.4
        performSegue(withIdentifier: "toViewContoller3", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewContoller3" {
            let destination = segue.destination as! ViewController
            destination.interval = interval
        }
    }
}
