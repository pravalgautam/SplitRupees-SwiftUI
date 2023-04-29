//
//  ContentView.swift
//  Cash Split
//
//  Created by Praval Gautam on 29/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var  spendAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    
    let tipPercentages = [10, 15, 20, 25, 0 ]
    @FocusState private var amountisfocused: Bool
    
    
    var totalPerPerson :Double{
        let tipselection = Double(tipPercentage)
        let peopleCount = Double(numberOfPeople+2)
        let tipValue = spendAmount / 100 * tipselection
        let  total =  spendAmount+tipValue
        let  amountperperson = total / peopleCount
        
        return amountperperson
    }
    
    var body: some View {
        NavigationView{
            Form{
                
                Section{

                    TextField("Amount", value: $spendAmount,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountisfocused)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
            header: {
                    Text("How much you spend?")
                }
                
                
                
                
                
                Section {
                                Picker("Tip percentage", selection: $tipPercentage) {
                                    ForEach(tipPercentages, id: \.self) {
                                        Text($0, format: .percent)
                                    }
                                }
                    
                                .pickerStyle(.segmented)
                    
                            } header: {
                                Text("How much tip do you want to leave?")
                            }
                            
                
                
                
                Section{
                    Text(totalPerPerson,format: .currency(code: "INR"))
                }
                
            }
            .navigationTitle("Split Your Money")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountisfocused = false
                    }
                    
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
