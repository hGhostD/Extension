//
//  HYHomeSegmentView.swift
//  HiLuck
//
//  Created by hu on 2018/1/23.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

class HYHomeSegmentView: UIView {

    let titles: [String]
    let titlesCustomeColrt: UIColor
    let titlesHeightLightColor: UIColor
    let backgroundHeightLightColor: UIColor
    let titleFont: UIFont
    let duration: Double
    
    private let viewWidth: CGFloat          = 80            // 组件的宽度
    private let viewHeight: CGFloat         = 30            // 组件的高度
    private let labelWidth: CGFloat         = 80            // Label 的宽度
    private let heightLightView             = UIView()
    private let heightTopView               = UIView()
    private let heightColorView             = UIView()
    
    private var labelArray = [UILabel]()
    
    private var currentTapButton: UIButton?
    
    var buttonSelect: (Int) -> Void = { (index: Int) in }
    

    init(frame: CGRect,
         titles: [String] = ["明星", "好友", "团队"],
         titlesCustomeColrt: UIColor = K_Black95,
         titlesHeightLightColor: UIColor = K_BlueColor,
         backgroundHeightLightColor: UIColor = .white ,
         titleFont: UIFont = HY_Font(15),
         duration: Double = 0.3)
    {
        self.titles = titles
        self.titlesCustomeColrt = titlesCustomeColrt
        self.titlesHeightLightColor = titlesHeightLightColor
        self.backgroundHeightLightColor = backgroundHeightLightColor
        self.titleFont = titleFont
        self.duration = duration
        super.init(frame: frame)
        self.clipsToBounds = false
        
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func layoutSubviews() {
        removeAllSubView()
        
        createBottomLabels()
        createTopLabels()
        createTopButtons()
        
        layoutIfNeeded()
    
        if let button = currentTapButton { tapButton(sender: button) }
    }
    
    func removeAllSubView() {
        removeSubView(subView: heightLightView)
        removeSubView(subView: heightTopView)
        removeSubView(subView: heightColorView)
        labelArray.removeAll()
        
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    func removeSubView(subView: UIView) {
        subView.removeFromSuperview()
    }
    /// 计算当前高亮的 Fame
    func countCurrentRectWithIndex(index: Int) -> CGRect {
        return CGRect(x: labelWidth * CGFloat(index), y: 0, width: labelWidth, height: viewHeight)
    }
    /// 根据索引创建 Label
    func createLabelWithTitlesIndex(index: Int, textColor: UIColor) -> UILabel {
        let currentLabelFrame = countCurrentRectWithIndex(index: index)
        let tempLabel = UILabel(frame: currentLabelFrame)
        tempLabel.textColor = textColor
        tempLabel.text = titles[index]
        tempLabel.font = titleFont
        tempLabel.minimumScaleFactor = 0.1
        tempLabel.textAlignment = .center
        return tempLabel
    }
    /// 处理底层 Label
    func dealBottomLabelWithIndex(index: Int, textColor: UIColor) -> UILabel {
        let tempLabel = createLabelWithTitlesIndex(index: index, textColor: textColor)
        tempLabel.backgroundColor = K_BlackF5
        let shadow: CGFloat = 2
        var x = tempLabel.frame.origin.x
        var width = tempLabel.width
        if index == 0 {
            x += shadow
            width -= shadow
        }else if index == titles.count - 1 {
            width -= shadow
        }
        let newFrame = CGRect(x: x, y: tempLabel.frame.origin.y + shadow, width: tempLabel.width, height: tempLabel.height - 2 * shadow)
        tempLabel.frame = newFrame
    
        return tempLabel
    }
    /// 创建最底层的 Label
    func createBottomLabels() {
        for index in 0..<titles.count {
            let tempLabel = dealBottomLabelWithIndex(index: index, textColor: titlesCustomeColrt)
            self.addSubview(tempLabel)
            labelArray.append(tempLabel)
        }
    }
    /// 创建上一层高亮使用的 Label
    func createTopLabels() {
        let heightLightViewFrame = CGRect(x: 0, y: 0, width: labelWidth, height: viewHeight)
        heightLightView.frame = heightLightViewFrame
        heightLightView.clipsToBounds = true

        let colorFrame = CGRect(x: 2, y: 2, width: labelWidth - 4, height: viewHeight - 4)
        heightColorView.frame = colorFrame
        heightColorView.backgroundColor = backgroundHeightLightColor
        heightColorView.setShadow(K_BlueColor, 0, 2)
        heightLightView.addSubview(heightColorView)
        
        heightTopView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        for index in 0..<titles.count {
            let label = createLabelWithTitlesIndex(index: index, textColor: titlesHeightLightColor)
            heightTopView.addSubview(label)
        }
        heightLightView.addSubview(heightTopView)
        self.addSubview(heightLightView)
    }
    /// 创建按钮
    func createTopButtons() {
        for index in 0..<titles.count {
            let tempFrame = countCurrentRectWithIndex(index: index)
            let tempButton = UIButton(frame: tempFrame)
            tempButton.tag = index
            tempButton.addTarget(self, action: #selector(tapButton(sender:)), for: .touchUpInside)
            self.addSubview(tempButton)
        }
    }
    /// 按钮点击事件
    @objc func tapButton(sender: UIButton) {
        currentTapButton = sender
        
        buttonSelect(sender.tag)

        let frame = countCurrentRectWithIndex(index: sender.tag)
        let changeFrame = countCurrentRectWithIndex(index: -sender.tag)
        
        UIView.animate(withDuration: duration) {
            self.heightLightView.frame = frame
            self.heightTopView.frame = changeFrame
        }
    }
}
