//
//  MotivationViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/03/2022.
//

import UIKit

class MotivationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var motivationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motivationTableView.dataSource = self
        motivationTableView.delegate = self
        self.motivationTableView.separatorStyle = .none
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = motivationTableView.dequeueReusableCell(withIdentifier: "MotivationTableViewCell") as! MotivationTableViewCell
        cell.date.text = quoteList[indexPath.row].date
        cell.quote.text = quoteList[indexPath.row].quote
        cell.decoImage.image = quoteList[indexPath.row].image
        cell.quoteView.layer.cornerRadius = 10
        cell.quoteView.layer.masksToBounds = true
        return cell
    }

}
