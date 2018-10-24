//
//  goodJokeSwitchVC.swift
//  iKid
//
//  Created by iosdev on 10/24/18.
//  Copyright © 2018 iosdev. All rights reserved.
//

import UIKit

class goodJokeSwitchVC: UIViewController {
    
    fileprivate var goodJoke1 : goodJoke1VC!
    fileprivate var goodJoke2 : goodJoke2VC!
    
    fileprivate func goodJoke1Builder() {
        if goodJoke1 == nil {
            goodJoke1 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "goodJoke1")
                    as! goodJoke1VC)
        }
    }
    fileprivate func goodJoke2Builder() {
        if goodJoke2 == nil {
            goodJoke2 =
                (storyboard?
                    .instantiateViewController(withIdentifier: "goodJoke2")
                    as! goodJoke2VC)
        }
    }
    
    @IBAction func goodJokeSwitchView(_ sender: Any) {
        goodJoke1Builder()
        goodJoke2Builder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if goodJoke1 != nil && goodJoke1?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            goodJoke2.view.frame = view.frame
            goodJokeSwitchViewController(goodJoke1, to: goodJoke2)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            goodJoke1.view.frame = view.frame
            goodJokeSwitchViewController(goodJoke2, to: goodJoke1)
        }
        
        UIView.commitAnimations()
        
    }
    
    fileprivate func goodJokeSwitchViewController(_ from: UIViewController?, to: UIViewController?) {
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
        
        goodJoke1Builder()
        goodJokeSwitchViewController(nil, to: goodJoke1)

    }
    


}
