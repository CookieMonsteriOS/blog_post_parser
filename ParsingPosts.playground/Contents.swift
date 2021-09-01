import UIKit
import PlaygroundSupport

class ViewController: UIViewController{
  
    override func viewDidLoad() {
        getdata()
    }
    
    func getdata(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
        URLSession.shared.dataTask(with:url){(data, response, error) in
            do {
                let users = try JSONDecoder().decode([Users].self, from: data!) //Should use Guard Let!!
                for user in users{
                    print("ID:\(user.id), Title :\(user.title), Body:\(user.body)")
                }
            }catch{
                print("Error in finding data")
            }
            
        }.resume()
        
    }
    
}

//Call View Controller
let controller = ViewController()
PlaygroundPage.current.liveView = controller
controller.view
