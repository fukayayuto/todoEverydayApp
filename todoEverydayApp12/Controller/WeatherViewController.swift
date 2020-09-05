//
//  Weather1ViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/08/08.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import Lottie
import Alamofire
import CoreLocation
import SwiftyJSON

class WeatherViewController: UIViewController,CLLocationManagerDelegate{
    
    @IBOutlet weak var weatherIconView: UIView!
    @IBOutlet weak var areaTextLabel: UILabel!
    @IBOutlet weak var temprutureLabel: UILabel!
    @IBOutlet weak var MaxTempLabel: UILabel!
    @IBOutlet weak var MinTempLabel: UILabel!
    @IBOutlet weak var timeMainTextLabel: UILabel!
    @IBOutlet weak var IconScrollView: UIScrollView!
    @IBOutlet weak var baceView: UIView!
    @IBOutlet weak var timeTextLabel: UILabel!
    @IBOutlet weak var weatherIconLabel: UILabel!
    @IBOutlet weak var tempTextLabel: UILabel!
    @IBOutlet weak var timeTextLabelA: UILabel!
    @IBOutlet weak var weatherIconLabelA: UILabel!
    @IBOutlet weak var tempTextLabelA: UILabel!
    @IBOutlet weak var timeTextLabelB: UILabel!
    @IBOutlet weak var weatherIconLabelB: UILabel!
    @IBOutlet weak var tempTextLabelB: UILabel!
    @IBOutlet weak var timeTextLabelC: UILabel!
    @IBOutlet weak var weatherIconLabelC: UILabel!
    @IBOutlet weak var tempTextLabelC: UILabel!
    @IBOutlet weak var timeTextLabelD: UILabel!
    @IBOutlet weak var weatherIconLabelD: UILabel!
    @IBOutlet weak var tempTextLabelD: UILabel!
    @IBOutlet weak var timeTextLabelE: UILabel!
    @IBOutlet weak var weatherIconLabelE: UILabel!
    @IBOutlet weak var tempTextLabelE: UILabel!
    @IBOutlet weak var timeTextLabelF: UILabel!
    @IBOutlet weak var weatherIconLabelF: UILabel!
    @IBOutlet weak var tempTextLabelF: UILabel!
    @IBOutlet weak var timeTextLabelG: UILabel!
    @IBOutlet weak var weatherIconLabelG: UILabel!
    @IBOutlet weak var tempTextLabelG: UILabel!

    
    
    var areaString:String = ""
    var weatherIcon:String = ""
    var tempureture:Double = 0
    var MaxTemp:Double = 0
    var MinTemp:Double = 0
    var weatherId:Int = 0
    
    var dateText:String = ""
    var timeText:String = ""
    var timeTextA:String = ""
    var timeTextB:String = ""
    var timeTextC:String = ""
    var timeTextD:String = ""
    var timeTextE:String = ""
    var timeTextF:String = ""
    var timeTextG:String = ""
    
    var weatherIdA:Int = 0
    var weatherIdB:Int = 0
    var weatherIdC:Int = 0
    var weatherIdD:Int = 0
    var weatherIdE:Int = 0
    var weatherIdF:Int = 0
    var weatherIdG:Int = 0
    
    var tempA:Double = 0
    var tempB:Double = 0
    var tempC:Double = 0
    var tempD:Double = 0
    var tempE:Double = 0
    var tempF:Double = 0
    var tempG:Double = 0
    
    var lat = 26.8205
    var lon = 30.8024
    
    var animationString:String = "RainIcon"
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
  
        
        
             
         areaTextLabel.text = areaString
         timeMainTextLabel.text = dateText
        
        
        temprutureLabel.text = "\(tempureture)℃"
        MaxTempLabel.text = "\(MaxTemp)℃"
        MinTempLabel.text = "\(MinTemp)℃"
        
         
         weatherIconLabel.text = weatherIconChange(weatherId: weatherId)
         timeTextLabel.text = timeText
         tempTextLabel.text = "\(tempureture)℃"

