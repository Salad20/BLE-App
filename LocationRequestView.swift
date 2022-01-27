//
//  LocationRequestView.swift
//  BLE4
//
//  Created by Jianzhi Guo on 2022-01-26.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        ZStack{
            Color(.systemCyan).ignoresSafeArea()
            
            VStack{
                Spacer()
                Image(systemName:"bonjour").resizable().scaledToFit().frame(width:200,height:200).padding(.bottom,32)
                Text("Start Sharing Location").font(.system(size:28,weight:.semibold)).multilineTextAlignment(.center).padding()
                Spacer()
                VStack{
                    Button{
                        LocationManager.shared.requestLocation()
                    }label:{
                        Text("Allow location").padding().font(.headline).foregroundColor(Color(.systemCyan))
                    }
                    .frame(width:UIScreen.main.bounds.width).padding(.horizontal,-32).background(Color.white).clipShape(Capsule()).padding()
                    Button{
                        print("Dismiss")}label:{
                    Text("Maybe later").padding().font(.headline).foregroundColor(.white)
                    
                        }
            }
                
                .padding(.bottom, 32)
        }
            .foregroundColor(.white)
        
    }
    }

struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
}
