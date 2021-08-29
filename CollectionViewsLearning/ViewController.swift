//
//  ViewController.swift
//  CollectionViewsLearning
//
//  Created by Thiago de Oliveira Sousa on 28/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionView.collectionViewLayout = layout2()
    }
    
    func layout2() -> UICollectionViewCompositionalLayout {
        
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment -> NSCollectionLayoutSection? in
            
            
            // Definindo o tamanho dos itens na section 0
            if sectionIndex == 0 {
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Definindo tamanho do grupo
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1), // 0.2
                    heightDimension: .absolute(40)//40
                )
                
                // Define quantas colunas terá no modo horizontal e vertical <<<<<
                let columns = environment.container.contentSize.width > 500 ? 2 : 1
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: columns)
                
                group.interItemSpacing = .fixed(20)
                
                if columns > 1 {
                    group.contentInsets.leading = 20
                    group.contentInsets.trailing = 20
                }
                
                let section = NSCollectionLayoutSection(group: group)
                
                section.interGroupSpacing = 20
                section.contentInsets.top = 20
                
                return section
            }
            
            
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(0.2)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.2),
                heightDimension: .absolute(200)
            )
            
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            group.interItemSpacing = .flexible(10)
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.interGroupSpacing = 50
            
            section.orthogonalScrollingBehavior = .continuous
            
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 50
        layout.configuration = config
        return layout
    }
    
    
    // mais basico
    func layout() -> UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.2),
            heightDimension: .fractionalHeight(1.0)
        )
        
        // Criando um item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(50)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Criando um grupo
        group.interItemSpacing = .flexible(20)
        
        // Criando uma section
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 50
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 200
        layout.configuration = config
        
        return layout
    }
    

}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.backgroundColor = UIColor.systemPink
        cell.label.text = String(indexPath.item)
        
        return cell
    }
    
    
    
    
}
