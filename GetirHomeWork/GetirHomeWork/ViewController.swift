//
//  ViewController.swift
//  GetirHomeWork
//
//  Created by Doğuş  Kaynak on 2.05.2021.
//

import UIKit
import MapKit
import CoreLocation

protocol LocationDelegateProtocol: AnyObject {
    func sendLocationUserVc(userLocation: String)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Rockwell",size:22)
        label.frame = CGRect(x: 0, y: 0, width: 321, height: 40)
        label.textAlignment = .center
        return label
    }()
    
    let locationManager = CLLocationManager()
    let mapZoom: Double = 1000.0
    var lastLocation: CLLocation?
    weak var delegate: LocationDelegateProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationServices()
        prepareNavigationBar()
    }
    
    @IBAction func addUserLocation() {
        if delegate != nil && label.text != nil {
            guard let address = label.text else { return }
            delegate?.sendLocationUserVc(userLocation: address)
            navigationController?.popViewController(animated: true)
        }
    }
    
    private func prepareNavigationBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        navigationItem.titleView = label
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func showUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: mapZoom, longitudinalMeters: mapZoom)
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        }
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            authorizedWhenInUse()
        case .denied:
            showAlert()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            showAlert()
            break
        case .authorizedAlways:
            break
        default:
            break
        }
    }
    
    private func authorizedWhenInUse() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManager.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    private func getCenterLocation(mapView:MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Uyarı", message: "Adres seçmek için konum izni vermeniz gerekmektedir.", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Tamam", style: .default) { (action) in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                  UIApplication.shared.canOpenURL(settingsUrl) else { return }
            UIApplication.shared.open(settingsUrl, completionHandler: nil)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        guard let lastLocation = lastLocation else { return }
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        geoCoder.reverseGeocodeLocation(center) { (placemarks, error) in
            if let error = error {
                print(error)
            }
            guard let placemark = placemarks?.first else {
                return
            }
            
            let streetNumber = placemark.subThoroughfare ?? ""
            let streetName = placemark.thoroughfare ?? ""
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.label.text = "\(streetNumber) - \(streetName)"
            }
        }
    }
}
