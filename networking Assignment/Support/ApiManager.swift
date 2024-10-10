//
//  ApiManager.swift
//  networking Assignment
//
//  Created by Neosoft on 09/10/24.
//

import Foundation

class ApiManager {
    
    func fetchData(onSuccess: @escaping (ProductData?) -> Void,
                   onFailure: @escaping (Error?) -> Void) {
        let url = URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")
        
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        let session = URLSession(configuration: config)
        
        
        let task = session.dataTask(with: url!) { (data, response, error) in
       
            guard let data = data, error == nil else {
                print("Error occurred while accessing data: \(error?.localizedDescription ?? "Unknown error")")
                onFailure(error)
                return
            }
            
            
            if let httpResponse = response as? HTTPURLResponse {
                print("HTTP Status Code: \(httpResponse.statusCode)")
            }
            
            
            var productObject: ProductData?
            do {
                productObject = try JSONDecoder().decode(ProductData.self, from: data)
                print("Decoded Product Data:\(productObject)")
                onSuccess(productObject)
            } catch let error {
                print("Error while decoding data into Swift structure: \(error.localizedDescription)")
                onFailure(error)
            }
        }
        task.resume()
    }
}
