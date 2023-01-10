//
//  ViewController.swift
//  еуые
//
//  Created by Mac on 12/12/2022.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var addButton = UIButton ()
    
    var menu:[BurgerMenu] = [BurgerMenu(image1: "2", title: "Бургер", cost: 100, totalcost: 100), BurgerMenu(image1: "1", title: "Двоиной гамбургер", cost: 140, totalcost: 140), BurgerMenu(image1: "3", title: "Гамбургер с сыром", cost: 140, totalcost: 140)]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        //        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "burger_cell")
        view.addSubview(addButton)
        addButton.layer.cornerRadius = 80 / 2
        addButton.setTitle("Корзина", for: .normal)
        addButton.backgroundColor = .blue
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    @objc func addButtonTap() {
        let secondVc = storyboard?.instantiateViewController(withIdentifier: "secondVc")as! ViewController2
        //        secondVc.info = "общая цена - \(menu)"
        self.navigationController?.pushViewController(secondVc, animated: true)
        tableView.reloadData()
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "burger_cell", for: indexPath) as! Burger
        cell.Imageburger.image = UIImage(named: menu[indexPath.row].image1)
        cell.titleBurger.text = menu[indexPath.row].title
        cell.burgercost.text = "\(menu[indexPath.row].cost) сом"
        return cell
    }
}
extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        burgerarray.append(menu[indexPath.row])
        
                          
        print(burgerarray.count)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

class ProductCell:UITableViewCell{
    
    @IBOutlet weak var imageViewBurger: UIImageView!
    
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    @IBOutlet weak var totalCost: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
class BurgerMenu{
    var image1:String
    var title:String
    var cost:Int
    var totalcost:Int
    init(image1: String, title: String, cost: Int, totalcost:Int) {
        self.image1 = image1
        self.title = title
        self.cost = cost
        self.totalcost = totalcost
    }
}
class Burger:UITableViewCell {
   
    @IBOutlet weak var Imageburger: UIImageView!
    
    @IBOutlet weak var titleBurger: UILabel!
    
    @IBOutlet weak var burgercost: UILabel!
    
    
    
    }
var burgerarray = [BurgerMenu] ()

@IBOutlet weak var tableViewBurgers: UITableView!
    
    @IBOutlet weak var totalcost: UILabel!
    
//    var info = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableViewBurgers.delegate = self
        tableViewBurgers.dataSource = self
//        tableViewBurgers.register(ProductCell.self, forCellReuseIdentifier: "burger_cell")
//        totalcost.text = info
    }
    override func viewWillAppear(_ animated: Bool) {
        tableViewBurgers.reloadData()
    }

}
extension ViewController2:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    }

extension ViewController2:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return burgerarray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product_cell", for: indexPath) as! ProductCell
        cell.imageViewBurger.image = UIImage(named: burgerarray[indexPath.row].image1)
        cell.title.text = burgerarray[indexPath.row].title
        cell.cost.text = "\(burgerarray[indexPath.row].cost)coм"
        cell.totalCost.text = "\(burgerarray[indexPath.row].cost + burgerarray[indexPath.row].cost)"
      
//            
//        }
        return cell
        
    }
}
