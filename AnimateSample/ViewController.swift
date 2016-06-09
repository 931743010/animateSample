//
//  ViewController.swift
//  AnimateSample
//
//  Created by YaoJunguang on 16/6/9.
//  Copyright © 2016年 HomeBar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var animateView:HomeBarConnect?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        animateView?.change2state(HomeBarManageState.disabled)
    }
    
    @IBAction func clickState(sender:UIButton){
        animateView?.change2state(HomeBarManageState(rawValue: sender.tag)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

