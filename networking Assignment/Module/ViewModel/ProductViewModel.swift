//
//  ProductViewModel.swift
//  networking Assignment
//
//  Created by Neosoft on 09/10/24.
//

import Foundation

class ProductViewModel {
    private let apiManager = ApiManager()
    var products: [Product] = []
    
    var selectedProduct: Product?
    
    func fetchProductData(onSuccess: @escaping () -> Void) {
        apiManager.fetchData { productData in
            self.products = productData?.data ?? []
            onSuccess()
            
        } onFailure: { error in
            print(error)
        }
    }
    
    func selectProduct(index: Int) {
        if products.count > index {
            self.selectedProduct = products[index]
        }
    }
}
