//
//  BusinessCell.swift
//  Yelp
//
//  Created by Rajeev Ram on 8/3/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessCell: UITableViewCell {

    // UI, UX Variables
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    // Logic/API Variables
    var business: Business! {
        didSet {
            nameLabel.text = business.name
            thumbImage.setImageWith(business.imageURL!)
            ratingImage.image = business.ratingImage
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            addressLabel.text = business.address
            cuisineLabel.text = business.categories
            distanceLabel.text = business.distance
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        thumbImage.layer.cornerRadius = 3
        thumbImage.clipsToBounds = true
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }
    
    override func layoutIfNeeded() {
        super.layoutSubviews()
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
