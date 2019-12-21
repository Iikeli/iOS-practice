//
//  FirstViewController.swift
//  back-to-the-future
//
//  Created by Iiro Alhonen on 20.12.2019.
//  Copyright © 2019 Nifty Tree Studios. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var yearFirstNumLabel: UILabel!
    @IBOutlet weak var yearSecondNumLabel: UILabel!
    @IBOutlet weak var yearThirdNumLabel: UILabel!
    @IBOutlet weak var yearFourthNumLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    let utils: Utilities = Utilities()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let year = utils.getCurrentYear()
        yearFirstNumLabel.text = utils.getLetterAtIndex(str: year, location: 0)
        yearSecondNumLabel.text = utils.getLetterAtIndex(str: year, location: 1)
        yearThirdNumLabel.text = utils.getLetterAtIndex(str: year, location: 2)
        yearFourthNumLabel.text = utils.getLetterAtIndex(str: year, location: 3)
        showDate()
        setupTimer()
    }
    
    func setupTimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.showTime()
        })
    }

    func showDate() {
        let dateStr = utils.getCurrentDate()
        todayDateLabel.text = dateStr
    }
    
    func showTime() {
        let timeStr = utils.getCurrentTime()
        currentTimeLabel.text = timeStr
    }

}

