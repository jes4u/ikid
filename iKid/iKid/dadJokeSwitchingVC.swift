//
//  dadJokeSwitchingVC.swift
//  iKid
//
//  Created by iosdev on 10/24/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class dadJokeSwitchingVC: UIViewController {
    
    fileprivate var dadJoke1 : dadJoke1VC!
    fileprivate var dadJoke2 : dadJoke2VC!
    
    fileprivate func dadJoke1Builder() {
        if dadJoke1 == nil {
            dadJoke1 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "dadJoke1")
                    as! dadJoke1VC)
        }
    }
    fileprivate func dadJoke2Builder() {
        if dadJoke2 == nil {
            dadJoke2 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "dadJoke2")
                    as! dadJoke2VC)
        }
    }
    
    @IBAction func dadJokeSwitchView(_ sender: Any) {
        dadJoke1Builder()
        dadJoke2Builder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if dadJoke1 != nil && dadJoke1?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            dadJoke2.view.frame = view.frame
            dadJokeSwitchViewController(dadJoke1, to: dadJoke2)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            dadJoke1.view.frame = view.frame
            dadJokeSwitchViewController(dadJoke2, to: dadJoke1)
        }
        
        UIView.commitAnimations()
    }
    
    fileprivate func dadJokeSwitchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dadJoke1Builder()
        dadJokeSwitchViewController(nil, to: dadJoke1)
    }
    


}
