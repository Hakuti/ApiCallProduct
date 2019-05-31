//
//  ViewController.swift
//  ApiCallProduct
//
//  Created by Jean Canales on 5/29/19.
//  Copyright © 2019 Jean Canales. All rights reserved.
//

import UIKit
import SocketIO




class ViewController: UIViewController {
    
    @IBAction func btnClick(btn: UIButton){
        self.socket.emit("test", 10);
    }
    //Intialize the SocketManager with URL and config with .log true. compress properties.
    let manager = SocketManager(socketURL: URL(string: "http://localhost:5000")!, config: [.log(true), .compress])
    var socket:SocketIOClient!
    
    var name: String?
    var resetAck: SocketAckEmitter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        socket = manager.defaultSocket
        
        socket.on("news"){ data, ack in
            guard let dataReceived = data as Any? else { return }
            
            print(dataReceived);
            
        }
        
        
    
        
        socket.connect();
        // Do any additional setup after loading the view, typically from a nib.
        print("Here");
    }
    
    

}

