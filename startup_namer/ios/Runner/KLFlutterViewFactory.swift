//
//  KLFlutterViewFactory.swift
//  Runner
//
//  Created by WKL on 2021/3/31.
//

import UIKit

class KLFlutterViewFactory: NSObject,FlutterPlatformViewFactory {
    
    
    
    var messageManager : FlutterBinaryMessenger
    
    init(messenger: FlutterBinaryMessenger) {
        messageManager = messenger
        super.init()
    }
    
    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return KLFlutterView(frame: frame, viewId: viewId, args: args,messenger: messageManager)
    }
    
    
    func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance() //与flutter中的编码格式保持一致
    }

}
