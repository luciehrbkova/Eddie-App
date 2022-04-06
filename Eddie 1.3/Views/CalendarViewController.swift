//
//  CalendarViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
//    fileprivate weak var calendar: FSCalendar!
    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calendar"
        
        calendarView.delegate = self
        calendarView.dataSource = self

        // In loadView or viewDidLoad
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
//        calendar.dataSource = self
//        calendar.delegate = self
//        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "calendarCell")
//        calendar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(calendar)
//        calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        calendar.heightAnchor.constraint(equalToConstant: 275).isActive = true
//        calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
//        self.calendar = calendar
        
        calendarView.register(FSCalendarCell.self, forCellReuseIdentifier: "calendarCell")
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarView)
    }
    
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        let image = UIImage(named: "leaf4")
////        image?.size.height = 15
////        image?.size.width = 15
//        return image
//    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "calendarCell", for: date, at: position)
        cell.imageView.contentMode = .scaleAspectFit
        return cell
    }

}

//extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
//
//    func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
//        return UIImage(named: "leaf4")
//    }
//    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
//        let cell = calendar.dequeueReusableCell(withIdentifier: "calendarCell", for: date, at: position)
//        cell.imageView.contentMode = .scaleAspectFit
//        return cell
//    }
//}
