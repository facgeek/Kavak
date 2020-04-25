//
//  loader.swift
//  Gnomes
//
//  Created by Arturo Flores Consuelo on 24/04/20.
//  Copyright © 2020 Arturo Flores Consuelo. All rights reserved.
//
// LoadingOverlay

import UIKit
import Foundation

public class loader{

    var overlayView : UIView!
    var activityIndicator : UIActivityIndicatorView!

    class var shared: loader {
        struct Static {
            static let instance: loader = loader()
        }
        return Static.instance
    }

    init(){
        self.overlayView = UIView()
        self.activityIndicator = UIActivityIndicatorView()

        overlayView.frame = CGRect(x:0, y:0, width:  80, height:  80)
        overlayView.backgroundColor = UIColor(white: 0, alpha: 0.7)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        overlayView.layer.zPosition = 1

        activityIndicator.frame = CGRect(x:0, y:0, width: 40, height:40)
        activityIndicator.center = CGPoint (x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)
        activityIndicator.style = .large
        activityIndicator.color = .white
        overlayView.addSubview(activityIndicator)
    }

    public func showOverlay(view: UIView) {
        overlayView.center = view.center
        view.addSubview(overlayView)
        activityIndicator.startAnimating()
    }

    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
