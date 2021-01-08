//
//  ChooseCurrencyTableViewController.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit

class SelectCurrecncyController: UITableViewController {

    var currencyList = [Currency]()
    let currencyCurrencySymbol = NSLocale.defaultCurrency

    override func viewDidLoad() {
        super.viewDidLoad()

        let currecy = Currency()
        currencyList = currecy.loadEveryCountryWithCurrency()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)
        cell.backgroundColor = UIColor.white

        let currencyItem = currencyList[indexPath.row]

        cell.detailTextLabel?.text = currencyItem.currencySymbol!

        if currencyCurrencySymbol == currencyItem.currencySymbol {
            cell.textLabel?.text = currencyItem.currencyName! + " ✓"
            cell.backgroundColor = UIColor.myAppLightGreen
        } else {
            cell.textLabel?.text = currencyItem.currencyName
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currencyItem = currencyList[indexPath.row]

        if let symbol = currencyItem.currencySymbol {
            NSLocale.setCurrencyCodeDefault(symbol: symbol)
        }

        navigationController?.popViewController(animated: true)
    }

}

