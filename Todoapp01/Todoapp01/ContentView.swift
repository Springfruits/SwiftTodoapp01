import SwiftUI

struct ContentView: View {
    @State public var tasklist = [Task]()
    @State var TaskTitle: String = ""
    
    var body: some View {
        VStack {
            List{
                ForEach(tasklist) { task in
                    Text(task.title)
                }
                .onDelete(perform: listRemove)
            }
            
            TextField("make your task", text: $TaskTitle)
            HStack{
                Spacer()
                Button(action: {
                    let task = Task(title: TaskTitle)
                    if TaskTitle != "" {
                        tasklist.append(task)
                        TaskTitle = ""
                    }
                    TaskTitle = ""
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                }
            }
        }
        .padding()
    }
    func listRemove(offsets: IndexSet){
        tasklist.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView()
}
