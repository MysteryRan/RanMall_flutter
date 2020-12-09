//
//  Event.swift
//  Runner
//
//  Created by zouran on 2020/12/9.
//

import UIKit
import Flutter

class Event: NSObject {
    var eventSink: FlutterEventSink?
    
    func setUpHybird(window: UIWindow) {
        if let controller = window.rootViewController as? FlutterViewController {
            let eventChannel = FlutterEventChannel(name: "event_channel_page", binaryMessenger: controller.binaryMessenger)
            eventChannel.setStreamHandler(self)
        }
    }
}

extension Event: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        self.eventSink!(["content":"这是event从native传过来的值"])
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}
