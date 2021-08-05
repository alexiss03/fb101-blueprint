    //
//  NYLandingViewController.swift
//  Nymeria
//
//  Created by Mary Alexis Solis on 05/06/2016.
//  Copyright © 2016 Boy Flores. All rights reserved.
//

import UIKit
import iCarousel

class NYLandingViewController: NYBaseViewController, iCarouselDelegate, iCarouselDataSource {
    
    var pageView: NYLandingView?
    var items: [String] = ["CarouselImage1", "CarouselImage2", "CarouselImage3"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.pageView  = NYLandingView.fromNib("NYLandingView")
        self.pageView?.delegate = self
        
        self.view = self.pageView
        self.navigationController?.isNavigationBarHidden = true
        
        self.pageView!.pageControl.numberOfPages = 3
        
        self.pageView!.carousel.delegate = self
        self.pageView!.carousel.dataSource = self
        self.pageView!.carousel.type = .linear
        self.pageView!.carousel.isPagingEnabled = true

        let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(NYLandingViewController.goToNextIndex), userInfo: nil, repeats: true)
        
    }
    
    
    func goToNextIndex() {
        self.pageView!.carousel.scrollToItem(at: (self.pageView!.carousel.currentItemIndex + 1)  % 3, animated: true)
    }
    
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat
    {
        switch (option)
        {
        case .wrap:
            return 1
            
        default:
            return value
        }
    }
    
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 3
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let itemView = UIImageView(frame: self.pageView!.carousel.frame)
        itemView.clipsToBounds = true
        itemView.contentMode = .scaleAspectFill
        var mView = UIView(frame: self.pageView!.carousel.frame)
        
        //reuse view if available, otherwise create a new view
        if let _ = view {
            mView = view!
            //get a reference to the label in the recycled view
            //label = itemView.viewWithTag(1) as! UILabel
        } else {
            //don't do anything specific to the index within
            //this `if ... else` statement because the view will be
            //recycled and used with other index values late
            
            
            itemView.image = UIImage(named:self.items[index])
            mView.addSubview(itemView)

            
        }
        
        return itemView
        
    }
    

    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        self.pageView?.pageControl.currentPage = carousel.currentItemIndex
    }
    
    fileprivate func imageViewForString(_ imageName: String) -> UIImageView {
        let imageView =  UIImageView.init(image: UIImage.init(named: imageName))
        return imageView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}


extension NYLandingViewController: NYLandingViewDelegate {
    
    func loginBtnPressed() {
        self.performSegue(withIdentifier: "TO_LOGIN", sender: self)
    }
    
    
    func signUpBtnPressed() {
        self.performSegue(withIdentifier: "TO_SIGN_UP", sender: self)
    }
    
}
