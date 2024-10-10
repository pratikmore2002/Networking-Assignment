import Foundation

struct ProductData: Codable {
    let status: Int
    let data: [Product]
}

struct Product: Codable {
    let id: Int
    let productCategoryID: Int
    let name: String
    let producer: String
    let description: String
    let cost: Double
    let rating: Int
    let viewCount: Int
    let created: String
    let modified: String
    let productImages: String

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
}
