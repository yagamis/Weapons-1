//
//  RateController.swift
//  Weapons
//
//  Created by yons on 2018/1/7.
//  Copyright © 2018年 xiao bo's studio. All rights reserved.
//

import UIKit

class RateController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var rateBtns: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let startPos = CGAffineTransform(translationX: 500, y: 0)
        let startScale = CGAffineTransform(scaleX: 10, y: 10)
        
        for btn in rateBtns {
            btn.alpha = 0
            btn.transform = startPos.concatenating(startScale)
        }
    }
    
    @IBAction func dragStackView(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: view)
            let position = CGAffineTransform(translationX: translation.x, y: translation.y)
            let angle = sin(translation.x / stackView.frame.width)
            stackView.transform = position.rotated(by: angle)
        case .ended:
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5, animations: {
                self.stackView.transform = .identity
            }).startAnimation()
        default:
            break
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateBtns[0].alpha = 1
            self.rateBtns[0].transform = .identity
        }.startAnimation(afterDelay: 0.1)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateBtns[1].alpha = 1
            self.rateBtns[1].transform = .identity
            }.startAnimation(afterDelay: 0.2)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateBtns[2].alpha = 1
            self.rateBtns[2].transform = .identity
            }.startAnimation(afterDelay: 0.3)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateBtns[3].alpha = 1
            self.rateBtns[3].transform = .identity
            }.startAnimation(afterDelay: 0.4)
        
        UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
            self.rateBtns[4].alpha = 1
            self.rateBtns[4].transform = .identity
            }.startAnimation(afterDelay: 0.5)
        



    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBackground(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true)
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
