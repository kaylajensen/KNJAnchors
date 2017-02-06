//
//  ViewController.swift
//  KNJAnchors
//
//  Created by Kayla Jensen on 2/6/17.
//  Copyright © 2017 Kayla Jensen. All rights reserved.
//

import UIKit

public var GREEN_COLOR = UIColor.init(netHex: 0x445217)

class ViewController: UIViewController {

    var backgroundImageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wood")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var wreathImageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "wreath")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    var knjLabel : UILabel = {
        let label = UILabel()
        label.text = "KNJ"
        label.font = UIFont.init(name: "Copperplate", size: 30)
        label.textColor = GREEN_COLOR
        label.textAlignment = .center
        return label
    }()
    
    var anchorsLabel : UILabel = {
        let label = UILabel()
        label.text = "ANCHORS"
        label.font = UIFont.init(name: "Copperplate", size: 55)
        label.textColor = GREEN_COLOR
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup background view
        view.backgroundColor = UIColor.white
        view.addSubview(backgroundImageView)
        backgroundImageView.anchorToEntireSuperview()
        
        setupTitleView()
        
        setupStackView()
    }
    
    func setupTitleView() {
        // setup wreath and title view
        view.addSubview(wreathImageView)
        wreathImageView.anchorCenterSuperview(widthOf: nil, widthConstant: 331, heightOf: nil, heightConstant: 331)
        
        let titleContainer = UIView()
        titleContainer.backgroundColor = UIColor.clear
        
        view.addSubview(titleContainer)
        titleContainer.anchorCenterXToTopOrBottomOf(centerXOf: view.centerXAnchor, topOf: view.topAnchor, bottomOf: nil, widthOf: view.widthAnchor, heightOf: nil, topConstant: 65, centerXConstant: 0, bottomConstant: 0, widthConstant: 0, heightConstant: 80)
        
        titleContainer.addSubview(knjLabel)
        knjLabel.anchorCenterXToTopOrBottomOf(centerXOf: titleContainer.centerXAnchor, topOf: titleContainer.topAnchor, bottomOf: nil, widthOf: titleContainer.widthAnchor, heightOf: nil, topConstant: 0, centerXConstant: 0, bottomConstant: 0, widthConstant: 0, heightConstant: 30)
        
        titleContainer.addSubview(anchorsLabel)
        anchorsLabel.anchorCenterXToTopOrBottomOf(centerXOf: titleContainer.centerXAnchor, topOf: knjLabel.bottomAnchor, bottomOf: nil, widthOf: titleContainer.widthAnchor, heightOf: nil, topConstant: -8, centerXConstant: 0, bottomConstant: 0, widthConstant: 0, heightConstant: 55)
    }
    
    func setupStackView() {
        // "no" container
        let noContainer = UIView()
        noContainer.backgroundColor = UIColor.init(netHex: 0xEAF0D5).withAlphaComponent(0.5)
        let noLeaf = UIImageView(image: UIImage(named: "leaf"))
        noLeaf.contentMode = .scaleAspectFit
        noContainer.addSubview(noLeaf)
        noLeaf.anchorCenterSuperview()
        
        let noButton = UIButton()
        noButton.setTitle("NO", for: .normal)
        noButton.titleLabel?.font = UIFont(name: "Copperplate", size: 14)
        noButton.setTitleColor(UIColor.white, for: .normal)
        noContainer.addSubview(noButton)
        noButton.anchorCenterSuperview()
        
        // "more" container
        let moreContainer = UIView()
        moreContainer.backgroundColor = UIColor.init(netHex: 0xCCE383).withAlphaComponent(0.5)
        let moreLeaf = UIImageView(image: UIImage(named: "leaf"))
        moreLeaf.contentMode = .scaleAspectFit
        moreContainer.addSubview(moreLeaf)
        moreLeaf.anchorCenterSuperview()
        
        let moreButton = UIButton()
        moreButton.setTitle("MORE", for: .normal)
        moreButton.titleLabel?.font = UIFont(name: "Copperplate", size: 14)
        moreButton.setTitleColor(UIColor.white, for: .normal)
        moreContainer.addSubview(moreButton)
        moreButton.anchorCenterSuperview()
        
        // "storyboards" container
        let storyboardContainer = UIView()
        storyboardContainer.backgroundColor = UIColor.init(netHex: 0x839F2A).withAlphaComponent(0.5)
        let storyboardLeaf = UIImageView(image: UIImage(named: "leaf"))
        storyboardLeaf.contentMode = .scaleAspectFit
        storyboardContainer.addSubview(storyboardLeaf)
        storyboardLeaf.anchorCenterSuperview()
        
        let storyboardButton = UIButton()
        storyboardButton.setTitle("STORYBOARDS", for: .normal)
        storyboardButton.titleLabel?.font = UIFont(name: "Copperplate", size: 14)
        storyboardButton.setTitleColor(UIColor.white, for: .normal)
        storyboardContainer.addSubview(storyboardButton)
        storyboardButton.anchorCenterSuperview()
        
        // make stack view with 3 leaf buttons
        let stackButtonView = UIStackView(arrangedSubviews: [noContainer,moreContainer,storyboardContainer])
        stackButtonView.axis = .horizontal
        stackButtonView.distribution = .fillEqually
        
        view.addSubview(stackButtonView)
        stackButtonView.anchorCenterXToTopOrBottomOf(centerXOf: view.centerXAnchor, topOf: nil, bottomOf: view.bottomAnchor, widthOf: view.widthAnchor, heightOf: nil, topConstant: 0, centerXConstant: 0, bottomConstant: 0, widthConstant: 0, heightConstant: 150)
        
        let banner = UIView()
        banner.backgroundColor = GREEN_COLOR
        stackButtonView.addSubview(banner)
        banner.anchorCenterXToTopOrBottomOf(centerXOf: stackButtonView.centerXAnchor, topOf: stackButtonView.topAnchor, bottomOf: nil, widthOf: stackButtonView.widthAnchor, heightOf: nil, topConstant: 0, centerXConstant: 0, bottomConstant: 0, widthConstant: 0, heightConstant: 10)
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
