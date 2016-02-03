import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    
    var names = [String]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://kylegoslan.co.uk/json-examples/tweets.json")
            .response {  request, response, data, error in
                
                if let data = data {
                let json = JSON(data: data)
                
                    for tweets in json.arrayValue {
                        self.names.append(tweets["username"].stringValue)
                     
                    }
                    
                    self.updatesView()
        
                }
        
        }
        
    }
    
    
    func updatesView() {
    print(names)
    tableView.reloadData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

extension ViewController: UITableViewDataSource {


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        let label = cell?.viewWithTag(1) as! UILabel
        
        let name = names[indexPath.row]
        
        label.text = "Name"
        
        return cell!
        
    }
    


}

