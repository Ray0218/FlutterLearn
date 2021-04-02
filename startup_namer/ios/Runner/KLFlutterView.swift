//
//  KLFlutterView.swift
//  Runner
//
//  Created by WKL on 2021/3/31.
//

import UIKit
import Flutter

import SnapKit

var  kCurIndex = 0

class KLFlutterView: NSObject,FlutterPlatformView  {
    
    
    
     var rChannel: FlutterBasicMessageChannel?
    
    let rView : UIView = {
        
        let rV = UIView()
        rV.backgroundColor = UIColor.purple
        
        return rV
        
    }()
    
    let  rLabel: UILabel = {
        
        let lab = UILabel()
        lab.text = "我是原生 UILabel"
        lab.backgroundColor = UIColor.orange
        return lab
        
    }()
    
    
    lazy var rButton:UIButton = {
        
        let rBtn = UIButton()
        
        rBtn.setTitle("传值到flutter 页面", for: .normal)
        rBtn.backgroundColor = UIColor.blue
        rBtn.addTarget(self, action: #selector(pvt_addIndex), for: .touchUpInside)
        
        return rBtn
    }()
    
    
    @objc func pvt_addIndex(){
        
        kCurIndex += 1
        
        
        rChannel?.sendMessage(["rIndex": kCurIndex])
        
        
     }
    
 
    
    init(frame: CGRect,viewId: Int64,args:Any?,messenger:FlutterBinaryMessenger) {
        
        super.init()
        
        
       rChannel = FlutterBasicMessageChannel(name: "BasicMessageChannel", binaryMessenger: messenger)
        
        rChannel?.setMessageHandler({ [self] (message, apply) in
             
            
            if let str = messenger as? String{
 
                rLabel.text =  str as? String

                
            }
        })
        
        rView.frame = frame
        rView.addSubview(rLabel)
        
        rView .addSubview(rButton)
        
        rLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            
            make.width.equalTo(300)
            
            make.height.equalTo(80)
        }
        
        
         rButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
 
            make.width.equalTo(300)
 
             make.height.equalTo(60)
            
            make.top.equalToSuperview().offset(220)
        }
        
        
        guard let dic = args else {
            return
        }
        
        
        if dic is NSDictionary {
            rLabel.text = (dic as! NSDictionary).value(forKey: "text") as! String
        }
        
        let methchannel = FlutterMethodChannel(name: "Flutter_channel", binaryMessenger: messenger)
        methchannel.setMethodCallHandler { [self] (call, result) in
            
            if call.method == "setText"{
                
                if let dict = call.arguments as? Dictionary<String, Any> {
                    let name:String = dict["name"] as? String ?? ""
                    let age:Int = dict["age"] as? Int ?? -1
                    rLabel.text = "hello,\(name),年龄：\(age)"
                }
                
            }
        }
        
    }
    
    
    func view() -> UIView {
        
        
        return rView
    }
    
    
}
