import UIKit
import BVSDK

class ReviewDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var reviewsTableView : BVReviewsTableView!
    var reviews : [BVReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsTableView.delegate = self
        reviewsTableView.dataSource = self
        reviewsTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        // Load Reviews
        let reviewsRequest = BVReviewsRequest(productId: "data-gen-moppq9ekthfzbc6qff3bqokie", limit: 10, offset: 20)
        reviewsRequest.load({ response in
            self.reviews = response.results
            self.reviewsTableView.reloadData()
        }) { error in
            print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
        cell.review = self.reviews[indexPath.row]
        return cell
    }
}
