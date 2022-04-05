//
//  PdfViewController.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 14/02/2022.
//

import UIKit
import PDFKit


class PdfViewController: UIViewController {

    public var documentData: Data?
    @IBOutlet weak var pdfView: PDFView!
    var receivedData = ""
    let pdfCreator = PDFCreator(
      title: "Eddie App Report",
      body: "We know that you're here because you value your time. If you wanted to watch someone program for hours and hours without explaining what they're doing, you'd be on YouTube.By getting this course, you can be rest assured that the course is carefully thought out and edited. There are beautiful animations that explain all the difficult concepts and the videos are fully up to date with the latest versions of Swift and Xcode.",
      image: #imageLiteral(resourceName: "LaunchLogo"),
      image2: #imageLiteral(resourceName: "pdf-db"),
      contact: "Lucie Hrbkova"
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        print(receivedData)
        documentData = pdfCreator.createFlyer()
        
        if let data = documentData {
            pdfView.document = PDFDocument(data: data)
            pdfView.autoScales = true
        }

//        pdfView = renderAsPDF(demandEntry: Error, inView: pdfView)
    }
    
    @IBAction func pressedShare(_ sender: Any) {
        let pdfData = pdfCreator.createFlyer()
        let vc = UIActivityViewController(
          activityItems: [pdfData],
          applicationActivities: []
        )
        vc.popoverPresentationController?.sourceView = self.view
        self.present(vc, animated: true, completion: nil)
    }
    
    let testUserList : [User] = [
        User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
        User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
        User(email: "hrbkova.lucka@gmail.com", username: "Lucie", password: "p4ssword"),
    ]
    
}
