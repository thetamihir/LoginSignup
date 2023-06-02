//
//  HomeView.swift
//  LoginSignup
//
//  Created by Mihir Shingala on 26/05/23.
//

import SwiftUI
import RxSwift

struct HomeView: View {
     @StateObject var vm = HomeViewModel()
    // @Binding var currentView: ContentView
    
    var body: some View {
       Text("welcome to Home Screen")
         .navigationBarBackButtonHidden()
    }
}


//class HomeViewModel : ObservableObject {
//    
//    let bag = DisposeBag()
//    
//    @Published var name : String = ""
//    @Published var isclick : Bool = false
//    
//    
//    var namePublisher = PublishSubject<String>()
//    var boolPublisher = PublishSubject<Bool>()
//    
//    init(){
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
//            self.namePublisher.on(.next("mihir"))
//            self.boolPublisher.on(.next(true))
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
//            self.namePublisher.on(.next("is"))
//            self.boolPublisher.on(.next(false))
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 6){
//            self.namePublisher.on(.next("learning"))
////            self.boolPublisher.on(.next(true))
//            self.boolPublisher.on(.completed)
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 8){
//            self.namePublisher.on(.next("RxSwift"))
//            self.boolPublisher.on(.next(true))
//        }
//        
//        
//        namePublisher
//            .subscribe { data in
//            self.name = data
//        } onError: { error in
//            print(error)
//        } onCompleted: {
//            print("complate")
//        }.disposed(by: bag)
//        
//        
//        
//        boolPublisher.subscribe { bool in
//            self.isclick = bool
//        } onError: { error in
//            print(error)
//        } onCompleted: {
//            print("complate")
//        }.disposed(by: bag)
//
//    }
//}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
       
    }
}
