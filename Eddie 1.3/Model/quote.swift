//
//  quote.swift
//  Eddie 1.3
//
//  Created by Lucie Hrbkova on 05/03/2022.
//

import Foundation
import UIKit

struct Quote {
    let date: String
    let quote: String
    let number: Int
    let image: UIImage?
}

let quoteList: [Quote] = [
    Quote(date: "5/3/2022",
          quote: " \"Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine.\" \n \n ― Roy T. Bennett, The Light in the Heart",
          number: 1,
          image: #imageLiteral(resourceName: "leaf3")),
    Quote(date: "5/3/2022",
          quote: " \" Happiness is not something you postpone for the future; it is something you design for the present.\"\n \n — Jim Rohn ",
          number: 2,
          image: nil),
    Quote(date: "5/3/2022",
          quote: " \" Through a long and painful process, I’ve learned that happiness is an inside job – not based on anything or anyone in the outer material world.\"\n \n  — Alana Stewart",
          number: 3,
          image: #imageLiteral(resourceName: "leaf2")),
    Quote(date: "5/3/2022",
          quote: " \" Work out your own salvation. Do not depend on others.\" \n \n  — Buddha",
          number: 4,
          image: nil),
    Quote(date: "5/3/2022",
          quote: " \" He that can have patience can have what he will.\" \n \n ― Benjamin Franklin ",
          number: 5,
          image: nil),
    Quote(date: "5/3/2022",
          quote: " \" With the new day comes new strength and new thoughts.\"  \n \n — Eleanor Roosevelt ",
          number: 6,
          image: nil),
    Quote(date: "5/3/2022",
          quote: " \" It is never too late to be what you might have been.\" \n \n ― George Eliot ",
          number: 7,
          image: #imageLiteral(resourceName: "leaf1")),
    Quote(date: "5/3/2022",
          quote: " \" Don’t judge each day by the harvest you reap but by the seeds that you plant.\" \n \n ― Robert Louis Stevenson",
          number: 8,
          image: nil),
    Quote(date: "5/3/2022",
          quote: " \" Vision without action is a daydream. Action without vision is a nightmare.\"  \n \n— Japanese Proverb ",
          number: 9,
          image: #imageLiteral(resourceName: "leaf4")),
    Quote(date: "5/3/2022",
          quote: " \" Once you have tasted flight, you will forever walk the earth with your eyes turned skyward, for there you have been, and there you will always long to return.\" \n \n― Leonardo da Vinci",
          number: 10,
          image: nil),
    
]

