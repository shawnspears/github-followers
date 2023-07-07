//
//  ViewController.swift
//  GithubFollowers
//
//  Created by Shawn Spears on 5/31/23.
//

import UIKit

class ViewController: UIViewController {
    
    enum Section: Int {
        case main
    }
    
    var collectionView: UICollectionView!
    var collectionDataSource: UICollectionViewDiffableDataSource<Section, GithubFollower>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }

    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createFlowLayout())
        collectionView.backgroundColor = .lightGray
        collectionView.register(CellView.self, forCellWithReuseIdentifier: CellView.reuseId)
        view.addSubview(collectionView)
    }
    
    func createFlowLayout() -> UICollectionViewFlowLayout {
        let padding: CGFloat = 12
        let minimumInteritemSpacing: CGFloat = 10
        let width = view.bounds.width
        let availableWidth = width - (padding * 2) - (minimumInteritemSpacing * 2)
        let itemWidth = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureDataSource() {
        collectionDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellView.reuseId, for: indexPath)
            return cell
        })
    }
    
    func loadDataSource() {
        // TODO
    }
}

