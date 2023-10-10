//
//  Testexmp.swift
//  Cargarage
//
//  Created by MACBOOK PRO on 18/9/2023.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
 struct Testexmp: View {
   @ObservedObject var userLocation = GarageViewModel()
 @State  var searchText = ""
    // @State  var garage = [Garage]()
     @ObservedObject var viewModel = TaskViewModel()

 var body: some View {
     VStack {
         List(userLocation.garage, id: \.id) { task in
                    Text(task.name)
                 Text(task.specialty)
             Text(task.address ?? "nill")
             Text(task.phone ?? "nill")
             Text(task.openingTime ?? "00:00")
             Text(task.closingTime ?? "12:00")
             Text((String(task.coordinate.latitude)))
             Text(String(task.coordinate.longitude))
             Image(task.image ?? "user")
                 .resizable()
                 .scaledToFill()
                 .frame(width: 70, height: 70)
            
            
                 }
                 .onAppear {
                     userLocation.fetchDataGarage()
                 }
     }
 }
     func fetchData() {
         
         Firestore.firestore().collection("garage").addSnapshotListener { (querySnapshot, error) in
             guard let documents = querySnapshot?.documents else {
                 print("Error fetching documents: \(error!)")
                 return
             }
             
             self.userLocation.garage = documents.compactMap { document in
                 do {
                     let task = try document.data(as: Garage.self)
                     return task
                 } catch {
                     print(error)
                     return nil
                 }
             }
             
             
         }
     }
     
     
 }
 
 struct Testexmp_Previews: PreviewProvider {
 static var previews: some View {
 Testexmp()
 }
 }
 
struct Task : Decodable {
    //var id: String
    @DocumentID var id: String?
    var title: String
    //var completed: Bool
    enum CodingKeys: String, CodingKey {
           //case id
           case title
           //case completed
       }
    //self.completed = completed
        
}

class TaskViewModel: ObservableObject {
    private var db = Firestore.firestore()

    @Published var tasks = [Task]()

    func fetchData() {
        db.collection("tasks").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }

            self.tasks = documents.compactMap { document in
                do {
                    let task = try document.data(as: Task.self)
                    return task
                } catch {
                    print(error)
                    return nil
                }
            }
        }
    }
}
