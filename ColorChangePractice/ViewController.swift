//
//  ViewController.swift
//  ColorChangePractice
//
//  Created by Tai Chin Huang on 2020/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    //backGroundView作為alpha歸零顯現
    @IBOutlet weak var backGroundView: UIImageView!
    //漸層背景
    @IBOutlet weak var gradientView: UIView!
    //拿來去背做遮罩的hair/eyes
    @IBOutlet weak var hairView: UIView!
    @IBOutlet weak var eyesView: UIView!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //一開始先讓主層以外的背景透明化
        let hairImageView = UIImageView(image: UIImage(named: "Amiya hair mask"))
        hairImageView.frame = hairView.bounds
        hairImageView.contentMode = .scaleAspectFit
        hairView.mask = hairImageView
        let eyesImageView = UIImageView(image: UIImage(named: "Amiya eyes mask"))
        eyesImageView.frame = eyesView.bounds
        eyesImageView.contentMode = .scaleAspectFit
        eyesView.mask = eyesImageView
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        //讓red~alpha slider旁的數值可以跟著slider走，%.2f為顯示到小數點第二位
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        alphaSliderValue.text = String(format: "%.1f", alphaSlider.value)
        //切換segment來控制更動眼睛或頭髮的顏色
        let segmentSelect = segmentControl.selectedSegmentIndex
        switch segmentSelect {
        case 0:
            //hairView的背景色跟著slider走
            hairView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        case 1:
//            hairView.alpha = 0
            //eyesView的背景色跟著slider走
            eyesView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        default:
            return
        }
    }
    
    @IBAction func gradientSliderChange(_ sender: UISlider) {
        //漸層前需設定屬於漸層的CAGradientLayer()
        let gradientLayer = CAGradientLayer()
//        let gradientLocation = round(15 * gradientSlider.value) / 15
        gradientLayer.frame = gradientView.bounds
        gradientLayer.frame = hairView.bounds
        gradientLayer.frame = eyesView.bounds
////        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))]
//        gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.magenta.cgColor]
////        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.locations = [0.0, NSNumber(value: gradientSlider.value)]
//        gradientView.layer.addSublayer(gradientLayer)
//        hairView.addSubview(gradientView)
//        eyesView.addSubview(gradientView)
        let segmentSelect = segmentControl.selectedSegmentIndex
        switch segmentSelect {
        case 0:
//        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))]
            gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.magenta.cgColor]
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.locations = [0.0, NSNumber(value: gradientSlider.value)]
            gradientView.layer.addSublayer(gradientLayer)
            hairView.addSubview(gradientView)
        case 1:
//        gradientLayer.colors = [CGColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))]
            gradientLayer.colors = [UIColor.cyan.cgColor,UIColor.magenta.cgColor]
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.orange.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.purple.cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            gradientLayer.locations = [0.0, NSNumber(value: gradientSlider.value)]
            gradientView.layer.addSublayer(gradientLayer)
            eyesView.addSubview(gradientView)
        default:
            return
        }
    }
    
    @IBAction func randomButton(_ sender: UIButton) {
        //讓red~alpha slider旁的數值可以跟著slider走，%.2f為顯示到小數點第二位
        redSliderValue.text = String(format: "%.2f", redSlider.value)
        greenSliderValue.text = String(format: "%.2f", greenSlider.value)
        blueSliderValue.text = String(format: "%.2f", blueSlider.value)
        alphaSliderValue.text = String(format: "%.1f", alphaSlider.value)
        //random鈕在需要切換hair/eyes都要能作動
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
