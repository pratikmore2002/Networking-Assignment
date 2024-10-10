import UIKit

class ProductViewController: UIViewController {
    
    
    @IBOutlet var myTableView: UITableView!
    let viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Products"
        tableViesSetup()
        fetchData()
    }
    
    func fetchData() {
        viewModel.fetchProductData {
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }

    func tableViesSetup(){
        myTableView.delegate = self
        myTableView.dataSource = self
        let nib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        myTableView.register(nib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
}

extension ProductViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        let product = viewModel.products[indexPath.row]
        cell.bindData(product: product)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProductInfoController") as? ProductInfoController
        viewModel.selectProduct(index: indexPath.row)
        vc?.viewModel = self.viewModel
        navigationController?.pushViewController(vc!, animated: true)
    }
}



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

//HERE I NEED TO INSTALL KINGFISHER POD first.

//extension UIImageView {
//    func downloadImage(from url: URL, placeholder: UIImage? = nil) {
//        contentMode = .scaleToFill
//
//        // Kingfisher setImage method with placeholder and completion handling
//        self.kf.setImage(
//            with: url,
//            placeholder: placeholder,
//            options: [
//                .transition(.fade(0.3)), // Smooth fade transition
//                .cacheOriginalImage      // Cache the original image
//            ],
//            completionHandler:  { result in
//                switch result {
//                case .success(let value):
//                    print("Image successfully downloaded: \(value.image)")
//                case .failure(let error):
//                    print("Error downloading image: \(error.localizedDescription)")
//                }
//            }
//        )
//    }
//}
//
