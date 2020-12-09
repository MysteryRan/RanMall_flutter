//
//  Basic.swift
//  Runner
//
//  Created by zouran on 2020/12/9.
//

import UIKit
import Flutter

class Basic: NSObject {
    
    func setUpHybird(window: UIWindow) {
        if let controller = window.rootViewController as? FlutterViewController {
            let messageChannel = FlutterBasicMessageChannel(name: "basic_channel_page", binaryMessenger: controller.binaryMessenger)
//            messageChannel.sendMessage(["content":"这是从native传过来的值"])
            messageChannel.setMessageHandler { (message, callback) in
                
                print(message)
                
//                callback(["content":"这是basic从native传过来的值"])
                
                let nativeVC = NativeViewController()
                controller.present(nativeVC, animated: true, completion: nil)
            }
        }
    }
}
