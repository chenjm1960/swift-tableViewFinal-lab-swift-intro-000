//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    let planetCellIdentifier:String = "PlanetCell"
    var planets:[Planet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell", for: indexPath) as! PlanetTableViewCell
        
        cell.planetNameLabel.text = planets[indexPath.row].name
        cell.numberOfMoonsLabel.text = "\(planets[indexPath.row].numberOfMoons)"
        cell.numberOfDaysFullOrbitLabel.text = "\(planets[indexPath.row].fullOrbit)"
        cell.numberOfFacts.text = "\(planets[indexPath.row].facts.count) Facts"
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier != "goToFactCell" {return}
        if let dest = segue.destination as? FactTableViewController {
            let indexPath = tableView.indexPathForSelectedRow
            dest.planet = planets[(indexPath! as NSIndexPath).row]
        }
    }
    
    
    
    
    func generatePlanetInfo() {
        
        let earth = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.","Earth has a powerful magnetic field.","Earth was once believed to be the center of the universe."])
        let mars = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.","Mars is home to the tallest mountain in the solar system.","Pieces of Mars have fallen to Earth."])
        planets.append(earth)
        planets.append(mars)
        
    }
    
    
}
