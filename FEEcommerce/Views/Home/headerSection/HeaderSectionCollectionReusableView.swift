//
//  HeaderSectionCollectionReusableView.swift
//  FEEcommerce
//
//  Created by Toi Nguyen on 16/02/2022.
//

import UIKit

protocol HeaderSectionCollectionReusableViewDelegate{
    func navigate(sender: UICollectionReusableView,indexPath:IndexPath)
}

class HeaderSectionCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var sectionTitle: UILabel!
    var delegate:HeaderSectionCollectionReusableViewDelegate?
    @IBOutlet weak var viewAllBtn: UIButton!
    var indexPath:IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
//    init(indexPath:IndexPath) {
//        super.init()
//        self.indexPath = indexPath
//    }
    
    func configure(title:String){
        sectionTitle.text = title
        viewAllBtn.addTarget(self, action: #selector(press), for: .touchUpInside)
    }
    
    @objc func press(sender: UICollectionReusableView){
        delegate?.navigate(sender:self,indexPath: self.indexPath ?? IndexPath(row: 0, section: 0))
    }
    
}
