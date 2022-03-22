//
//  HomeViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit
import UserNotifications

var currentLevel: Int = 1
//Game Manager
let gameManager = GameMananager()

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UNUserNotificationCenterDelegate {
    
    // Outlets_________________
    @IBOutlet var homeView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var moduleGuideCollectionView: UICollectionView!
    @IBOutlet weak var homeAwardCollectionView: UICollectionView!
    @IBOutlet weak var viewProgress: UIView!
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var quoteTextView: UITextView!
    
    //Variables________________
    var motivation: String = "Motivation:Instances of DateFormatter create string representations of NSDate objects, and convert textual representations of dates and times into NSDate objects, and convert textual representations of dates "
    var quote: String = "“Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine.” \n \n ― Roy T. Bennett, The Light in the Heart"
    var arrayOfIds = [String]()
    
    //testButton
    @IBOutlet weak var testButton: UIButton!
    let circleProgress = CAShapeLayer()
    var nextProgressStep: Int = 1
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 7
//        label.layer.backgroundColor = UIColor.red.cgColor
        return label
    }()
    
    let foxImage: UIImageView = {
        let foximage = UIImageView()
//        foximage.layer.backgroundColor = UIColor.green.cgColor
        foximage.contentMode = .scaleAspectFit
        return foximage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        homeView.addGradient(colors: [ .init(red: 0.84, green: 0.99, blue: 0.80, alpha: 1.00), .white], locations: [0, 3])
        // progressCircle
        createProgressCircle()
        //Ids of storyboads
        arrayOfIds = ["L1M1", "L1M2", "L1M3", "L1M4","L1M5"]
        moduleGuideCollectionView.dataSource = self
        moduleGuideCollectionView.delegate = self
        //style CollectView
        moduleGuideCollectionView.layer.cornerRadius = 10
        moduleGuideCollectionView.layer.masksToBounds = true
        moduleGuideCollectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        //style CollectView Layout
        moduleGuideCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 90, height: 120)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        // style + content Quote
        quoteView.layer.cornerRadius = 10
        quoteView.layer.masksToBounds = true
        quoteTextView.text = quote
        
        //award
        homeAwardCollectionView.dataSource = self
        homeAwardCollectionView.delegate = self
        //style CollectView
        homeAwardCollectionView.layer.cornerRadius = 10
        homeAwardCollectionView.layer.masksToBounds = true
        homeAwardCollectionView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        //style CollectView Layout
        homeAwardCollectionView.collectionViewLayout = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 72, height: 100)
            layout.scrollDirection = .horizontal
            return layout
        }()
        
        self.loadData()
        sendNotification()
        

    }
    
    
    @IBAction func didTapButton(_ sender: Any) {
        runAnimationProgress()
        
        // testing Game manger
        print(gameManager.moduleGuide)
//        adjustText(sectionOrderinList: 0)
//        adjustText(sectionOrderinList: 1)
        
    }
    func runAnimationProgress() {
        if (nextProgressStep == 1) {
            animateProgress(from: 0, value: 0.33)
            nextProgressStep = 2
            progressStepMade(image: "fox2.png", motivation: "Lucie, \n congratulation to your first achievement of the day!")
//            foxImage.image = UIImage(named: "fox2.png")
        } else if (nextProgressStep == 2) {
            animateProgress(from: 0.33 , value: 0.66)
            nextProgressStep = 3
            progressStepMade(image: "fox3.png", motivation: "Lucie, \n you are amazing! \n Keep going!")
        } else if (nextProgressStep == 3) {
            animateProgress(from: 0.66, value: 1)
            nextProgressStep = 1
            progressStepMade(image: "fox4.png", motivation: "Lucie, \n you made it!!! \n have a nice evening")
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
        let positionX = viewProgress.center.x - 7
        let positionY = viewProgress.center.y - 60 //radius
        
        let circlePath = UIBezierPath(arcCenter: .zero, radius: 160,
                                      startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
        let circleShadow = CAShapeLayer()
        circleShadow.path = circlePath.cgPath
        circleShadow.lineWidth = 15
        circleShadow.position =  CGPoint(x: positionX, y: positionY)
        circleShadow.fillColor = UIColor.clear.cgColor
        circleShadow.strokeColor = UIColor.white.cgColor
        viewProgress.layer.addSublayer(circleShadow)
        
        circleProgress.path = circlePath.cgPath
        circleProgress.lineWidth = 15
        circleProgress.position = CGPoint(x: positionX, y: positionY)
        circleProgress.strokeEnd = 0
        circleProgress.strokeColor = UIColor(named: "GreenMain")?.cgColor
        circleProgress.fillColor = UIColor.clear.cgColor
        viewProgress.layer.addSublayer(circleProgress)
        
        //end circle___________________________
        // add fox
        viewProgress.addSubview(foxImage)
        viewProgress.addSubview(label)
        foxImage.image = UIImage(named: "fox1.png")
        foxImage.frame = CGRect(x: homeView.frame.size.width/2 - 70, y: 220, width: 140, height: 110)
        label.frame = CGRect(x: 90 ,y: 100, width: homeView.frame.size.width - 180, height: 120)
        label.text = motivation
//        label.center = viewProgress.center
    }
    
    func progressStepMade(image: String, motivation: String) {
        let imagestring: String = image
        foxImage.image = UIImage(named: imagestring)
        label.text = motivation
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == moduleGuideCollectionView) {
            if (currentLevel == 1) {
                return moduleGuides1.count
            }; return 0
        } else if (collectionView == homeAwardCollectionView) {
            return homeAwards.count
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == moduleGuideCollectionView) {
            let cell = moduleGuideCollectionView.dequeueReusableCell(withReuseIdentifier: "ModuleGuideCollectionViewCell", for: indexPath) as! ModuleGuideCollectionViewCell
            cell.setup(with: moduleGuides1[indexPath.row])
            // style
            cell.layer.cornerRadius = 8
            cell.layer.masksToBounds = true
            //set the peach cell gradient
            let cellView = UIView(frame: view.frame)
            cellView.backgroundColor = UIColor(patternImage:UIImage(named:"PeachGradient.png")!)
            cell.backgroundView = cellView
            return cell
        } else if (collectionView == homeAwardCollectionView) {
            let cell = homeAwardCollectionView.dequeueReusableCell(withReuseIdentifier: "AwardCollectionViewCell", for: indexPath) as! AwardCollectionViewCell
            // returns the cell
            cell.setup(with: homeAwards[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = arrayOfIds[indexPath.row]
        let viewController = storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController!, animated: true)
        if (currentLevel == 1) {
            if (moduleGuides1[indexPath.row].moduleTitle == "1/5") {
                print(moduleGuides1[indexPath.row].moduleTitle)
            } else if (moduleGuides1[indexPath.row].moduleTitle == "2/5") {
                print(moduleGuides1[indexPath.row].moduleTitle)
            } else if (moduleGuides1[indexPath.row].moduleTitle == "3/5") {
                print(moduleGuides1[indexPath.row].moduleTitle)
            } else if (moduleGuides1[indexPath.row].moduleTitle == "4/5") {
                print(moduleGuides1[indexPath.row].moduleTitle)
            } else if (moduleGuides1[indexPath.row].moduleTitle == "5/5") {
                print(moduleGuides1[indexPath.row].moduleTitle)
            }
        }
    }
    
    @objc func loadData() {
        moduleGuideCollectionView.reloadData()
    }

    func sendNotification() {
        //Notification-----------------------------------------------------------------------------
        let center = UNUserNotificationCenter.current()
        UNUserNotificationCenter.current().delegate = self
        center.delegate = self
        center.requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            if error == nil {
                print("User permission is granted : \(granted)")
            }
        }

        let request = createNotification( title: "Breakfast Time", body: "Amazing! it is a time to have a breakfast.", hour: 8, minute: 0)
        let request2 = createNotification( title: "Snack Time", body: "Get yourself something to eat.", hour: 10, minute: 30)
        let request3 = createNotification( title: "Lunch Time", body: "You are in the middle of the day. Enjoy your lunch.", hour: 12, minute: 30)
        let request4 = createNotification( title: "Snack Time", body: "Get yourself something to eat.", hour: 15, minute: 00)
        let request5 = createNotification( title: "Dinner Time", body: "It's a time to have a dinner. Bon Appetite.", hour: 19, minute: 00)
        
        //Step-5 Register with Notification Center
        center.add(request) { error in
        }
        center.add(request2) { error in
        }
        center.add(request3) { error in
        }
        center.add(request4) { error in
        }
        center.add(request5) { error in
        }

        func userNotificationCenter(_ center: UNUserNotificationCenter,
                                    willPresent notification: UNNotification,
                                    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([.sound,.banner])
        }
        //End of notification--------------------------------------------------------------------
    }
    
    func createNotification(title: String, body: String, hour: Int, minute: Int) -> UNNotificationRequest  {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.defaultRingtone
        content.badge = 1
        // date
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        return request
        
    }
}
