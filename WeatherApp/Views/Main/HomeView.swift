//
//  HomeView.swift
//  WeatherApp
//
//  Created by Тимофей Кубышин on 2023-04-18.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    
    var body: some View {
        NavigationView {
            ZStack {
                
                // MARK: Backgorund Color
                
                Color.background
                    .ignoresSafeArea()
                
                // MARK: Background Image
                
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                // MARK: House Image
                
                Image("House")
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10) {
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack {
                        Text(attributedString)
                        
                        Text("H:24˚   L:18˚")
                            .font(.title2.weight(.semibold))
                    }
                    
                    Spacer()
                }
                .padding(.top, 51)
                
                // MARK: Bottom Sheet
                
                BottomSheetView(position: $bottomSheetPosition) {
                    //Text(bottomSheetPosition.rawValue.formatted())
                } content: {
                     ForecastView()
                }
                
                // MARK: Tab Bar
                
                TabBar(action: {
                    bottomSheetPosition = .top
                })
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    private var attributedString: AttributedString {
        var string = AttributedString("19˚" + "\n " + "Mostly Clear")
        
        if let temp = string.range(of: "19˚") {
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let pipe = string.range(of: " | ") {
            string[pipe].font = .title3.weight(.semibold)
            string[pipe].foregroundColor = .secondary
        }
        
        if let weather = string.range(of: "Mostly Clear") {
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
