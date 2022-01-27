//
//  ContentView.swift
//  BLE4
//
//  Created by Jianzhi Guo on 2022-01-26.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @ObservedObject var locationManager=LocationManager.shared
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        Group{
            if locationManager.userLocation==nil{
                LocationRequestView()
            }else{
                ZStack{
                    
                    Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow)).ignoresSafeArea()
                   
                }
            }
       
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
