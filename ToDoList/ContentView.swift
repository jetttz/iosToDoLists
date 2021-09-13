import SwiftUI


struct Task: Identifiable{
    let id = UUID()
    let Item: String
}

struct ContentView: View{
    
    @State private var TempTask: String = ""
    @State private var tasks: [Task] = []
    
    func AddNewTask() {
        if (!TempTask.isEmpty){
        tasks.append(Task(Item: TempTask))
        TempTask.removeAll()
        }
        
    }
    
    func move(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet)  {
        tasks.remove(atOffsets: offsets)
    }
    
    var searchBar: some View{
        HStack{
            TextField("Enter a new ToDo", text: $TempTask)
            Button(action: AddNewTask , label: {Text("Add")} )
        }
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List{
                    
                    
                    ForEach(tasks) {
                        task in Text(task.Item)
                    }.onMove(perform: move).onDelete(perform: delete)
                    
                }.navigationTitle("Tasks").navigationBarItems(trailing: EditButton())
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    

}



