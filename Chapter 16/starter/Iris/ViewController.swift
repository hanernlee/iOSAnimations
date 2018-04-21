/*
 * Copyright (c) 2014-present Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var meterLabel: UILabel!
  @IBOutlet weak var speakButton: UIButton!
  
  let monitor = MicMonitor()
  let assistant = Assistant()
  let replicator = CAReplicatorLayer()
  let dot = CALayer()
  
  let dotLength: CGFloat = 6.0
  let dotOffset: CGFloat = 8.0
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    replicator.frame = view.bounds
    view.layer.addSublayer(replicator)
    
    dot.frame = CGRect(
        x: replicator.frame.size.width - dotLength,
        y: replicator.position.y,
        width: dotLength,
        height: dotLength
    )
    
    dot.backgroundColor = UIColor.lightGray.cgColor
    dot.borderColor = UIColor(white: 1.0, alpha: 1.0).cgColor
    dot.borderWidth = 0.5
    dot.cornerRadius = 1.5
    replicator.addSublayer(dot)
    
    replicator.instanceCount = Int(view.frame.size.width / dotOffset)
    replicator.instanceTransform = CATransform3DMakeTranslation(-dotOffset, 0, 0)
    replicator.instanceDelay = 0.02
  }
    
  
  @IBAction func actionStartMonitoring(_ sender: AnyObject) {
    
  }
  
  @IBAction func actionEndMonitoring(_ sender: AnyObject) {
    
    //speak after 1 second
    delay(seconds: 1.0) {
      self.startSpeaking()
    }
  }
  
  func startSpeaking() {
    print("speak back")
    
    let scale = CABasicAnimation(keyPath: "transform")
    scale.fromValue = NSValue(caTransform3D: CATransform3DIdentity)
    scale.toValue = NSValue(caTransform3D: CATransform3DMakeScale(1.4, 15, 1.0))
    scale.duration = 0.33
    scale.repeatCount = .infinity
    scale.autoreverses = true
    scale.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    dot.add(scale, forKey: "dotScale")
    
  }
  
  func endSpeaking() {
    
  }
}
