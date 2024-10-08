import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData() {
        let url = "https://api.exemplo.com/dados"
        
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("Dados recebidos: \(json)")
            case .failure(let error):
                print("Erro: \(error)")
            }
        }
    }
}
