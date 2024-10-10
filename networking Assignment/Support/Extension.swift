//
//  Extension.swift
//  networking Assignment
//
//  Created by Neosoft on 09/10/24.
//

import Foundation
import UIKit
extension UIImageView {
    func downloadImage(from url: URL) {
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        dataTask.resume()
    }
}
