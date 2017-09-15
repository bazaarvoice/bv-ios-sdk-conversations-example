import UIKit
import BVSDK

class ReviewSubmitViewController: UIViewController {
    
    
    @IBOutlet weak var submissionResponseTextView: UITextView!
    private var productId : String?
    
    init(productId: String){
        self.productId = productId
        super.init(nibName: "ReviewSubmitView", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.submitReviewForProductId(productId: self.productId!)
    }
    
    func submitReviewForProductId(productId: String){
        
        let reviewSubmission = BVReviewSubmission(reviewTitle: "Review Title",
                                                  reviewText: "The review text goes here. There is typically a 50 char minimum, but may vary depending on your configuration. Some configs allow for ratings only reviews too.",
                                                  rating: 5,
                                                  productId: productId)
        
        // a working example of posting a review.
        reviewSubmission.action = BVSubmissionAction.preview // Don't actually post, just run in preview mode!
        
        // We need to use the same userId for both the photo post and review content
        let userId = "123abc\(arc4random())"
        
        reviewSubmission.userNickname = userId
        reviewSubmission.userEmail = "foo@bar.com"
        reviewSubmission.userId = userId
        reviewSubmission.isRecommended = true
        reviewSubmission.sendEmailAlertWhenPublished = true
        
        if let photo = UIImage(named: "puppy"){
            reviewSubmission.addPhoto(photo, withPhotoCaption: "5 star pup!")
        }
        
        // add youtube video link, if your configuration supports it
        reviewSubmission.addVideoURL("https://www.youtube.com/watch?v=oHg5SJYRHA0", withCaption: "All your wildest dreams will come true.")
        
        reviewSubmission.submit({ (response) in
            
            self.showAlertSuccess(message: "Success Submitting Review!")
            
            let submissionId = response.submissionId ?? "No submission ID found. If run in preview mode you will not get a sumbission id."
            
            self.submissionResponseTextView.text = "Success with submission ID: " + submissionId
            
        }) { (error) in
            
            self.showAlertError(message: error[0].localizedDescription)
            self.submissionResponseTextView.text = error.description
        }
        
        
        
    }
    
    func showAlertSuccess(message : String){
        
        let alert = UIAlertController(title: "Success!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertError(message : String){
        
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
}
