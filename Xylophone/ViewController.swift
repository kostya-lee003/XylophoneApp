//
//  ViewController.swift
//  Xylophone
//
//  Angela Yu's course about IOS development
//  Created by kostya lee on 17.07.2021.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

@IBDesignable extension UIButton {

    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1
        }
    
        playSound(sender.currentTitle!)
    }
    
    func playSound(_ title: String) {
        var ext = "wav"
        let url = Bundle.main.url(forResource: title, withExtension: ext)
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}
