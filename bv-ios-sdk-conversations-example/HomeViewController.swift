import UIKit

class HomeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    class func createTitleLabel() -> UILabel {
        let titleLabel = UILabel(frame: CGRect(x: 0,y: 0,width: 200,height: 44))
        titleLabel.text = "bazaarvoice:";
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "ForalPro-Regular", size: 36)
        return titleLabel
    }
    
    @IBAction func tappedDisplayReviews(_ sender: Any) {
        let vc = ReviewDisplayViewController(nibName: "ReviewDisplayView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tappedSubmitReviews(_ sender: Any) {
        let vc = ReviewSubmitViewController(nibName: "ReviewSubmitView", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
