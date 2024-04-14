//
//  ContentView.swift
//  BirthDays
//
//  Created by Robinson Thairu on 14/04/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: \Friend.birthDate) private var friends:[Friend]
    @Environment(\.modelContext) private var context
    
    @State private var newName = ""
    @State private var newDate = Date.now
    
    var body: some View {
        NavigationStack {
            List(friends) { Friend in
                HStack {
                    if Friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    
                    Text(Friend.name)
                        .bold(Friend.isBirthdayToday)
                    Spacer()
                    Text(Friend.birthDate, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    
                    Text("New Birthday")
                        .font(.title3)
                    
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        TextField("Name", text: $newName)
                            .textFieldStyle(.roundedBorder)
                            .padding(.horizontal, 12)
                    }
                    
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthDate: newDate)
                        context.insert(newFriend)
                        
                        newName = ""
                        newDate = .now
                    }
                    .bold()
                    .buttonStyle(.bordered)
                    
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
