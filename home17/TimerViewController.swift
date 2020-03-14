

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var lable: UILabel!
    
    var time: Int = 0
    var timer: Timer?
    
    @IBAction func startButtonDidClick(_ sender: UIButton) {
        guard timer == nil else { return }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimeCode), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func stopButtonDidClick(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
    }
    
    
    @IBAction func resetButtonDidClick(_ sender: UIButton) {
        timer?.invalidate()
        time = 0
        lable.text = "0"
        timer = nil
    }
    
}

extension TimerViewController {
    
    @objc func runTimeCode () {
        time += 1
        lable.text = String(time)
    }
}


