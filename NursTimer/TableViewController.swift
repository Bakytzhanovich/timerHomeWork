//
//  TableViewController.swift
//  NursTimer
//
//  Created by Нурсат Шохатбек on 23.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
      var newsArray = [
        News(title: "Icelend volcano erupts", date: "18:12", picture: "volcano", info: "A volcano erupts in Island. Authorities and scientists watch the volcano for weeks. There are many earthquakes. People are waiting for the eruption to happen.The eruption happens on the Reykjanes peninsula. Around 4,000 people must leave Grindavik town. This town is about 40 km southwest of Reykjavik. Authorities also close the Blue Lagoon spa last month. The eruption near Grindavik makes cracks in the ground.They go towards the town. The Keflavik International Airport is open, but flights are late. Pictures show hot rock coming out from the ground at night."),
        News(title: "Australia floods", date: "18:15", picture: "volcano", info: "Rain causes floods in Northeast Australia.Floods come after a storm called Jasper.towns have no electricity. Cars cannot use some roads. Thousands of people are leaving their homes. The rainfall is three times more than usual. Ingham is a small town. 5,000 people live there. They see a crocodile in a drain. They get scared. Experts believe that more rain will come.Rescuers are ready to help at any time.Australia faces extreme weather at this time.Floods are in the Northeast. In the Southeast, authorities warn of fires."),
        News(title: "Fox in a dishwasher", date: "18:20", picture: "usa", info: "The world is changing how it makes energy.Companies use cleaner stuff instead of dirty fuel. But new technologies mean that companies need new materials.Nth Cycle is a recycling company. They use a new technology to take out important metals from old phones and cars. These metals are for example cobalt and nickel. They are important for new things which we use every day. Nth Cycle's technology is greener. It causes less pollution. They also have a smart idea: using small, separate machines instead of big ones.It is good for the planet.Some people do not like new ideas. They do not want to change things. Nth Cycle wants to help everyone understand why their way is important.Getting metals from old things is a very smart idea."),
        News(title: "Recycling metals", date: "18:25", picture: "london", info: "The Beverly Hills of Dubai is in Emirates Hills.Many rich people live there. Many of these people are from India.One big house in Emirates Hills belongs to the founder of the Dano Group. Dano Group makes business for thirty years. A lot of money comes from rich Indians. The house has 2,400 square meters. Many cars are in the garage.The UAE is popular these days. It is easy to get a visa. Taxes are low. It is close to India. The UAE is the best place for rich Indians to move to.Difficult words: founder (a person who starts a company), visa (an official document which says that you can travel to a country), tax (money which you pay to the state)."),
        News(title: "Beverly Hills of Dubai", date: "18:35", picture: "dubai")
      ]
    
    var time = 0
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       startTime()

    }
    @objc func countTime(){
            
            let currentDate = Date()
            let dateFormetter = DateFormatter()
            dateFormetter.dateFormat = "HH:mm:ss"
            newsArray.insert(newsArray[3], at: 0)
            newsArray[0].date = dateFormetter.string(from: currentDate)
          
            
            tableView.reloadData()
        }
        func startTime() {
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
    }
    
    
        
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let label = cell.viewWithTag(1) as! UILabel
        label.text = newsArray[indexPath.row].title
        
        let imageview = cell.viewWithTag(2) as!  UIImageView
        imageview.image = UIImage(named: newsArray[indexPath.row].picture)
        
        let data = cell.viewWithTag(3) as! UILabel
        data.text = newsArray[indexPath.row].date
        
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 81
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! ViewController
        
        detailVc.news = newsArray[indexPath.row]
        navigationController?.show(detailVc, sender: self)
    }
   
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            newsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


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
