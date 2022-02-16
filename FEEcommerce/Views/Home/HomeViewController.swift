//
//  HomeViewController.swift
//  FEEcommerce
//
//  Created by Toi Nguyen on 15/02/2022.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let arr:[String] = ["https://www.ginx.tv/uploads2/Sifu/sifu_age_cover.webp",
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg",
                        "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/02/sifu-difficulty-options.jpg",
                        "https://khohieu.com/wp-content/uploads/2022/02/download-SiFu-crack.jpg",
                        "https://images.gnwcdn.com/2022/articles/2022-02-14-11-03/-1644836579051.jpg/EG11/thumbnail/732x412/format/jpg/quality/50",
    ]
    
    let arrItem:[Item] = [
        Item(name: "Đồ ngủ cho bé nam", price: 195.000, brand: "Noxus"),
        Item(name: "Đồ ngủ cho bé nữ", price: 295.000, brand: "Noxus"),
        Item(name: "Áo len giữ nhiệt bodyfit", price: 495.000, brand: "HUNGSSS"),
        Item(name: "Hộp cơm giữ nhiệt TOSHIBA", price: 395.000, brand: "TOSHIBA"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Ecommerce"
        label.textColor = .systemPink
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        let btnSearch = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self,action: #selector(printSmt))
        btnSearch.tintColor = .systemPink
        let groupBtn:[UIBarButtonItem] = [btnSearch]
        navigationItem.rightBarButtonItems = groupBtn
        registerCollectionCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            return self?.createSectionLayout(section: sectionIndex)
        }
        
        
    }
    @objc func printSmt(){
        print("Hưng đẹp trai")
    }
    
    func registerCollectionCell(){
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCollectionViewCell")
        collectionView.register(UINib(nibName: "ItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "itemCollectionViewCell")
    }
    
    static func createItem(fractionalWidth:CGFloat,fractionalHeight:CGFloat) -> NSCollectionLayoutItem{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .fractionalHeight(fractionalHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        return item
    }
    
    static func createGroupHorizontal(fractionalWidth:CGFloat,absHeight:CGFloat,subitem:NSCollectionLayoutItem,count:Int) -> NSCollectionLayoutGroup{
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .absolute(absHeight))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: subitem, count:count )
        return group
    }
    
    static func createGroupVertical(fractionalWidth:CGFloat,absHeight:CGFloat,subitem:NSCollectionLayoutItem,count:Int) -> NSCollectionLayoutGroup{
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fractionalWidth), heightDimension: .absolute(absHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: subitem, count:count )
        return group
    }
    
    func createSectionLayout(section:Int) -> NSCollectionLayoutSection{
        switch section {
        case 0:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
            let groupHorizontal = HomeViewController.createGroupHorizontal(
                fractionalWidth: 0.9,
                absHeight: 140,
                subitem: item,
                count: 1)
            let section = NSCollectionLayoutSection(group: groupHorizontal)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 1:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            let groupHorizontal = HomeViewController.createGroupHorizontal(
                fractionalWidth: 0.5,
                absHeight: 170,
                subitem: item,
                count: 1)
            let section = NSCollectionLayoutSection(group: groupHorizontal)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        default:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let groupVertical = HomeViewController.createGroupVertical(
                fractionalWidth: 1,
                absHeight: 250,
                subitem: item,
                count: 1)
            let section = NSCollectionLayoutSection(group: groupVertical)
            return section
        }
    }
}

extension HomeViewController:UICollectionViewDelegate{
    
}

extension HomeViewController:UICollectionViewDelegateFlowLayout{

    
}

extension HomeViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return arr.count
        }
        else if(section == 1){
            return arrItem.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.section == 1){
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(url: arr[indexPath.row])
        return cell
    }
}
