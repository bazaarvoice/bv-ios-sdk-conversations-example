# Conversations Example App

This simple demo app shows you the very basics for getting up and running with Conversations Reviews: Display and Submission. The app works out of the box simply by running the `bv-ios-sdk-conversations-example.xcworkspace` project in Xcode. However, if you want to display your own Conversations data, you will need your own API key and Client ID.

The demo project is written in Swift 3 on Xcode 8.3. However, know that the BVSDK is written in Objective-C so you can use the SDK with Swift 2.3+ and Objective-C code-bases.

The purpose of the demo is you make sure your full integration is working with Conversations Review types. Once you have the display and submission working for Review types, adding in other User Generated Content (Questions, Answers, Comments) is pretty much the same, just using different display and submission request objects.

## Requirements

* Conversations API Keys for your iOS application: one for production, one for staging environments.
* Xcode 8+
* A valid product ID in your product catalog.
* Follow the [Installation Instructions](https://bazaarvoice.github.io/bv-ios-sdk/installation.html#configure-bvsdk)
to generate your `bvsdk_config_staging.json` and `bvsdk_config_prod.json` files and add (or update) them to the 
`bv-ios-sdk-conversations-example.xcworkspace` project.

## Optional Requirements

* Login to the [Production](https://workbench.bazaarvoice.com/) and [Staging](https://workbench-staging.bazaarvoice.com) environments to the Bazaarvoice Portal (aka Workbench). This will help you find product IDs and test content submission.
* Cocoapods. This demo checs in the `/Pod` folder with the BVSDK installed. You can run `pod update` at the repo root to make sure you have the latest BVSDK.

## Tweaking the App

Once you have opended the demo app, here are the things you need to configure:

1. `AppDelegate.swift`: Make sure you have set the environment to production or stagin in `BVSDKManager.configure(<.staging | .prod>)`
2. Make sure the `bvsdk_config_staging.json` and `bvsdk_config_prod.json` are ready (depending on the environment in step 1.)
3. `Constants.swift`: Set the `TEST_PRODUCT_ID` to a product ID in your catalog. This will be used for both display and submission of reviews.
4. Launch the demo app!

When you launch the demo app you will see 2 buttons: *Display Reviews* and *Submit Review*.

<image src="./art/home.png" width="300" align="middle">

## Display Reviews

In `ReviewsDisplayViewController.swift` a Conversations Review display request is being made to display reviews. A single review is contained in a `BVReview` object. See `MyReviewTableViewCell.swift` for demo code on how to access the various attributes of a review object.

The demo simply prints out all the available types in a `BVReviewsTableViewCell`.

<image src="./art/display_reviews.png" width="300" align="middle">

## Submit Review

We recommend testing your integration against the staging environment in `.submit` action mode (rather than `.preview`) so that you can ensure your reviews are visible in the workbench.

In `ReviewSubmitViewController.swift` a call is being made to submit a review.

You may see some form errors if your request does not include all of the fields required per your configuration.

<image src="./art/some_form_errors.png" width="300" align="middle">

Once you go back and edit the `BVReviewSubmission` with the required parameters, you should now be able to submit successfully.

<image src="./art/submit_success.png" width="300" align="middle">

## Common Errors

* Submitting with `BVSubmissionAction.Preview` instead of `BVSubmissionAction.Submit`

You can think of `BVSubmissionAction.Submit` as a dry-run; the submission action will make a network call and validate the parameters, but the review itself will not be saved. 


## Futher Reading

* [Github repo](https://github.com/bazaarvoice/bv-ios-sdk)
* [Docs](https://bazaarvoice.github.io/bv-ios-sdk/index.html)
* [Generate config files](https://bazaarvoice.github.io/bv-ios-sdk/installation.html#configure-bvsdk)
* [More comprehensive demos](https://bazaarvoice.github.io/bv-ios-sdk/example_projects.html)
