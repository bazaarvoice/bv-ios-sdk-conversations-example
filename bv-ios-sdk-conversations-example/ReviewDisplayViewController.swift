import UIKit
import BVSDK

class ReviewDisplayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var reviewsTableView : BVReviewsTableView!
    var reviews : [BVReview] = []
    
    private let reviewTableCellReuseId = "MyReviewTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewsTableView.dataSource = self
        self.title = "BVReviews"
        
        reviewsTableView.register(UINib(nibName: reviewTableCellReuseId, bundle: nil), forCellReuseIdentifier: reviewTableCellReuseId)
        reviewsTableView.estimatedRowHeight = 44
        reviewsTableView.rowHeight = UITableViewAutomaticDimension
        
        // Load Reviews
        let reviewsRequest = BVReviewsRequest(productId: Constants.TEST_PRODUCT_ID, limit: 20, offset: 0)
        reviewsRequest.addReviewSort(.submissionTime, order: .descending)
        reviewsRequest.addInclude(.comments)
        
        // --- Other Samples, uncomment to test them out ----
        // Here are some other things you can play with to get an idea of sorting and filtering reviews.
        
        // -- Just show reviews that have photos
        //reviewsRequest.addFilter(.hasPhotos, filterOperator: .equalTo, value: "true")
        
        // -- Sort reviews by most helpful
        //reviewsRequest.addReviewSort(.helpfulness, order: .descending)
        
        // -- Only show reviews with comments
        //reviewsRequest.addFilter(.hasComments, filterOperator: .equalTo, value: "true")
        
        // -- OR filter. Only show 1 and 5 star reviews
        // See also: https://developer.bazaarvoice.com/conversations-api/reference/v5.4/reviews/review-display#filter-options
        //reviewsRequest.addAdditionalField("Filter", value: "Rating:eq:1,5")
        
        reviewsRequest.load({ response in
            
            self.reviews = response.results
            self.reviewsTableView.reloadData()
        
        }) { error in
        
            print(error)
            
        }
    }
    
    // MARK: UITableViewDatasource
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Review Responses"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reviewTableCellReuseId) as! MyReviewTableViewCell
        cell.review = self.reviews[indexPath.row]
        return cell
    }
}
