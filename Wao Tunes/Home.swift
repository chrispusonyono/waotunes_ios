//
//  Home.swift
//  Wao Tunes
//
//  Created by chrispus nyaberi on 12/08/2020.
//  Copyright © 2020 Nick Kilesi. All rights reserved.
//

import UIKit

class Home: UIViewController {
    @IBOutlet weak var categoryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCollection.reloadData()
        initialize()
    }
    private func initialize(){
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension Home:UICollectionViewDelegate,UICollectionViewDataSource{
  
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constant.DATA.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //Constant.DATA.clickedAdProduct = displayAds[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollection.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as? UnitCategory
        cell?.categoryName.text = Constant.DATA.categories[indexPath.row].description
        return cell!
    }
}
