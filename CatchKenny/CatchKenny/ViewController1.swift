//
//  ViewController1.swift
//  CatchKenny
//
//  Created by Aziz Yartaş on 2.12.2022.
//

import UIKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "toViewController2", sender: nil)
    }
    
    @IBAction func infoButton(_ sender: Any) {
        let alert1 = UIAlertController(title: "How To Play?", message: "You have to catch Kenny to earn score until time's over. Be careful, Kenny moves very fast. We will store your score when you have high score. Good Luck!", preferredStyle: .actionSheet)
        let okButton = UIAlertAction(title: "OK", style: .cancel)
        alert1.addAction(okButton)
        present(alert1, animated: true)
    }
    
}
