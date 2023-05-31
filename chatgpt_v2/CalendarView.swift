
//  CalendarView.swift
//  chatgpt_v2
//
//  Created by 신영재 on 2023/05/17.
//
// CalendarView.swift

import SwiftUI
struct CalendarView: View {
    @State private var selectedDate: Date? = nil
    @State private var showDiaryView = false
    
    var body: some View {
        VStack {
            VStack {
                Spacer()
                CalendarModuleView(selectedDate: $selectedDate)
    //                        .onChange(of: selectedDate, perform: { newDate in
    //                            handleSelectedDate(newDate)
    //                        })
                Spacer()
            }
            VStack {
                Spacer()
                DiaryStatus()
                Spacer()
            }
        }
        .navigationBarTitle(Text("Calendar"), displayMode: .inline)
    }
    
//    func handleSelectedDate(_ newDate: Date?) {
//        // 여기에서 선택된 날짜에 대한 작업을 수행합니다.
//        // 예를 들어, 데이터베이스에서 해당 날짜의 다이어리를 가져오거나 뷰를 업데이트하는 등의 작업을 수행할 수 있습니다.
//    }
//
    func DiaryStatus() -> some View {
        // 데이터베이스에 해당 날짜의 diary가 있으면 diary를 뷰에 출력
        // 데이터베이스에 없으면 DiaryView() navigationLink 뷰에 출력
        return NavigationLink(destination: DiaryView(txt: "", selectedDate: $selectedDate))
        {
            Image("image_diary")
                .resizable()
                .frame(width: 100,height: 100)
        }
    }
}

struct CalendarView_Previes: PreviewProvider{
    static var previews: some View {
        CalendarView()
    }
}
