#  Create a basic connection to SocketIO server

This code will not work unless you allow for Aribtrary Loads in your Info.plist. Using Arbitrary loads is not the best way for using in production, use the other AppTransportSecurity settings to allow for specific domain usage. 

```import UIKit
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
```


