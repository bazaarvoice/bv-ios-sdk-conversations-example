import UIKit
import BVSDK

class ReviewDisplayViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var reviewsCollectionView : BVReviewsCollectionView!
    var reviews : [BVReview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
        reviewsCollectionView.register(UINib(nibName: "ReviewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ReviewCollectionViewCell")
        // Load Reviews
        let reviewsRequest = BVReviewsRequest(productId: "data-gen-moppq9ekthfzbc6qff3bqokie", limit: 10, offset: 20)
        reviewsRequest.load({ response in
            self.reviews = response.results
            self.reviewsCollectionView.reloadData()
        }) { error in
            print(error)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewCollectionViewCell", for: indexPath) as! ReviewCollectionViewCell
        cell.review = reviews[indexPath.row]
        return cell
    }
}
