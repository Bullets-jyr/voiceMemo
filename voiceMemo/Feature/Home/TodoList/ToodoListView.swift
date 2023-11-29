//
//  ToodoListView.swift
//  voiceMemo
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject private var pathModel: PathModel
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    var body: some View {
        ZStack {
            // 투두 셀 리스트
            VStack {
                if !todoListViewModel.todos.isEmpty {
                    CustomNavigationBar(
                        isDisplayLeftBtn: false,
                        rightBtnAction: {
                            todoListViewModel.navigationRightBtnTapped()
                        },
                        rightBtnType: todoListViewModel.navigationBarRightBtnMode
                    )
                } else {
                    Spacer()
                        .frame(height: 30)
                }
                
//                titleView()
                TitleView()
            }
        }
    }
    
    // Property
//    var titleView: some View {
//        Text("Property Title")
//    }
    
    // Method
//    func titleView() -> some View {
//        Text("Method Title")
//    }
}

// MARK: - TodoList 타이틀 뷰
private struct TitleView: View {
    @EnvironmentObject private var todoListViewModel: TodoListViewModel
    
    fileprivate var body: some View {
      HStack {
        if todoListViewModel.todos.isEmpty {
          Text("To do list를\n추가해 보세요.")
        } else {
          Text("To do list \(todoListViewModel.todos.count)개가\n있습니다.")
        }
        
        Spacer()
      }
      .font(.system(size: 30, weight: .bold))
      .padding(.leading, 20)
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
            .environmentObject(PathModel())
            .environmentObject(TodoListViewModel())
    }
}
