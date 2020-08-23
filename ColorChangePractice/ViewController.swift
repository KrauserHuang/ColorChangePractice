//
//  ViewController.swift
//  ColorChangePractice
//
//  Created by Tai Chin Huang on 2020/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    //image有3個，作為背景的pattern/作為漸層的view/最上層的image
    @IBOutlet weak var backGroundView: UIImageView!
    @IBOutlet weak var gradientView: UIImageView!
    @IBOutlet weak var eyesView: UIImageView!
    @IBOutlet weak var hairView: UIImageView!
    //red/green/blue/alpha/gradient/corner radius的所有slider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redSliderValue: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenSliderValue: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueSliderValue: UILabel!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var alphaSliderValue: UILabel!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var cornerRadiusSlider: UISlider!
    //切換頭髮變色或者眼睛變色
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //一開始先讓主層以外的背景透明化

    }
    @IBAction func sliderChange(_ sender: UISlider) {
        //讓red~alpha slider旁的數值可以跟著slider走，%.2f為顯示到小數點第二位
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        alphaSliderValue.text = String(format: "%.1f", alphaSlider.value)
        
        let segmentSelect = segmentControl.selectedSegmentIndex
        switch segmentSelect {
        case 0:
            //hairView的背景色跟著slider走
            hairView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        case 1:
            hairView.alpha = 0
            eyesView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        default:
            return
        }
        
        

        

    }
    @IBAction func gradientSliderChange(_ sender: UISlider) {
        //設定漸層
//        let gradientLayer = CAGradientLayer()
        let gradientLocation = round(15 * gradientSlider.value) / 15
        gradientLayer.frame = gradientView.bounds
//        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))]
        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.magenta.cgColor]
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.locations = [0.0, NSNumber(value: gradientLocation)]
        gradientView.layer.addSublayer(gradientLayer)
        hairView.addSubview(gradientView)
    }
    
    @IBAction func randomButton(_ sender: Any) {
        //讓red~alpha slider旁的數值可以跟著slider走，%.2f為顯示到小數點第二位
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        alphaSliderValue.text = String(format: "%.1f", alphaSlider.value)
        
        let segmentSelect = segmentControl.selectedSegmentIndex
        switch segmentSelect {
        case 0:
            //用.random來設定各個slider的變數
            redSlider.value = Float.random(in: 0...1)
            greenSlider.value = Float.random(in: 0...1)
            blueSlider.value = Float.random(in: 0...1)
            alphaSlider.value = Float.random(in: 0...1)
            //hairView的背景色跟著slider走
            hairView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
//            eyesView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0)
        case 1:
            hairView.alpha = 0
            //用.random來設定各個slider的變數
            redSlider.value = Float.random(in: 0...1)
            greenSlider.value = Float.random(in: 0...1)
            blueSlider.value = Float.random(in: 0...1)
            alphaSlider.value = Float.random(in: 0...1)
            //eyesView的背景色跟著slider走
            eyesView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
//            hairView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0)
        default:
            return
        }
    }
    

}

