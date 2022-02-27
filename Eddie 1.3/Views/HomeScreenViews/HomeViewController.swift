//
//  HomeViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var moduleGuideCollectionView: UICollectionView!
    @IBOutlet weak var viewProgress: UIView!
    
    //testButton
    @IBOutlet weak var testButton: UIButton!
    let circleProgress = CAShapeLayer()
    var nextProgressStep: Int = 1
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Motivation"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.addGradient(colors: [ .init(red: 0.84, green: 0.99, blue: 0.80, alpha: 1.00), .white], locations: [0, 3])
        // progressCircle
        createProgressCircle()
        moduleGuideCollectionView.dataSource = self
        moduleGuideCollectionView.delegate = self
        //style CollectView
        moduleGuideCollectionView.layer.cornerRadius = 10
        moduleGuideCollectionView.layer.masksToBounds = true
        //style CollectView Layout
        moduleGuideCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 90, height: 120)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        if (nextProgressStep == 1) {
            animateProgress(from: 0, value: 1/3)
            nextProgressStep = 2
        } else if (nextProgressStep == 2) {
            animateProgress(from: 1/3, value: 2/3)
            nextProgressStep = 3
        } else if (nextProgressStep == 3) {
            animateProgress(from: 2/3, value: 1)
            nextProgressStep = 1
        }
        
    }
    
    func animateProgress(from: Double, value: Double){
        //Animate
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        animation.fromValue = from
        animation.toValue = value
        circleProgress.add(animation, forKey: "animation")
    }
    
    func createProgressCircle() {
        //middle of the view
        let positionX = viewProgress.center.x - 10
        let positionY = viewProgress.center.y - 60 //radius
        
        let circlePath = UIBezierPath(arcCenter: .zero, radius: 160,
                                      startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        let circleShadow = CAShapeLayer()
        circleShadow.path = circlePath.cgPath
        circleShadow.lineWidth = 15
        circleShadow.position =  CGPoint(x: positionX, y: positionY)
        circleShadow.fillColor = UIColor.clear.cgColor
        circleShadow.strokeColor = UIColor.systemGray6.cgColor
        viewProgress.layer.addSublayer(circleShadow)
        
        circleProgress.path = circlePath.cgPath
        circleProgress.lineWidth = 15
        circleProgress.position = CGPoint(x: positionX, y: positionY)
        circleProgress.strokeEnd = 0
        circleProgress.strokeColor = UIColor(named: "GreenMain")?.cgColor
        circleProgress.fillColor = UIColor.clear.cgColor
        viewProgress.layer.addSublayer(circleProgress)
        
        //end circle___________________________
        label.sizeToFit()
        viewProgress.addSubview(label)
        label.center = viewProgress.center
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moduleGuides1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = moduleGuideCollectionView.dequeueReusableCell(withReuseIdentifier: "ModuleGuideCollectionViewCell", for: indexPath) as! ModuleGuideCollectionViewCell
        cell.setup(with: moduleGuides1[indexPath.row])
        // style
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        moduleGuides1[indexPath.row].moduleImage = UIImage(systemName: "checkmark.circle")! 
        // send data to database
    }

}

// Gradient Extension
extension UIView {
    func addGradient(colors: [UIColor] = [.blue, .white], locations: [NSNumber] = [0, 2], startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.0, y: 1.0), type: CAGradientLayerType = .radial){
        let gradient = CAGradientLayer()
        gradient.frame.size = self.frame.size
        gradient.frame.origin = CGPoint(x: 0.0, y: 0.0)
        // Iterates through the colors array and casts the individual elements to cgColor
        // Alternatively, one could use a CGColor Array in the first place or do this cast in a for-loop
        gradient.colors = colors.map{ $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        // Insert the new layer at the bottom-most position
        // This way we won't cover any other elements
        self.layer.insertSublayer(gradient, at: 0)
    }
}
