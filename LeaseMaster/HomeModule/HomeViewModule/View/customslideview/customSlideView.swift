//
//  customSlideView.swift
//  LeaseMaster
//
//  Created by Isaac Annan on 06/11/2019.
//  Copyright © 2019 Qodehub. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

open class customSlideView: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet var contentView: UIView!
    
    
    
    @IBOutlet weak var slideCollectionView: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    
    var currentIndex = 0
    
    var imgArray = [UIImage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        combinedInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        combinedInit()
    }
    
    func combinedInit(){
        
        Bundle.main.loadNibNamed("customSlideView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        self.slideCollectionView.delegate = self
        self.slideCollectionView.dataSource = self
        self.slideCollectionView.register(UINib.init(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: "sliderCell")
        
        //setPageView(number: 3)

    }
    
    public func setPageView(number: Int)  {
        pageView.numberOfPages = number
    }
    
//    public func addImages(imageArray: [String]){
//        for i in 0 ..< imageArray.count {
//                    
//            Alamofire.request(imageArray[i]).responseImage { response in
//                if let image = response.result.value {
//                    self.imgArray.append(image)
//                }
//                print("***********this is the array containing the real images***************")
//                print(self.imgArray)
//        }
//    }
//}
    
  
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCell
        
        
        cell.slideImage.image = imgArray[indexPath.item]
        cell.slideImage.bounds = super.bounds
        
        
      
        return cell
    }
    
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / slideCollectionView.frame.size.width)
        pageView.currentPage = currentIndex
    }

}


extension customSlideView: UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

