#  Create a basic connection to SocketIO server


import UIKit
import SocketIO


class ViewController: UIViewController {

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



