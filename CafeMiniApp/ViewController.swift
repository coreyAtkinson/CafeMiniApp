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
   
    @IBOutlet weak var passwordOutlet: UITextField!
    @IBOutlet weak var usernameOutlet: UITextField!
    @IBOutlet weak var addItemOutlet: UIButton!
    @IBOutlet weak var new2Outlet: UITextField!
    @IBOutlet weak var new1Outlet: UITextField!
    @IBOutlet weak var addOutlet: UILabel!
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
       
        
        addOutlet.isEnabled = false
        addOutlet.isHidden = true
        new1Outlet.isEnabled = false
        new1Outlet.isHidden = true
        new2Outlet.isEnabled = false
        new2Outlet.isHidden = true
        addItemOutlet.isHidden = true
        addItemOutlet.isEnabled = false
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
        
        
       
        
        
    }
    
   
        
    
    
    

    @IBAction func eAction(_ sender: UIButton) {
        if usernameOutlet.text == "CoreyA" && passwordOutlet.text == "Ratlord22!"
        {
            addOutlet.isEnabled = true
            addOutlet.isHidden = false
            new1Outlet.isEnabled = true
            new1Outlet.isHidden = false
            new2Outlet.isEnabled = true
            new2Outlet.isHidden = false
            addItemOutlet.isHidden = false
            addItemOutlet.isEnabled = true
        }
        
    }
    
    @IBAction func newAction(_ sender: UIButton) {
        
        if new1Outlet.text == "" || new2Outlet.text == ""
        {
            errorOutlet.text = "Invalad Imput"
        }
        if isStringAnInt(string: new2Outlet.text!)
        {
          var a = Double(new2Outlet.text!)
            prices.append(a!)
            items.append(new1Outlet.text!)
            
        }
        else
        {
            errorOutlet.text = "Invalad Imput"
        }
        
    }
    
    func isStringAnInt(string: String) -> Bool {
        return Int(string) != nil
    }
}




