//
//  ProductTableViewCell.swift
//  networking Assignment
//
//  Created by Neosoft on 27/09/24.
//
import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet var productImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var producerLabel: UILabel!
    @IBOutlet var costLabel: UILabel!
    
    
         
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        nameLabel.text = nil
        producerLabel.text = nil
        costLabel.text = nil
    }
    
    func bindData(product: Product) {
        nameLabel.text = product.name
        producerLabel.text = "Producer: \(product.producer)"
        costLabel.text = "₹\(product.cost)"
        if let imageUrl = URL(string: product.productImages) {
            productImageView.downloadImage(from: imageUrl)
        }
    }
}
