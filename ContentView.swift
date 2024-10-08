import SwiftUI

// メインビュー
struct ContentView: View {
    // タスクリストを保持する配列
    @State private var tasks = [String]()
    // 新しいタスクを入力するための変数
    @State private var newTask = ""

    var body: some View {
        NavigationView {
            VStack {
                // テキストフィールドと追加ボタン
                HStack {
                    TextField("新しいタスク", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: addTask) {
                        Text("追加")
                    }
                }.padding()

                // タスクリストを表示するリストビュー
                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: deleteTask)
                }
            }
            .navigationTitle("ToDoリスト")
        }
    }

    // タスクを追加するメソッド
    func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
    }

    // タスクを削除するメソッド
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

// プレビュー用コード
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
