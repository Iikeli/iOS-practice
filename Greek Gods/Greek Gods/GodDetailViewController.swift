//
//  GodDetailViewController.swift
//  Greek Gods
//
//  Created by Iiro Alhonen on 22.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import UIKit

class GodDetailViewController: UIViewController {
    @IBOutlet weak var godNameLabel: UILabel!
    @IBOutlet weak var godDetailsLabel: UILabel!
    @IBOutlet weak var godImageView: UIImageView!
    
    var god: GreekGod?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadInitialData()
    }
    
    func loadInitialData() {
        godNameLabel.text = god?.name
        godDetailsLabel.text = String(describing: god!.height) + "m. " + (god?.superPower)!
        godImageView.image = UIImage(named: (god?.name)!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
