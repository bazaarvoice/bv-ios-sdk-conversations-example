//
//  MyReviewTableViewCell.swift
//  Conversations
//
//  Copyright © 2016 Bazaarvoice. All rights reserved.
//

import UIKit
import BVSDK

class MyReviewTableViewCell: BVReviewTableViewCell {
    @IBOutlet weak var reviewTitle : UILabel!
    @IBOutlet weak var reviewText : UILabel!

    // Here we set a BVReview object and just print out all the relevant info you may want to show in you own UI.
    // While the SDK provides controlers and views for UGC data, it's up to you to create the UI experience.
    override var review: BVReview? {
        didSet {
            
            var titleString = review?.title ?? ""
            
            // Get the author and date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
            let dateString = dateFormatter.string(from: (review?.submissionTime)!)
            
            var badgesString = "\nBadges: ["
            
            // let's see if this author has any badges
            // All the possible badge identifiers and images can be obtained in your Bazaarvoie configuration.
            // If you are unsure how to get the badges, get in touch with your BV client team.
            for badge : BVBadge in (review?.badges)! {
                
                badgesString += " \(badge.identifier!) "
                
            }
            
            badgesString += "]"
            
            // Display the author of the review. You can also link to the user's profile with a BVAuthor request.
            titleString = titleString.appending("\nBy \(review!.userNickname ?? "no author") on \(dateString)\(badgesString)")
            
            // rating from user
            titleString.append("\nRating: \(review!.rating)")
            
            // Add any context data values, if present. E.g. Age, Gender, other....
            for contextDataValue in (review?.contextDataValues)! {
                let value = contextDataValue.valueLabel ?? "Value Not defined"
                let label = contextDataValue.dimensionLabel ?? "Label Not defined"
                titleString.append("\n\(label): \(value)")
            }
            
            reviewTitle.text = titleString
            
            // Create a review body some example of data we can pull in.
            var reviewString = review?.reviewText
            
            reviewString?.append("\n")
            
            reviewString?.append("\nIs Recommended?  \(review!.isRecommended)")
            reviewString?.append("\nIs Syndicated?  \(review!.isSyndicated)")
            
            if (review!.isSyndicated && (review!.syndicationSource != nil)){
                reviewString?.append("\nSyndication Source: \(review!.syndicationSource!.name!)")
            }
            
            reviewString?.append("\nHelpful Count: \(review!.totalPositiveFeedbackCount!)")
            reviewString?.append("\nNot Helpful Count: \(review!.totalNegativeFeedbackCount!)")
            
            // See if there are context data values
            var secondaryRatingsText = "\nSecondary Ratings: ["
            
            // Check and see if this reviewer supplied any of the secondary ratings
            for rating : BVSecondaryRating in (review?.secondaryRatings)! {
                let value = rating.value as! NSInteger 
                let label = rating.label ?? "Label Not defined"
                secondaryRatingsText += " \(label)(\(value)) "
            }
            
            secondaryRatingsText += "]"
            
            reviewString?.append(secondaryRatingsText)
            
            // check for photos
            reviewString?.append("\nPhoto count: \(String(describing: review!.photos.count))")
            
            // check for video link (YouTube videos)
            reviewString?.append("\nVideo Links Count: \(review!.videos.count)")
            
            // check for comments
            let commentsText = "\nNum Comments: [\(review!.comments.count)]"
            
            reviewString?.append(commentsText)
            
            reviewText.text = reviewString
            
        }
    }
    
}
