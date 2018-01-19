//
//  DetailController.swift
//  Weapons
//
//  Created by yons on 2018/1/2.
//  Copyright © 2018年 xiao bo's studio. All rights reserved.
//

import UIKit

class DetailController: UITableViewController {
    var weapon : Weapon!
    
    
    @IBOutlet weak var headerImageView: UIImageView!
    
    //Table View自行管理表头，所以得获取表头的引用来额外管理
    var headerView: UIView!
    let tableHeaderHeight: CGFloat = 300.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImageView.transform = .init(translationX: 0, y: -200)
        
        headerImageView.image = UIImage(named: weapon.image)
        navigationItem.largeTitleDisplayMode = .never
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = UIColor(named: "theme")
        
        //保留 表头视图 引用
        headerView = tableView.tableHeaderView
        //表头重置为nil
        tableView.tableHeaderView = nil
        //再添加回来，变相实现了表头😓
        tableView.addSubview(headerView)
        
        //table View的内边距：顶边下移300，会触发 滚动事件 - scroll View Did Scroll
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)

    }
    
 
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //位移
        let offsetY = scrollView.contentOffset.y
        
        //下移是负值
        print("位移",offsetY)

        //frame是相对坐标，即在父视图中的位置
        //表头的矩形区域,因为Table View整体已经下沉，此时的 Header View相对位置实际应该在其上方。
        headerView.frame = CGRect(x: 0, y: offsetY, width: scrollView.bounds.width, height: -offsetY)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = String(describing: DetailCell.self)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! DetailCell

        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Name"
            cell.valueLabel.text = weapon.name
        case 1:
            cell.keyLabel.text = "Type"
            cell.valueLabel.text = weapon.type
        case 2:
            cell.keyLabel.text = "Origin"
            cell.valueLabel.text = weapon.origin
        case 3:
            cell.keyLabel.text = "Bullet"
            cell.valueLabel.text = weapon.bullet.description
        case 4:
            cell.keyLabel.text = "Muzzle Veolcity"
            cell.valueLabel.text = weapon.mv.description
        default:
            cell.keyLabel.isHidden = true
            cell.valueLabel.text = weapon.text
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var ratingBtn: UIButton!
    
    @IBAction func backToDetail(segue: UIStoryboardSegue)  {
        if let rating = segue.identifier {
            weapon.rating = rating
            ratingBtn.setTitle("打分：\(weapon.rating)星", for: .normal)
        }
    }

}
