
import Foundation

class WebService{
    
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data {
                
                do{
                    let dataChecked = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                    completion(dataChecked)
                }
            }
        }.resume()
    }
}