         weatherIconLabelA.text = weatherIconChange(weatherId: weatherIdA)
         timeTextLabelA.text = timeTextA
         tempTextLabelA.text = "\(tempA)℃"

         weatherIconLabelB.text = weatherIconChange(weatherId: weatherIdB)
         timeTextLabelB.text = timeTextB
         tempTextLabelB.text = "\(tempB)℃"

         weatherIconLabelC.text = weatherIconChange(weatherId:weatherIdC)
         timeTextLabelC.text = timeTextC
         tempTextLabelC.text = "\(tempC)℃"

         weatherIconLabelD.text = weatherIconChange(weatherId: weatherIdD)
         timeTextLabelD.text = timeTextD
         tempTextLabelD.text = "\(tempD)℃"

         weatherIconLabelE.text = weatherIconChange(weatherId: weatherIdE)
         timeTextLabelE.text = timeTextE
         tempTextLabelE.text = "\(tempE)℃"

         weatherIconLabelF.text = weatherIconChange(weatherId: weatherIdF)
         timeTextLabelF.text = timeTextF
         tempTextLabelF.text = "\(tempF)℃"

         weatherIconLabelG.text = weatherIconChange(weatherId: weatherIdG)
         timeTextLabelG.text = timeTextG
         tempTextLabelG.text = "\(tempG)℃"
         
         
         
         
         switch weatherId{
         //             雷
                     case 200..<300:
                         view.backgroundColor = .systemYellow
                         animationString = "ThunderIcon"
                         weatherIconView.backgroundColor = .systemYellow
                         baceView.backgroundColor = .systemYellow
                         IconScrollView.backgroundColor = .systemYellow
                         
         //                曇り
                     case 300..<400:
                         view.backgroundColor = .lightGray
                         animationString = "CloudIcon"
                         weatherIconView.backgroundColor = .lightGray
                         baceView.backgroundColor = .lightGray
                         IconScrollView.backgroundColor = .lightGray
                         
         //                雨
                     case 500..<600:
                         view.backgroundColor = .systemBlue
                         animationString = "RainIcon"
                         weatherIconView.backgroundColor = .systemBlue
                         baceView.backgroundColor = .systemBlue
                         IconScrollView.backgroundColor = .systemBlue
                         
         //                雪
                      case 600..<700:
                         view.backgroundColor = .white
                         animationString = "snowIcon"
                         weatherIconView.backgroundColor = .white
                         baceView.backgroundColor = .white
                         IconScrollView.backgroundColor = .white
                        
         //                風
                      case 700..<800:
                         view.backgroundColor = .lightGray
                         animationString = "windyIcon"
                         weatherIconView.backgroundColor = .lightGray
                         baceView.backgroundColor = .lightGray
                         IconScrollView.backgroundColor = .lightGray
                         
                         
         //                曇り
                     case 800:
                         view.backgroundColor = .lightGray
                         animationString = "SunnyIcon"
                         weatherIconView.backgroundColor = .lightGray
                         baceView.backgroundColor = .lightGray
                         IconScrollView.backgroundColor = .lightGray
                         
         //                曇り
                     case 801..<900:
                         view.backgroundColor = .lightGray
                         animationString = "CloudIcon"
                         weatherIconView.backgroundColor = .lightGray
                         baceView.backgroundColor = .lightGray
                         IconScrollView.backgroundColor = .lightGray
                         
         //                曇り
                     default:
                         view.backgroundColor = .lightGray
                         animationString = "CloudIcon"
                         weatherIconView.backgroundColor = .lightGray
                         baceView.backgroundColor = .lightGray
                         IconScrollView.backgroundColor = .lightGray
                     }
         
             
         
         animationIcon()
         
