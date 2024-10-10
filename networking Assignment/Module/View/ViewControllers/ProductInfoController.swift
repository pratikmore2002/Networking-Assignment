//
//  ProductInfoController.swift
//  networking Assignment
//
//  Created by Neosoft on 01/10/24.
//

import UIKit

class ProductInfoController: UIViewController {

    @IBOutlet var myImageView: UIImageView!
    @IBOutlet var ProductNameLbl: UILabel!
    @IBOutlet var ProducerNameLbl: UILabel!
    
    var viewModel: ProductViewModel?
   
    @IBOutlet var CostLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProducerNameLbl.numberOfLines = 0
        ProducerNameLbl.lineBreakMode = .byWordWrapping
        
        guard let productInfo = viewModel?.selectedProduct else { return }
        
        if productInfo.productImages != nil{
            let url = URL(string: "\(productInfo.productImages)")
            myImageView.downloadImage(from: url!)
            myImageView.contentMode = .scaleToFill
        }
        else{
            myImageView.image = UIImage(named: "computer1")
        }
        ProductNameLbl.text = "Product Name :\(productInfo.name)"
        ProducerNameLbl.text = "Producer Name :\(productInfo.producer)"
        CostLbl.text = "Product Cost :₹\(String(productInfo.cost))"
    }
    

   

}
