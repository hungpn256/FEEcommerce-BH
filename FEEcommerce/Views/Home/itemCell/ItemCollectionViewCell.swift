//
//  ItemCollectionViewCell.swift
//  FEEcommerce
//
//  Created by Toi Nguyen on 15/02/2022.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var brandLable: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(brand:String,name:String,price:Double,url:String){
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        brandLable.text = brand
        nameLabel.text = name
        priceLabel.text = formatter.string(from: NSNumber(value:price))
        itemImage.contentMode = .scaleAspectFill
        itemImage.sd_setImage(with: URL(string: url), completed: nil)
    }

}
