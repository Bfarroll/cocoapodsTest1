import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://kylegoslan.co.uk/json-examples/tweets.json")
            .response {  request, response, data, error in
                
                if let data = data {
                
                    let json = JSON(data: data)
                    print(json)
        
                }
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

