import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var main_LBL_name: UILabel!
    
    var savedLongitude: Double = 34.7818
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main_LBL_name.text = "Hi"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "goToNextScreen" {
            
            // 2. Gain access to the second screen
            
            
            func btnNameChange(_ sender: Any) {
                let alertController = UIAlertController(
                    title: "Enter Name", message: "Please type your name below.", preferredStyle: .alert)
                
                alertController.addTextField { (textField) in
                    textField.placeholder = "Your Name"
                }
                
                let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self] _ in
                    
                    if let textField = alertController.textFields?.first,
                       let enteredText = textField.text,
                       !enteredText.isEmpty {
                        
                        self?.main_LBL_name.text = "Hi " + enteredText
                    }
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alertController.addAction(submitAction)
                alertController.addAction(cancelAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
}
