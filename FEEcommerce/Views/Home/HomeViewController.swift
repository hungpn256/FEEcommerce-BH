//
//  HomeViewController.swift
//  FEEcommerce
//
//  Created by Toi Nguyen on 15/02/2022.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let arr:[String] = ["https://www.ginx.tv/uploads2/Sifu/sifu_age_cover.webp",
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg",
                        "https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/02/sifu-difficulty-options.jpg",
                        "https://khohieu.com/wp-content/uploads/2022/02/download-SiFu-crack.jpg",
                        "https://images.gnwcdn.com/2022/articles/2022-02-14-11-03/-1644836579051.jpg/EG11/thumbnail/732x412/format/jpg/quality/50",
    ]
    
    let arrItem:[Item] = [
        Item(name: "Clothes for child", price: 195.000, brand: "Noxus",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png"),
        Item(name: "Clothes for child", price: 295.000, brand: "Noxus",imageUrl: "https://www.designmantic.com/logo-images/166857.png?company=Company+Name&slogan=&verify=1"),
        Item(name: "Sweater body fit unisex", price: 495.000, brand: "HUNGSSS",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png"),
        Item(name: "Rice cooker", price: 395.000, brand: "TOSHIBA",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png"),
        Item(name: "Clothes for child", price: 195.000, brand: "Noxus",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png"),
        Item(name: "Clothes for child", price: 295.000, brand: "Noxus",imageUrl: "https://www.designmantic.com/logo-images/166857.png?company=Company+Name&slogan=&verify=1"),
        Item(name: "Sweater body fit unisex", price: 495.000, brand: "HUNGSSS",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png"),
        Item(name: "Rice cooker", price: 395.000, brand: "TOSHIBA",imageUrl: "https://i.pinimg.com/originals/91/c4/e7/91c4e7398cad49776acfeeb3b88f7ed8.png")
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
        collectionView.register(UINib(nibName: "HeaderSectionCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerSection")
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
    
    static func createHeader() -> [NSCollectionLayoutBoundarySupplementaryItem]{
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return [header]
    }
    
    
    func createSectionLayout(section:Int) -> NSCollectionLayoutSection{
        switch section {
        case 0:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10)
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
                fractionalWidth: 0.42,
                absHeight: 220,
                subitem: item,
                count: 1)
            let section = NSCollectionLayoutSection(group: groupHorizontal)
            let header = HomeViewController.createHeader()
            section.boundarySupplementaryItems = header
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 2:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
            let groupHorizontal = HomeViewController.createGroupHorizontal(
                fractionalWidth: 0.42,
                absHeight: 220,
                subitem: item,
                count: 1)
            let section = NSCollectionLayoutSection(group: groupHorizontal)
            let header = HomeViewController.createHeader()
            section.boundarySupplementaryItems = header
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 3:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
            item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15)
            let groupHorizontal = HomeViewController.createGroupHorizontal(
                fractionalWidth: 1,
                absHeight: 220,
                subitem: item,
                count: 2)
            let section = NSCollectionLayoutSection(group: groupHorizontal)
            let header = HomeViewController.createHeader()
            section.boundarySupplementaryItems = header
            return section
        default:
            let item = HomeViewController.createItem(fractionalWidth: 1.0, fractionalHeight: 1.0)
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

extension HomeViewController:UICollectionViewDelegate,HeaderSectionCollectionReusableViewDelegate{
    func navigate(sender: UICollectionReusableView, indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader{
            let reuseableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerSection", for: indexPath) as! HeaderSectionCollectionReusableView
            if indexPath.section == 1{
                reuseableView.configure(title: "Hot Deal")
            }
            else if indexPath.section == 2{
                reuseableView.configure(title: "Top Sale")
            }
            else if indexPath.section == 3{
                reuseableView.configure(title: "For you")
            }
            reuseableView.delegate = self
            reuseableView.indexPath = indexPath
            return reuseableView
        }
        return UICollectionReusableView()
    }
}

extension HomeViewController:UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 300.0, height: 150.0)
//    }
    
}

extension HomeViewController:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return arr.count
        }
        else if(section == 1){
            return arrItem.count
        }
        else{
            return arrItem.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.section == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            cell.configure(url: arr[indexPath.row])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCollectionViewCell", for: indexPath) as! ItemCollectionViewCell
            cell.configure(brand: arrItem[indexPath.row].brand, name: arrItem[indexPath.row].name, price:arrItem[indexPath.row].price,url: arrItem[indexPath.row].imageUrl)
            return cell
        }
    }
}
