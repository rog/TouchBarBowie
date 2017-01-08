//
//  BowieCanvas.swift
//  touchbar_bowie
//
//  Created by Rogelio Alberto on 08/01/2017.
//  Copyright © 2017 rog. All rights reserved.
//

import Cocoa

class BowieCanvas: NSImageView {
    

    var imageLoaded:Bool = false;

    var xPosition: CGFloat = 0 {
        didSet {
            self.frame = CGRect(x: xPosition, y: 0, width: 685, height: 50)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        self.animates = true
        
        if(!self.imageLoaded){
            self.downloadImage()
        }
        

        self.canDrawSubviewsIntoLayer = true
        self.frame = CGRect(x: xPosition, y: 0, width: 685, height: 50)
    }
    
    override func touchesBegan(with event: NSEvent) {
        // Calling super causes a jump back to its original position 🤔
        //super.touchesBegan(with: event)
    }
    
    override func didAddSubview(_ subview: NSView) {
        
    }
    
    func downloadImage() {
        let url = URL(string: "https://i.imgur.com/5JFE2Xl.gif")

        getDataFromUrl(url: url!) { (data, response, error)  in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() { () -> Void in
                self.image = NSImage(data: data)
                self.imageLoaded = true;
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    

    
    override func touchesMoved(with event: NSEvent) {
        if #available(OSX 10.12.2, *) {
            let current = event.allTouches().first?.location(in: self).x ?? 0
            let previous = event.allTouches().first?.previousLocation(in: self).x ?? 0
        
            let dX = (current - previous)
            
            xPosition += dX
        } else {
            // Fallback on earlier versions
        }
    }
    
}