         let contentWidth = baceView.bounds.width*2
         let contentHeight = baceView.bounds.height
         IconScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
       
    }
 
    
    func animationIcon(){
          
          let animationView = AnimationView(name: "\(animationString)")
          animationView.frame = weatherIconView.bounds
          animationView.contentMode = .scaleAspectFit
          animationView.loopMode = .loop
          animationView.backgroundColor = .clear
          animationView.animationSpeed = 2.0
          weatherIconView.addSubview(animationView)
          animationView.play()
    
      }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        lat = locValue.latitude
        lon = locValue.longitude
        
        getData(lat: lat, lon: lon)
    }
        
       
        
    
    func getData(lat:Double,lon:Double){
    //                let area = "1853908"
                    let APIkey = "3583b769077fdfc4880f9fcd27d339bf"
                    let urlText:String = "https://api.openweathermap.org/data/2.5/forecast?lat=\(lat)&lon=\(lon)&units=metric&lang=ja&APPID=\(APIkey)"
                    let urlQuery = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    let url = URL(string: urlQuery!)

                    AF.request(url!, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON{ responce in


                        switch responce.result{

                        case .success:

                        let json:JSON = JSON(responce.data as Any)
                    
                        self.weatherIcon = json["list"][0]["weather"][0]["main"].string!
                        let tempureture1 = json["list"][0]["main"]["temp"].double
                        let MaxTemp1 = json["list"][0]["main"]["temp_max"].double
                        let MinTemp1 = json["list"][0]["main"]["temp_min"].double
                        self.areaString  = json["city"]["name"].string!
                        self.weatherId = json["list"][0]["weather"][0]["id"].int!

                        self.weatherIdA = json["list"][0]["weather"][0]["id"].int!
                        self.weatherIdB = json["list"][1]["weather"][0]["id"].int!
                        self.weatherIdC = json["list"][2]["weather"][0]["id"].int!
                        self.weatherIdD = json["list"][3]["weather"][0]["id"].int!
                        self.weatherIdE = json["list"][4]["weather"][0]["id"].int!
                        self.weatherIdF = json["list"][5]["weather"][0]["id"].int!
                        self.weatherIdG = json["list"][6]["weather"][0]["id"].int!
                        
                        
                        let timeString = json["list"][0]["dt_txt"].string!
                        let timeStringA = json["list"][1]["dt_txt"].string!
                        let timeStringB = json["list"][2]["dt_txt"].string!
                        let timeStringC = json["list"][3]["dt_txt"].string!
                        let timeStringD = json["list"][4]["dt_txt"].string!
                        let timeStringE = json["list"][5]["dt_txt"].string!
                        let timeStringF = json["list"][6]["dt_txt"].string!
                        let timeStringG = json["list"][7]["dt_txt"].string!
                        
                        
                        
                        
                        self.dateText = self.dateTextChange(time: timeString)
                        self.timeText = self.timeTextChange(time: timeString)
                        self.timeTextA = self.timeTextChange(time: timeStringA)
                        self.timeTextB = self.timeTextChange(time: timeStringB)
                        self.timeTextC = self.timeTextChange(time: timeStringC)
                        self.timeTextD = self.timeTextChange(time: timeStringD)
                        self.timeTextE = self.timeTextChange(time: timeStringE)
                        self.timeTextF = self.timeTextChange(time: timeStringF)
                        self.timeTextG = self.timeTextChange(time: timeStringG)
                        
                        let tempuretureA = json["list"][0]["main"]["temp"].double
                        let tempuretureB = json["list"][1]["main"]["temp"].double
                        let tempuretureC = json["list"][2]["main"]["temp"].double
                        let tempuretureD = json["list"][3]["main"]["temp"].double
                        let tempuretureE = json["list"][4]["main"]["temp"].double
                        let tempuretureF = json["list"][5]["main"]["temp"].double
                        let tempuretureG = json["list"][6]["main"]["temp"].double

                        let tempNumRound = self.tempChange(temp:tempureture1!)
                        let MaxTempRoud = self.tempChange(temp: MaxTemp1!)
                        let MinTempRound = self.tempChange(temp: MinTemp1!)
                        
                        let tempNumRoundA = self.tempChange(temp:tempuretureA!)
                        let tempNumRoundB = self.tempChange(temp:tempuretureB!)
                        let tempNumRoundC = self.tempChange(temp:tempuretureC!)
                        let tempNumRoundD = self.tempChange(temp:tempuretureD!)
                        let tempNumRoundE = self.tempChange(temp:tempuretureE!)
                        let tempNumRoundF = self.tempChange(temp:tempuretureF!)
                        let tempNumRoundG = self.tempChange(temp:tempuretureG!)
                        
                        self.tempureture = tempNumRound
                        self.MaxTemp = MaxTempRoud
                        self.MinTemp = MinTempRound
                        
                        self.tempA = tempNumRoundA
                        self.tempB = tempNumRoundB
                        self.tempC = tempNumRoundC
                        self.tempD = tempNumRoundD
                        self.tempE = tempNumRoundE
                        self.tempF = tempNumRoundF
                        self.tempG = tempNumRoundG
                            
                        self.viewDidLoad()
                            
                       case.failure:
                        break

                        }
                       
                    }
        }
    
    
    func weatherIconChange(weatherId:Int)->String{
            
            var weatherIcon:String = ""
            
        switch weatherId{
               case 200..<300:   weatherIcon = "⚡️"
               case 300..<400:   weatherIcon = "🌫"
               case 500..<600:   weatherIcon = "☔️"
               case 600..<700:   weatherIcon = "⛄️"
               case 700..<800:  weatherIcon = "🌪"
               case 800:   weatherIcon = "☀️"
               case 801..<900:  weatherIcon = "☁️"
               case 900..<1000:  weatherIcon = "🌀"
               default:   weatherIcon = "☁️"
                      }
            
            return weatherIcon
        }
    
    
        
        
    func timeTextChange(time:String)->String{
             
          let timeStr:String = String(time[time.index(time.startIndex, offsetBy: 11)..<time.index(time.startIndex, offsetBy: 13)])
          var timeString2:String = ""
          switch timeStr{
          case "03": timeString2 = "3"
          case "06": timeString2 = "6"
          case "09": timeString2 = "9"
          case "12": timeString2 = "12"
          case "15": timeString2 = "15"
          case "18": timeString2 = "18"
          case "21": timeString2 = "21"
          case "00": timeString2 = "0"
          default: break
          }
          
            
             let timeString:String = "\(timeString2)時"
          
          
             return timeString
             
         }
             
             func tempChange(temp:Double)->Double{
                 
                 let tempRound:Double = round(temp*10)/10
                 return tempRound
           
             }
             
      func dateTextChange(time:String)->String{
                
          let dateString1:String = String(time[time.index(time.startIndex, offsetBy: 5)..<time.index(time.startIndex, offsetBy: 7)])
          let dateString2:String = String(time[time.index(time.startIndex, offsetBy: 8)..<time.index(time.startIndex, offsetBy: 10)])
          
          var dateString3:String = ""
          
          switch dateString1 {
          case "01": dateString3 = "1"
          case "02": dateString3 = "2"
          case "03": dateString3 = "3"
          case "04": dateString3 = "4"
          case "05": dateString3 = "5"
          case "06": dateString3 = "6"
          case "07": dateString3 = "7"
          case "08": dateString3 = "8"
          case "09": dateString3 = "9"
          default: dateString3 = dateString1
          }
          
          var dateString4:String = ""
          
          switch dateString2 {
          case "01": dateString4 = "1"
          case "02": dateString4 = "2"
          case "03": dateString4 = "3"
          case "04": dateString4 = "4"
          case "05": dateString4 = "5"
          case "06": dateString4 = "6"
          case "07": dateString4 = "7"
          case "08": dateString4 = "8"
          case "09": dateString4 = "9"
          default: dateString4 = dateString2
          }
          
          let dateString:String = "\(dateString3)月\(dateString4)日"
          return dateString
                
            }


    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
