

import SwiftUI
import PlaygroundSupport
import UserModule

public struct MainView: View {
    @State public var showingSimulation = false
    @State public var numHealthyNoMask = 0
    @State public var numHealthyMask = 0
    @State public var numInfectedNoMask = 0
    @State public var numInfectedMask = 0
    
    public init(){}
    public var body: some View {
        if showingSimulation {
            SimulationView(numHealthyNoMask: $numHealthyNoMask, numHealthyMask: $numHealthyMask, numInfectedNoMask: $numInfectedNoMask, numInfectedMask: $numInfectedMask, showingSimulation: $showingSimulation)
        }else{
            SetupView(showingSimulation: $showingSimulation, numHealthyNoMask: $numHealthyNoMask, numHealthyMask: $numHealthyMask, numInfectedNoMask: $numInfectedNoMask, numInfectedMask: $numInfectedMask)
        }
    }
}

PlaygroundPage.current.setLiveView(MainView())
//PlaygroundPage.current.liveView = MainView()
