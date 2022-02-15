//
//  ImageCollectionViewCell.swift
//  FEEcommerce
//
//  Created by Toi Nguyen on 15/02/2022.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(url:String){
        let imgUrl = URL(string: url)
        imageView.contentMode = .scaleAspectFill
        imageView.sd_setImage(with: imgUrl, completed: nil)
    }

}
