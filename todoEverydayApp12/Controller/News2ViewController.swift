//
//  NewsViewController.swift
//  OriginalTodoApp
//
//  Created by 深谷祐斗 on 2020/07/19.
//  Copyright © 2020 yuto fukaya. All rights reserved.
//

import UIKit
import SegementSlide
import SwiftyJSON
import WebKit



class News2ViewController: UITableViewController,SegementSlideContentScrollViewDelegate,XMLParserDelegate{

    var newsData = [NewsData]()
    
    //XMLParserのインスタンス化
    var parser = XMLParser()
   
     var currentElemantName:String!
    
    var topicArray:[String] = UserDefaults.standard.array(forKey: "topic") as! [String]
    
//    var topic:String = "/SPORTS"
    var topic:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//
         let topic = topicArray[1]
        
        let urlString = "https://news.google.com/news/rss/headlines/section/topic\(topic)?hl=ja&gl=JP&ceid=JP:ja"
        let url:URL = URL(string:urlString)!
        parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.backgroundColor = .clear

        let backgroudImage:UIImageView = UIImageView(frame: CGRect(x: 0, y: 0 , width:self.view.frame.width, height:self.view.frame.height))
        let image = UIImage(named: "background2")
        backgroudImage.image = image
        backgroudImage.contentMode = .scaleToFill
        backgroudImage.alpha = 0.4
        self.tableView.backgroundView = backgroudImage
        
        
    }
    
//    func topicData(){
//
//        UserDefaults.standard.set(topic, forKey: "topic2")
//        let topic2 = UserDefaults.standard.object(forKey: "topic2") as! String
//        print(topic2)
//
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let newsData = self.newsData[indexPath.row]
        cell.NewsTextLabel.text = newsData.title
        cell.pubdataTextLabel.text = newsData.pubDate
        cell.backgroundColor = .clear
        cell.contentView.backgroundColor = .clear
       
//        let cellheight: CGFloat = cell.bounds.height
//        let cellwidth: CGFloat = cell.bounds.width
//        let cellImage = UIImageView(frame: CGRect(x: 0, y: 0, width: cellwidth, height: cellheight))
//        cellImage.image = UIImage(named: "background")
//        cell.self.sendSubviewToBack(cellImage)
//        cell.addSubview(cellImage)
//        cell.self.bringSubviewToFront(cell.textLabel!)
        
        return cell
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
//       let newsData = self.newsData[indexPath.row]
//        cell.textLabel?.text = newsData.title
//        cell.detailTextLabel?.text = newsData.url
        
       
    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
           
           currentElemantName = nil
           if elementName == "item"{
               
               self.newsData.append(NewsData())
       
               
           }else{
               
               currentElemantName = elementName
               
           }
       }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
           
           if self.newsData.count > 0{
               
               let lastItem = self.newsData[self.newsData.count - 1]
               
               switch self.currentElemantName {
               case "title":
                   lastItem.title = string
               case "link":
                   lastItem.url = string
               case "pubDate":
                   lastItem.GetpubData = string
                   let partPubDataString:String = String(string[(string.index(string.startIndex, offsetBy: 17))..<string.index(string.startIndex, offsetBy: 22)])
                   lastItem.pubDate = partPubDataString
               default:break
                   
               }
               
               
           }
       }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
           self.currentElemantName = nil
       }
       
       
       func parserDidEndDocument(_ parser: XMLParser) {
           self.tableView.reloadData()
       }
       
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("エラー:" + parseError.localizedDescription)
    }
    
    
       override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


           let webviewContorller = WebViewController()
           let newsItem = newsData[indexPath.row]
           UserDefaults.standard.set(newsItem.url, forKey: "url")
           present(webviewContorller,animated: true ,completion: nil)

       }

    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

