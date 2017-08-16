import UIKit
import BVSDK

class ReviewCollectionViewCell: BVReviewCollectionViewCell {
    @IBOutlet weak var reviewTitle : UILabel!
    @IBOutlet weak var reviewText : UILabel!
    
    override var review: BVReview! {
        didSet {
            reviewTitle.text = review.title
            reviewText.text = review.reviewText
        }
    }
}
