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
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg",
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg",
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg",
                        "https://gamek.mediacdn.vn/133514250583805952/2022/2/7/photo-1-1644210365491700116882.jpg"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Ecommerce"
        label.textColor = .systemPink
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
        let btnSearch = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.search, target: self,action: #selector(printSmt))
        btnSearch.tintColor = .systemPink
//        let btnAdd = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(printSmt))
           //If you want icon in right side
        let groupBtn:[UIBarButtonItem] = [btnSearch]
        navigationItem.rightBarButtonItems = groupBtn
        // Do any additional setup after loading the view.
        
        collectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "imageCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ -> NSCollectionLayoutSection? in
            return self?.createSectionLayout(section: sectionIndex)
        }
//        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
//                    return HomeViewController.createSectionLayout(section: sectionIndex)
//            }
        
        
    }
    @objc func printSmt(){
        print("Hưng đẹp trai")
    }
    
    func createSectionLayout(section:Int) -> NSCollectionLayoutSection{
        switch section {
        case 0:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        default:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
    }
//    private static func createSectionLayout(section: Int)->NSCollectionLayoutSection{
//            switch section{
//            case 0:
//                //Item
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0))
//                )
//
//                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//                //Hozirontal Group
//                let horizontalGroup = NSCollectionLayoutGroup.horizontal(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .fractionalWidth(0.9),
//                        heightDimension: .absolute(150)),
//                    subitem: item,
//                    count: 1)
//
//
//                //Section
//                let section = NSCollectionLayoutSection(group: horizontalGroup)
//                section.orthogonalScrollingBehavior = .groupPaging
//                return section
//            case 1:
//                //Item
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .absolute(200),
//                    heightDimension: .absolute(250))
//                )
//
//                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//                let verticalGroup = NSCollectionLayoutGroup.vertical(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .absolute(200),
//                        heightDimension: .absolute(500)),
//                    subitem: item,
//                    count: 2)
//
//                //Hozirontal Group
//                let horizontalGroup = NSCollectionLayoutGroup.horizontal(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .absolute(200),
//                        heightDimension: .absolute(500)),
//                    subitem: verticalGroup,
//                    count: 1)
//
//
//                //Section
//                let section = NSCollectionLayoutSection(group: horizontalGroup)
//                section.orthogonalScrollingBehavior = .continuous
//                return section
//            case 2:
//                //Item
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0))
//                )
//
//                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//                //Vertical Group
//                let group = NSCollectionLayoutGroup.vertical(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .fractionalWidth(1.0),
//                        heightDimension: .absolute(80)),
//                    subitem: item,
//                    count: 1)
//
//
//                //Section
//                let section = NSCollectionLayoutSection(group: group)
//    //            section.orthogonalScrollingBehavior = .groupPaging
//                return section
//            default:
//                //Item
//                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//                    widthDimension: .fractionalWidth(1.0),
//                    heightDimension: .fractionalHeight(1.0))
//                )
//
//                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//                //Vertical Group
//                let group = NSCollectionLayoutGroup.vertical(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .fractionalWidth(1.0),
//                        heightDimension: .absolute(390)),
//                    subitem: item,
//                    count: 1)
//
//                //Section
//                let section = NSCollectionLayoutSection(group: group)
//                return section
//            }
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



extension HomeViewController:UICollectionViewDelegate{
    
}

extension HomeViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}

extension HomeViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.configure(url: arr[indexPath.row])
        return cell
    }
}
