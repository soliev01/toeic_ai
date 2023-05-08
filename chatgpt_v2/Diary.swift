import Foundation

struct Diary{
    var uploaded_date : String
    var today_date : String
    var place: String    //지도 api 사용
    var text: String
    
//    init(uploaded: Date, today: Date, place: String, text:String) {
//        self.uploaded_date = date_to_string(date: uploaded)
//        self.today_date = date_to_string(date: today)
//        self.place = place
//        self.text = text
//    }
}

func date_to_string(date : Date) ->  String{
    let dataformatter = DateFormatter()
    return dataformatter.string(from: date)
}
