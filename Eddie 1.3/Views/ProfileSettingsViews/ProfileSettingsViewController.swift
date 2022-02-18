//
//  ProfileViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 12/02/2022.
//

import UIKit

// sections
struct Section {
    let title: String
    let options: [SettingsOption]
}

// settings cell struct
struct SettingsOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}


class ProfileSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        //register one cell
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    let mainGreenColor = UIColor(red: 0.358, green: 0.883, blue: 0.674, alpha: 1.0)
    
    ///____________________________________Alert message snippet_____________________________________________________
    func displayAlert(title: String, message: String){
        // Create new Alert
        var alertMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create OK button with action handler
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        //Add OK and Cancel button to an Alert object
        alertMessage.addAction(ok)
        alertMessage.addAction(cancel)
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    ///____________________________________END of Alert message snippet_____________________________________________________

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Profile Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    // Populate Settings Menu
    func configure() {
        
        models.append(Section(
            title: "Profile",
            options: [SettingsOption(title: "Edit Profile",
                                     icon: UIImage(systemName: "person.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {self.performSegue(withIdentifier: "avatarSegue", sender: self)}),
                      SettingsOption(title: "Account Settings",
                                     icon: UIImage(systemName: "gearshape.2.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {self.performSegue(withIdentifier: "accountSegue", sender: self)}),
                                     ]))
        models.append(Section(
            title: "Generate PDF",
            options: [SettingsOption(title: "Report for a Doctor",
                                     icon: UIImage(systemName: "doc.text.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {self.performSegue(withIdentifier: "pdfSegue", sender: self)}),
        ]))
        
        models.append(Section(
            title: "Settings",
            options: [SettingsOption(title: "Reminders",
                                     icon: UIImage(systemName: "bell.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {self.performSegue(withIdentifier: "remindersSegue", sender: self)}),
                      SettingsOption(title: "About Eddie",
                                     icon: UIImage(systemName: "sun.max.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {print("About Eddie")}),
                      SettingsOption(title: "Privacy Policy",
                                     icon: UIImage(systemName: "lock.fill"),
                                     iconBackgroundColor: mainGreenColor,
                                     handler: {self.displayAlert(title: "Edit", message: "Yo are now allowed to edit profile")}),
        ]))
    }
    
    
    //________titleForHeaderInSection__________________________
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    //________numberOfSections__________________________
    func numberOfSections(in tableView: UITableView) -> Int {
        models.count
    }
    
    //________numberOfRowsInSection__________________________
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    //________cellForRowAt__________________________
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SettingTableViewCell.identifier,
            for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
        
    }
    //________didSelectRowAt__________________________
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        // do whatever should be done
        model.handler()
    }
    
    // _______Segue settings (target + data)__________________________________________
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accountSegue" {
            // get a reference to the second view controller
            let targetViewController = segue.destination as! AccountSettingViewController
            // set a variable in the second view controller with the data to pass
            targetViewController.receivedData = "password"
            
        } else if segue.identifier == "avatarSegue" {
            let targetViewController = segue.destination as! AvatarViewController
            targetViewController.receivedData = "avatar"
            
        } else if segue.identifier == "pdfSegue" {
            let targetViewController = segue.destination as! PdfViewController
            targetViewController.receivedData = "PDF Report"
            
        } else if segue.identifier == "remindersSegue" {
            let targetViewController = segue.destination as! RemindersViewController
            targetViewController.receivedData = "Reminders"
        }
    }

}


