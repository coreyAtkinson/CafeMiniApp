//
//  ViewController.swift
//  CafeMiniApp
//
//  Created by COREY ATKINSON on 9/12/23.
//

import UIKit

class ViewController: UIViewController {
    var pain = 0.0
    var cart = [String :Double]()
    var total = 0.0
    var items : [String] = ["Hot Dog","Apple","Banana","Tomato","Ham"]
    var prices : [Double] = [1.82, 1.15,1.12,5.01,2.01]
   
    @IBOutlet weak var priceOutlet: UILabel!
    @IBOutlet weak var cart2Outlet: UITextView!
    @IBOutlet weak var errorOutlet: UILabel!
    @IBOutlet weak var quantityOutlet: UITextField!
    @IBOutlet weak var whatOutlet: UITextField!
    @IBOutlet weak var cartOutlet: UILabel!
    @IBOutlet weak var menuOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
       while i < items.count {
           menuOutlet.text = "\(menuOutlet.text!) \(items[i])        $\(prices[i]) \n"
           i = i + 1
           cart2Outlet.isUserInteractionEnabled = true
        }
       
    }
    
    @IBAction func cartAction(_ sender: UIButton) {
        if whatOutlet.text == "" || quantityOutlet.text == ""
        {
            errorOutlet.text = "Error: Invalad imput"
        
        }
      else  if items.contains(whatOutlet.text!)
        {
          errorOutlet.text = ""
          var amount = 0
          var i = 0
          var index = -1
          while i < items.count
          {
              if(items[i] == whatOutlet.text!)
              {
                  index = i
                  break
              }
              i = i + 1
          }
          if isStringAnInt(string: quantityOutlet.text!)
          {
              amount = Int(quantityOutlet.text!) ?? 1
              cart["\(whatOutlet.text!)"] = prices[index] * Double(amount)
          }
          else
          {
              errorOutlet.text = "Error: Invalad imput"
          }
          var b = cart2Outlet.text!
          for (k,_) in cart
          {
            var a = "\(k)"
              print(a)
             
              cart2Outlet.text = "\(b) \(a) \n"
          }
          
          var a = 0.0
          for (_, v) in cart
          {
              var i = 0
              var index = -1
              while i < items.count
              {
                  if(items[i] == whatOutlet.text!)
                  {
                      index = i
                      break
                  }
                  i = i + 1
              }
              a = a + prices[i] * Double(v)
              priceOutlet .text = "$\(a)"
          }
            
          
          
      
        }
        
        
        func isStringAnInt(string: String) -> Bool {
            return Int(string) != nil
        }
        
        
    }
    
   
        
    
    
    

}

