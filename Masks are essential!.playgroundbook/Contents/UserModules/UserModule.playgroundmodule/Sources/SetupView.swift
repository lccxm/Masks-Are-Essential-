import SwiftUI

public struct SetupView: View {
    @Binding public var numHealthyNoMask: Int
    @Binding public var numHealthyMask: Int
    @Binding public var numInfectedNoMask: Int
    @Binding public var numInfectedMask: Int
    @Binding public var showingSimulation: Bool
    
    
    public init(showingSimulation: Binding<Bool>, numHealthyNoMask: Binding<Int>, numHealthyMask: Binding<Int>, numInfectedNoMask: Binding<Int>, numInfectedMask: Binding<Int>){
        self._showingSimulation = showingSimulation
        self._numHealthyNoMask = numHealthyNoMask
        self._numHealthyMask = numHealthyMask
        self._numInfectedNoMask = numInfectedNoMask
        self._numInfectedMask = numInfectedMask
    }
    public var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .ignoresSafeArea()
                .foregroundColor(.black)
            VStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.black)
                    .opacity(0)
                    .frame(width: 700, height: 250, alignment: .center)
                    .overlay(VStack {
                        Text("Masks are very important, but it isn't uncommon to hear fake news about them. In this simulation we can compare the differences in contamination of people with and without masks in a visual and simple way.")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 70)
                            .padding(.top, 30)
                        
                        
                        Text("According to research, the chance of transmitting COVID-19 varies depending on whether people wear masks or not.")
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                            .font(.title)
                            .multilineTextAlignment(.center)
                    })
                
                    VStack {
                        Text("Science says that:")
                            .padding(.vertical, 10)
                        Text("Both healthy and infected without masks the chances are very high!")
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .multilineTextAlignment(.center)
                        Text("Only healthy person wearing a mask the chance still high!")
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .multilineTextAlignment(.center)
                        
                        Text("Only person with COVID-19 wearing a mask the chance is medium.")
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .multilineTextAlignment(.center)
                        
                        Text("Both healthy and infected wearing masks the chance is low.")
                            .padding(.horizontal)
                            .padding(.vertical,10)
                            .multilineTextAlignment(.center)
                        
                        Text("In the best scenario when they both stay home the chance is virtually none.")
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                            .multilineTextAlignment(.center)
                        
                    }
                
                .foregroundColor(.white)
                .font(.title2)
                
                
                
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: 700, height: 250, alignment: .center)
                    .overlay(VStack{
                        HStack {
                            Text("Number of healthy people without mask (white):  \(numHealthyNoMask)")
                                .font(.title2)
                                .foregroundColor(.black)
                            Spacer()
                            Button(action: {
                                if numHealthyNoMask > 0{
                                    numHealthyNoMask -= 1
                                }
                            }, label: {
                                Text("-")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numHealthyNoMask += 1
                            }, label: {
                                Text("+")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                if numHealthyNoMask >= 5 {
                                    numHealthyNoMask -= 5
                                }
                            }, label: {
                                Text("- 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numHealthyNoMask += 5
                            }, label: {
                                Text("+ 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                        }
                        .padding(.vertical, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                        HStack {
                            Text("Number of healthy people with mask (gray): \(numHealthyMask)      ")
                                .foregroundColor(.black)
                                .font(.title2)
                            Spacer()
                            Button(action: {
                                if numHealthyMask > 0{
                                    numHealthyMask -= 1
                                }
                            }, label: {
                                Text("-")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numHealthyMask += 1
                            }, label: {
                                Text("+")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                if numHealthyMask >= 5 {
                                    numHealthyMask -= 5
                                }
                            }, label: {
                                Text("- 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numHealthyMask += 5
                            }, label: {
                                Text("+ 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                        }
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                        HStack {
                            Text("Number of infected people without mask (red): \(numInfectedNoMask)")
                                .foregroundColor(.black)
                                .font(.title2)
                            Spacer()
                            Button(action: {
                                if numInfectedNoMask > 0{
                                    numInfectedNoMask -= 1
                                }
                            }, label: {
                                Text("-")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numInfectedNoMask += 1
                            }, label: {
                                Text("+")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                if numInfectedNoMask >= 5 {
                                    numInfectedNoMask -= 5
                                }
                            }, label: {
                                Text("- 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numInfectedNoMask += 5
                            }, label: {
                                Text("+ 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                        }
                        .padding(.vertical, 10)
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                        HStack {
                            Text("Number of infected people with mask (purple): \(numInfectedMask)")
                                .foregroundColor(.black)
                                .font(.title2)
                            Spacer()
                            Button(action: {
                                if numInfectedMask > 0{
                                    numInfectedMask -= 1
                                }
                            }, label: {
                                Text("-")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numInfectedMask += 1
                            }, label: {
                                Text("+")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                if numInfectedMask >= 5 {
                                    numInfectedMask -= 5
                                }
                            }, label: {
                                Text("- 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                            Button(action: {
                                numInfectedMask += 5
                            }, label: {
                                Text("+ 5")
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 14.0)
                                    .padding(.vertical, 5.0)
                                    .background(Color.blue)
                                    .cornerRadius(40)
                                    .foregroundColor(.white)
                                    .font(.title2)
                            })
                        }
                        .padding(.leading, 40)
                        .padding(.trailing, 40)
                    })
                
                Text("Total: \(numHealthyNoMask + numHealthyMask + numInfectedNoMask + numInfectedMask)")
                    .foregroundColor(.white)
                    .padding()
                    .font(.title)
                Button(action: {
                    if numHealthyMask > 0 || numHealthyNoMask > 0 {
                        if numInfectedMask > 0 || numInfectedNoMask > 0 {
                            showingSimulation = true
                        }
                    }
                }, label: {
                    Text("Start New Simulation")
                        .font(.title)
                        .padding(.horizontal, 14.0)
                        .padding(.vertical, 5.0)
                        .background(Color.blue)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                })
                .padding(.vertical, 20)
            }
        }
    }
}


