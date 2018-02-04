//
//  SocketService.swift
//  Smack
//
//  Created by Bari Abdul on 2/3/18.
//  Copyright © 2018 Bari Abdul. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {

    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!, config: [.log(true), .compress])
    //let socket = manager.defaultSocket
    //var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
    //var socket: SocketIOClient = SocketIOClient(manager: mana, nsp: BASE_URL)
    
    func establishConnection() {
        let socket = manager.defaultSocket
        socket.connect()
    }
    
    func closeConnection() {
        let socket = manager.defaultSocket
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        let socket = manager.defaultSocket
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        let socket = manager.defaultSocket
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else { return }
            guard let channedDesc = dataArray[1] as? String else { return }
            guard let channelId = dataArray[2] as? String else { return }
            
            let newChannel = Channel(_id: channelId, name: channelName, description: channedDesc, __v: nil)
            
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
}
