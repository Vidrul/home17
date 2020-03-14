
import UIKit

class ColorViewController: UIViewController {
    
    
    var myView = UIView()
    
    var viewArray: [UIView] = [UIView]()
    var colorArray: [UIColor] = [.systemRed,.systemBlue,.systemFill,.systemPink,.systemOrange,.systemPurple]
    
    
    @IBAction func addView(_ sender: UIButton) {
        
        let preView = viewArray.last
        if let preViewMaxY = preView?.frame.maxY,
            preViewMaxY > self.view.frame.size.height - 100 {
            return
        }
        
        self.view.addSubview(myView)
        let randomColorIndex = Int.random(in: 0..<colorArray.count)
        myView.backgroundColor = colorArray[randomColorIndex]
        setupConstraints(forView: myView)
        
        viewArray.append(myView)
        
    }
    
    private func setupConstraints (forView view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        if viewArray.isEmpty {
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        } else {
            if let prevView = viewArray.last {
                view.topAnchor.constraint(equalTo: prevView.bottomAnchor, constant: 20).isActive = true
            }
        }
        
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        view.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        
        
    }
}
