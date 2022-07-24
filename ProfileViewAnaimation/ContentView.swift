//
//  ContentView.swift
//  ProfileViewAnaimation
//
//  Created by Adarsh Shukla on 23/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showExapandedView: Bool = false
    @Namespace private var profileNamespace
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
                .edgesIgnoringSafeArea(.all)
            VStack {
                if showExapandedView {
                    expandedProfileView
                } else {
                    collapsedProfileView
                }
                ScrollView {
                    VideoList
                }
                .padding(.top, 40)
            }
        }
    }
    
    private var VideoList: some View {
        ForEach(0..<10) { _ in
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.black.opacity(0.5))
                .frame(width: 400, height: 300, alignment: .center)
                .overlay(
                    Image(systemName: "play.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 45, height: 45, alignment: .center)
                )
        }
    }
    
    private var collapsedProfileView: some View {
        HStack {
            Image("Adarsh_Shukla")
                .resizable()
                .matchedGeometryEffect(id: "Image", in: profileNamespace)
                .frame(width: 60, height: 60)
                .cornerRadius(40)
            
            VStack(alignment: .leading) {
                Text("Adarsh Shukla")
                    .font(.custom("Arial", size: 23))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "Name", in: profileNamespace)
                
                Text("iOS Developer")
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .matchedGeometryEffect(id: "Development", in: profileNamespace)
            }
            Spacer()
        }
        .padding(.horizontal)
        .onTapGesture {
            withAnimation(.spring()) {
                showExapandedView.toggle()
            }
        }
    }
    
    private var expandedProfileView: some View {
        VStack(spacing: 5) {
            Image("Adarsh_Shukla")
                .resizable()
                .matchedGeometryEffect(id: "Image", in: profileNamespace)
                .frame(width: 150, height: 150)
                .cornerRadius(75)
            
            Text("Adarsh Shukla")
                .foregroundColor(.white)
                .font(.custom("Arial", size: 27))
                .fontWeight(.heavy)
                .matchedGeometryEffect(id: "Name", in: profileNamespace)
            
            Text("iOS Developer")
                .font(.custom("Arial", size: 18))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.bottom, 25)
                .matchedGeometryEffect(id: "Development", in: profileNamespace)
            
            Text("I went full time iOS Developer in January of 2022. I am focused on data structures and algorithms. I am also interested in competitive Programming.")
                .foregroundColor(.white.opacity(0.8))
                .font(.custom("Arial", size: 20))
                .padding(.horizontal)
                .padding(.horizontal)
        }
        .onTapGesture {
            withAnimation(Animation.easeInOut(duration: 1)) {
                showExapandedView.toggle()
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
