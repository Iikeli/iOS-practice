//
//  SecondViewController.swift
//  back-to-the-future
//
//  Created by Iiro Alhonen on 20.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var yearFirstNumLabel: UILabel!
    @IBOutlet weak var yearSecondNumLabel: UILabel!
    @IBOutlet weak var yearThirdNumLabel: UILabel!
    @IBOutlet weak var yearFourthNumLabel: UILabel!
    
    let utils: Utilities = Utilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRandomYearButton(_ sender: UIButton) {
        // Make a random year
        let year = utils.getRandomYear()
        animateItem(duration: 0.2, delay: 0, object: yearFourthNumLabel)
        yearFirstNumLabel.text = utils.getLetterAtIndex(str: year, location: 0)
        animateItem(duration: 0.2, delay: 0.15, object: yearThirdNumLabel)
        yearSecondNumLabel.text = utils.getLetterAtIndex(str: year, location: 1)
        animateItem(duration: 0.2, delay: 0.3, object: yearSecondNumLabel)
        yearThirdNumLabel.text = utils.getLetterAtIndex(str: year, location: 2)
        animateItem(duration: 0.2, delay: 0.45, object: yearFirstNumLabel)
        yearFourthNumLabel.text = utils.getLetterAtIndex(str: year, location: 3)
    }
    
    func animateItem (duration: Double, delay: Double, object: UIView) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseOut, animations: {
            object.center.y += self.view.bounds.width
        }) { (true) in
            // Completes at end of animation
        }
    }
}

