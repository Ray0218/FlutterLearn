//
//  ViewController.swift
//  KLNativeAddFlutter
//
//  Created by WKL on 2021/3/31.
//

import UIKit
import Flutter

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        title = "native 掺入 flutter"
    }


    @IBAction func pvt_showFlutter(_ sender: UIButton) {
        
        
        let flutterEngin  = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        
        let flutterController = FlutterViewController(engine: flutterEngin, nibName: nil, bundle: nil)
        
        present(flutterController, animated: true, completion: nil)
        
        
    }
}

