//
//  UITabBarViewController.swift
//  TestTabBarCustom
//
//  Created by Ali Ghanavati on 1/1/1399 AP.
//  Copyright © 1399 AP Ali Ghanavati. All rights reserved.
//

import UIKit


class UITabBarViewController: UITabBarController , UITabBarControllerDelegate {
    
    var mainButtonHeightWidth = 55
    var lineView: UIView!
    let mainButton = UIButton()
    let txtMainTitle = UILabel()
    
    @IBInspectable
    var firstItemTitle : String? = "First"
    @IBInspectable
    var firstImageItem : UIImage?

    @IBInspectable
    var secondItemTitle : String? = "Second"
    @IBInspectable
    var secondImageItem : UIImage?
    @IBInspectable
    var secondBackColor : UIColor? = UIColor.blue
    
    @IBInspectable
    var thirdItemTitle : String? = "Third"
    @IBInspectable
    var thirdImageItem : UIImage?
    
    @IBInspectable
    var lineColor : UIColor? = UIColor.blue
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTabbarItems()
    }
    
    override func viewDidLayoutSubviews() {
        adjustPosition()
    }
    
    fileprivate func initTabbarItems() {
        self.delegate = self
        if tabBar.items?.count ?? 0 > 1 {
            guard var viewControllers = self.viewControllers else {
                return
            }
            
            for view in viewControllers.enumerated() {
                if view.offset == 1 {
                    viewControllers.append(view.element)
                }
            }
            self.viewControllers = viewControllers
            
            let firstTab = tabBar.items?[0]
            firstTab?.tag = 0
            firstTab?.selectedImage = firstImageItem?.withRenderingMode(.alwaysOriginal)
            firstTab?.image = firstImageItem?.withRenderingMode(.alwaysOriginal)
            firstTab?.title = firstItemTitle
            
           let secondTab = tabBar.items?[1]
                      secondTab?.tag = 1
                      secondTab?.selectedImage = secondImageItem?.withRenderingMode(.alwaysOriginal)
                      secondTab?.image = secondImageItem?.withRenderingMode(.alwaysOriginal)
                      secondTab?.title = secondItemTitle
            
            let thirdTab = tabBar.items?[2]
            thirdTab?.tag = 2
            thirdTab?.selectedImage = thirdImageItem?.withRenderingMode(.alwaysOriginal)
            thirdTab?.image = thirdImageItem?.withRenderingMode(.alwaysOriginal)
            thirdTab?.title = thirdItemTitle
            
            
           mainButton.frame = CGRect(
               x: Int( self.view.frame.size.width / 2) - Int(mainButtonHeightWidth / 2 ),
               y:  Int(tabBar.frame.minY) - (mainButtonHeightWidth / 2) ,
               width: mainButtonHeightWidth,
               height: mainButtonHeightWidth)
           mainButton.backgroundColor = secondBackColor
           mainButton.layer.cornerRadius = CGFloat(mainButtonHeightWidth / 2)
           mainButton.setImage(secondImageItem, for: .normal)
           mainButton.imageEdgeInsets = UIEdgeInsets(top: 12 , left: 12, bottom: 12, right: 12)
           
           
           txtMainTitle.text = secondItemTitle
           txtMainTitle.frame = CGRect(
           x: Int( self.view.frame.size.width / 2) - Int(mainButtonHeightWidth),
           y:  Int(mainButton.frame.maxY) - 10 ,
           width: 100,
           height: mainButtonHeightWidth)
           txtMainTitle.textAlignment = .center
           txtMainTitle.textColor = UIColor.gray
           txtMainTitle.font = txtMainTitle.font.withSize(10)
            
           self.lineView = UIView()
           lineView.backgroundColor = lineColor
           lineView.frame = CGRect(x: 20 , y: CGFloat(tabBar.frame.minY) , width: CGFloat(tabBar.bounds.width / 3) - 40, height: 2)
            
           view.addSubview(lineView)
           self.view.addSubview(txtMainTitle)
           self.view.addSubview(mainButton)
        }
    }
    
    fileprivate func adjustPosition() {
        mainButton.frame.origin.y = CGFloat(tabBar.frame.minY) - CGFloat((mainButtonHeightWidth / 2))
        lineView.frame.origin.y = CGFloat(tabBar.frame.minY)
        txtMainTitle.frame.origin.y = CGFloat(mainButton.frame.maxY) - 20
        txtMainTitle.frame.origin.x = CGFloat( self.view.frame.size.width / 2) - CGFloat(50)
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
          if item.tag == 0{
              UIView.animate(withDuration: 0.5) {
                  self.lineView.transform = CGAffineTransform(translationX: 0, y: 0)
                  
              }
          } else if ( item.tag == 2 ){
              UIView.animate(withDuration: 0.5) {
                  self.lineView.transform = CGAffineTransform(translationX: ((tabBar.bounds.width / 3) * 2) , y: 0)
              }
          }
      }
    

}
