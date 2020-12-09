//
//  Method.swift
//  Runner
//
//  Created by zouran on 2020/12/9.
//

import UIKit

class Method: NSObject {
    func setUpHybird(window: UIWindow) {
        if let controller = window.rootViewController as? FlutterViewController {
            let methodChannel = FlutterMethodChannel(name: "method_channel_page", binaryMessenger: controller.binaryMessenger)
            methodChannel.setMethodCallHandler { (call, result) in
                print(call.method,call.arguments)
                if call.method == "methodchannel1" {
                    result(["content":"这是method从native传过来的值"])
                } else if call.method == "methodchannel2" {
                    methodChannel.invokeMethod("MethodChannel2", arguments: ["content":"这是method从native传过来的值"])
                } else if call.method == "methodchannel3" {
                    result(["content":"这是method从native传过来的值"])
                } else {
                    
                }
            }
        }
    }
}
