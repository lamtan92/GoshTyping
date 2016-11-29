//
//  SingleLineViewController.swift
//  GoshTyping
//
//  Created by Lam Tran on 11/24/16.
//  Copyright © 2016 Tan Lam. All rights reserved.
//

import UIKit

class SingleLineViewController: UIViewController {

    //  MARK: Properties
    var animationTimer: Timer?
    var fullText: String?
    
    @IBOutlet weak var typingLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fullText = typingLable.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        animationTimer?.invalidate()
    }

    @IBAction func onAnimateClick(_ sender: Any) {
        animateText()
    }
    
    //  MARK: Animation
    func animateText() {
        animationTimer?.invalidate()
        
        typingLable.text = nil
        
        var nextCharacterIndexToBeShow = 0
        
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer:Timer) in
            if let fullTextTobeWriten = self.fullText, let lable = self.typingLable {
                let characters = Array(self.fullText!.characters)
                
                if nextCharacterIndexToBeShow < characters.count {
                    let nextCharacter = String(characters[nextCharacterIndexToBeShow])
                    
                    if let currentText = lable.text {
                        lable.text = currentText + nextCharacter
                    } else {
                        lable.text = nextCharacter
                    }
                    
                    nextCharacterIndexToBeShow += 1
                } else {
                    timer.invalidate()
                }
                
            } else {
                timer.invalidate()
            }
        })
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
