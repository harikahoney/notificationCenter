

import UIKit
import Toast_Swift
class ViewController: UIViewController
{
    
    
    @IBOutlet weak var label: UILabel!
    
    
    var details = String()
    
    var allContactDetails = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(eventHandler), name: NSNotification.Name("dataTransfer"), object: nil)
        
        
    }
    
    //add button event handler
    @IBAction func addButtonEH(_ sender: UIButton)
    {
        
        let target = self.storyboard?.instantiateViewController(withIdentifier: "secondVC")
        
        
        self.present(target!, animated: true, completion: nil)
        
    }
    
    @objc func eventHandler(value:Notification)
    {
        
       
        
        
        
  
            details =  details + (value.userInfo!["name"]! as! String) + "\n" + (value.userInfo!["mobileNo"]! as! String) + "\n\n"

            
            
       

        label.text = details
       
    }
    


}

