//
//  ContentView.swift
//  SolveHunger
//
//  Created by Varsha Narasiman on 10/16/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("bg").resizable().ignoresSafeArea().scaledToFill()
        VStack(alignment:.center) {
            Spacer().frame(height: 100)
            ZStack {
                Image("hands").resizable().frame(width: 180.0, height: 180.0, alignment: .center)
                Image("plate (1)").resizable().frame(width: 100.0, height: 100.0, alignment: .center)
            }
            Text("SOLVE HUNGER").font(.title).bold()
            Spacer().frame(height:10.0)
            Text("Make the World a Better Place").font(.title3)
            Spacer().frame(height: 200)
            NavigationLink(destination: LoginScreen(), label: { Text("Continue").fontWeight(.heavy)
                    .padding().frame(width: 250.0, height: 45.0, alignment: .center).background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(80.0)
                })
            }
        }
    }
}
    
    struct LoginScreen: View {
        @State private var email = ""
        @State private var password = ""
        
        var body: some View {
            VStack() {
                Text("SOLVE HUNGER")
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding([.top, .bottom], 40)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                ZStack {
                    Image("hands").resizable().frame(width: 180.0, height: 180.0, alignment: .center)
                    Image("plate (1)").resizable().frame(width: 110.0, height: 110.0, alignment: .center)
                }.clipShape(Circle())
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 50)
                Spacer().frame(height: 80)
                VStack(alignment: .leading, spacing: 15) {
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Spacer().frame(height: 50)
                NavigationLink(destination: MapScreen(), label: { Text("Sign In").fontWeight(.heavy)
                        .padding().frame(width: 250.0, height: 45.0, alignment: .center).background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(80.0)
                    .navigationBarBackButtonHidden(true)
                     .navigationBarHidden(true)
                    })
                
                Spacer()
                HStack(spacing: 0) {
                    NavigationLink(destination: ScreenTwo(), label: { Text("Don't have an account? Sign Up").fontWeight(.heavy)
                            .padding().frame(width: 350.0, height: 45.0, alignment: .center)
                        .foregroundColor(Color.white)
                        .cornerRadius(80.0)
                        .navigationBarBackButtonHidden(true)
                         .navigationBarHidden(true)
                        })
                }
                
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all))
            
        }
    }
    
    struct DonorRegisterScreen: View {
        
        @State private var go_to_next = false
        @State private var firstName = ""
        @State private var lastName = ""
        @State private var email = ""
        @State private var password = ""
        @State private var cpwd = ""
        @State var userModels: [UserModel] = []
        
        var body: some View {
            VStack() {
                ZStack {
                    Image("hands").resizable().frame(width: 180.0, height: 180.0, alignment: .center)
                    Image("plate (1)").resizable().frame(width: 110.0, height: 110.0, alignment: .center)
                }.clipShape(Circle())
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 20)
                Text("Welcome To SOLVE HUNGER!") .multilineTextAlignment(.center)
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding()
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Spacer().frame(height: 50)
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        TextField("First name", text: self.$firstName)
                            .padding()
                            .background(Color.themeTextField)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            .disableAutocorrection(true)
                        
                        TextField("Last name", text: self.$lastName)
                            .padding()
                            .background(Color.themeTextField)
                            .cornerRadius(20.0)
                            .shadow(radius: 10.0, x: 20, y: 10)
                            .disableAutocorrection(true)
                        
                    }
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .disableAutocorrection(true)
                    
                    SecureField("Confirm Password", text: self.$cpwd)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                        .disableAutocorrection(true)
                }.padding([.leading, .trailing], 27.5)
                
                Spacer().frame(height: 80)
                
                NavigationLink(destination: LoginScreen(), isActive: $go_to_next)
                { Button( action: {
                    DB_Manager().addUser(firstNameValue: self.firstName, lastNameValue: self.lastName, emailValue: self.email, passwordValue: self.password)
                    go_to_next = true
                    print("\(userModels)")
                }) {
                    Text("Register")
                        .fontWeight(.heavy)
                        .padding().frame(width: 250.0, height: 45.0, alignment: .center).background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(80.0)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                }
                }
                
                Spacer()
                HStack(spacing: 0) {
                    NavigationLink(destination: LoginScreen(), label: { Text("Not a New User").fontWeight(.heavy)
                            .padding().frame(width: 350.0, height: 45.0, alignment: .center)
                            .foregroundColor(Color.white)
                            .cornerRadius(80.0)
                            .navigationBarBackButtonHidden(true)
                            .navigationBarHidden(true)
                    })
                }
                
                
            }.background(RadialGradient(gradient: Gradient(colors: [Color.green, Color(red:0.0, green: 0.0, blue: 1.0)]), center: .center, startRadius: 1, endRadius: 400)
             .edgesIgnoringSafeArea(.all))
            
        }
            
    }
    
   struct ScreenTwo: View {
       var body: some View {
           VStack {
           ZStack {
               LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing)
               Text("Choose Your Option").padding(.top, 50)
                   .font(.title)
           }
           .frame(maxWidth: .infinity).frame(height: 150)
           .ignoresSafeArea()
               Spacer()
               HStack {
                   Spacer()
                   NavigationLink(destination: DonorRegisterScreen(), label: { Text("I am a Donor").multilineTextAlignment(.center)
                       .frame(width: 150.0, height: 200.0, alignment: .center)
                       .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                       .cornerRadius(5)
                       .foregroundColor(Color.black)
                       .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                       })
                   Spacer().frame(width: 50)
                   NavigationLink(destination: FoodBankRegisterScreen(), label: { Text("I am a Food Bank")
                       .frame(width: 150.0, height: 200.0, alignment: .center)
                       .multilineTextAlignment(.center)
                       .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                       .cornerRadius(5)
                       .foregroundColor(Color.black)
                       .navigationBarBackButtonHidden(true)
                        .navigationBarHidden(true)
                   })
                   Spacer()
               }
               Spacer()
           }.ignoresSafeArea()
      }
}
    
    struct FoodBankRegisterScreen: View {
        
        @State private var foodbanks: [Foodbank] = [Foodbank]()
        @State private var search: String = "food bank"
        @State private var navigationFlag: String? = ""
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var name: String = ""
        
        private func getNearByFoodBanks() {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = search
            
            let search = MKLocalSearch(request: request)
            search.start { (response, error) in
                if let response = response {
                    
                    let mapItems = response.mapItems
                    self.foodbanks = mapItems.map {
                        Foodbank(placemark: $0.placemark)
                    }
                }
            }
        }
        
        var body: some View {
            VStack() {
                ZStack {
                    Image("hands").resizable().frame(width: 180.0, height: 180.0, alignment: .center)
                    Image("plate (1)").resizable().frame(width: 110.0, height: 110.0, alignment: .center)
                }.clipShape(Circle())
                    .shadow(radius: 10.0, x: 20, y: 10)
                    .padding(.bottom, 20)
                Text("Welcome To SOLVE HUNGER!") .multilineTextAlignment(.center)
                    .font(.largeTitle).foregroundColor(Color.white)
                    .padding()
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                Spacer().frame(height: 50)
                VStack(alignment: .leading, spacing: 15) {
                
                 Menu("Select a foodbank") {
                        
                    ForEach(self.foodbanks, id: \.id) {
                            foodbank in
                        Button(action: { name = foodbank.name },
                                       label: { Text(foodbank.name) })
                        }.onAppear(perform: { self.getNearByFoodBanks() })
                     
                 }.foregroundColor(.white).padding()

                    TextField("Name", text: self.$name)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                    
                    SecureField("Confirm Password", text: self.$password)
                        .padding()
                        .background(Color.themeTextField)
                        .cornerRadius(20.0)
                        .shadow(radius: 10.0, x: 20, y: 10)
                }.padding([.leading, .trailing], 27.5)
                
                Spacer().frame(height: 40)
                NavigationLink(destination: LoginScreen(), label: { Text("Register").fontWeight(.heavy)
                        .padding().frame(width: 250.0, height: 45.0, alignment: .center).background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(80.0)
                    .navigationBarBackButtonHidden(true)
                     .navigationBarHidden(true)
                    })
                
                Spacer()
                HStack(spacing: 0) {
                    NavigationLink(destination: LoginScreen(), label: { Text("Not a New User").fontWeight(.heavy)
                            .padding().frame(width: 350.0, height: 45.0, alignment: .center)
                        .foregroundColor(Color.white)
                        .cornerRadius(80.0)
                        .navigationBarBackButtonHidden(true)
                         .navigationBarHidden(true)
                        })
                }
            }
            .background(
                RadialGradient(gradient: Gradient(colors: [Color.green, Color(red:0.0, green: 0.0, blue: 1.0)]), center: .center, startRadius: 1, endRadius: 400)
                    .edgesIgnoringSafeArea(.all))
        }
    }
    
    struct MapScreen: View {
        
        @ObservedObject var locationManager = LocationManager()
        @State private var foodbanks: [Foodbank] = [Foodbank]()
        @State private var search: String = "food bank"
        @State private var tapped: Bool = false
        
        private func getNearByFoodBanks() {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = search
            
            let search = MKLocalSearch(request: request)
            search.start { (response, error) in
                if let response = response {
                    
                    let mapItems = response.mapItems
                    self.foodbanks = mapItems.map {
                        Foodbank(placemark: $0.placemark)
                    }
                }
            }
        }
            
            var body: some View {
                ZStack(alignment: .top) {
                    
                    MapView(foodbanks: foodbanks).ignoresSafeArea().onTapGesture(perform: {
                        self.getNearByFoodBanks()
                        
                    }).onAppear(perform: {self.getNearByFoodBanks()})
                    
                    VStack {
                        Spacer()
                NavigationLink(destination: DonateScreen(), label: { Text("Proceed").fontWeight(.bold)
                    .padding().frame(width: 250.0, height: 45.0, alignment:.center)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(80.0)
                    .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                    })
                Spacer().frame(height: 70)
                    }
                }
            }
    
}
    struct FoodbankScreen: View {
        @State var need1: String = ""
        @State var need2: String = ""
        @State var need3: String = ""
        @State var update: String = ""
        @State private var alert: Bool = false
        
        var body: some View {
            
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                NavigationLink("Switch Mode", destination: ScreenTwo()).navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true).foregroundColor(.white)
                    Spacer().frame(height: 80)
                    VStack {
                        Text("Welcome Back").fontWeight(.bold).font(.system(size: 40))
                        Spacer().frame(height: 20)
                        Form{
                            Section(header: Text("Update Your Need")) {
                                Group {
                                TextField("your item here", text: $need1)
                                TextField("your item here", text: $need2)
                                TextField("your item here", text: $need3)
                                    }
                                }
                            Section(header: Text("Your Current Items")) {
                                Text(need1+"\n"+need2+"\n"+need3)
                            }
                            Section(header: Text("Status")) {
                                Text(update)
                            }
                        }
                        Spacer().frame(height: 20)
                        Button("Submit", action: {
                            update = "You have received a donation worth $20"
                        }).padding().cornerRadius(88).background(.white).frame(width: 250, height: 45)
                        }.foregroundColor(.black).padding()
                }
            }
        }
    }
    
    struct DonateScreen: View {
        
        @State private var foodbanks: [Foodbank] = [Foodbank]()
        @State private var search: String = "food bank"
        @State private var tapped: Bool = false
        @State private var navigationFlag: String? = ""
        
        private func getNearByFoodBanks() {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = search
            
            let search = MKLocalSearch(request: request)
            search.start { (response, error) in
                if let response = response {
                    
                    let mapItems = response.mapItems
                    self.foodbanks = mapItems.map {
                        Foodbank(placemark: $0.placemark)
                    }
                }
            }
        }
        
        var body: some View {
            List {
                ForEach(self.foodbanks, id: \.id) {
                    foodbank in
                    VStack(alignment: .leading) {
                        Text(foodbank.name)
                            .fontWeight(.bold)
                        Text(foodbank.title)
                    }
                }
            }
            .onAppear(perform: { self.getNearByFoodBanks()})
            .onTapGesture(perform: {
                tapped = true
            }).alert("Items Needed At This Foodbank:", isPresented: $tapped, actions: {
                Button("Donate", role: .destructive) {
                    self.navigationFlag = "go"
                }
            }, message: {
                Text("Rice, Beans").font(.title)
            })
            NavigationLink("", destination: PacketScreen(), tag: "go",
                           selection:$navigationFlag).navigationBarBackButtonHidden(true).navigationBarHidden(true)
            
            NavigationLink(destination: MapScreen(), label: { Text("Back").fontWeight(.bold)
                    .padding().frame(width: 250.0, height: 45.0, alignment:.center)
                    .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(80.0)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                })
            }
    }
    
struct PacketScreen: View {
    @State private var cost: Int = 0
    
    var body: some View {
        NavigationLink("Back to List", destination: DonateScreen()).frame(alignment: .leading)
        Spacer().frame(height: 10)
        Text("Tap On An Item").font(.system(size: 40)).fontWeight(.bold)
        Spacer()
        HStack(alignment: .center) {
            Spacer()
            VStack {
            VStack {
                Image("rice").resizable().scaledToFit()
            }.frame(width: 150.0, height: 200.0, alignment: .center)
                .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                .cornerRadius(5)
                .foregroundColor(Color.black)
                Text("Rice - $5").multilineTextAlignment(.center).background(.white) }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true).onTapGesture {cost = 5}
            Spacer().frame(width: 50)
            VStack {
            VStack {
                Image("beans").resizable().scaledToFill()
            }.frame(width: 150.0, height: 200.0, alignment: .center)
                .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                .cornerRadius(5)
                .foregroundColor(Color.black)
                Text("Beans - $5").multilineTextAlignment(.center).background(.white)
            }.onTapGesture { cost = 5}
            Spacer()
        }
        Spacer().frame(height: 35)
        HStack {
            Spacer()
            VStack {
            Text("Small Rice and Beans Combo - $10").multilineTextAlignment(.center)
            }.frame(width: 120.0, height: 200.0, alignment: .center)
                .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                .cornerRadius(5)
                .foregroundColor(Color.black).onTapGesture { cost = 10}
            Spacer().frame(width: 20)
            VStack { Text("Medium Rice and Beans Combo - $20").multilineTextAlignment(.center)
                .frame(width: 120.0, height: 200.0, alignment: .center)
                .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                .cornerRadius(5)
                .foregroundColor(Color.black) }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true).onTapGesture { cost = 20}
                Spacer().frame(width: 20)
            VStack { Text("Large Rice and Beans Combo - $40").multilineTextAlignment(.center)
                .frame(width: 120.0, height: 200.0, alignment: .center)
                .border(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing), width: 3)
                .cornerRadius(5)
                .foregroundColor(Color.black) }.navigationBarBackButtonHidden(true)
                .navigationBarHidden(true).onTapGesture {cost = 40 }
            Spacer()
        }
        Spacer().frame(height: 35)
        NavigationLink(destination: PayScreen(cost: $cost), label: { VStack { Text("Proceed to Payment").fontWeight(.bold)
                .padding().frame(width: 250.0, height: 45.0, alignment:.center)
                .background(Color.green)
            .foregroundColor(Color.white)
            .cornerRadius(80.0) }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            })
        Spacer().frame(height: 50)
        }
    }
    
    struct PayScreen: View {
        
        @Binding var cost: Int
        @State private var cardNumber: String = ""
        @State private var cardName: String = ""
        @State private var expiryDate = Date()
        @State private var securityCode: String = ""
        @State private var showAlert: Bool = false
        @State private var payment: String = ""
        
        var body: some View {
            NavigationLink("Back to Item Selection", destination: PacketScreen()).navigationBarHidden(true).navigationBarBackButtonHidden(true)
                Form{
                    Image("card").resizable().scaledToFit().frame(width: 370, height: 200)
                    Section(header: Text("Personal Information")) {
                    Group{
                        TextField("Name on Card", text: $cardName)
                    } }
                    Section(header: Text("Account Information")) {
                        Group{
                            TextField("Card Number", text: $cardNumber)
                            DatePicker("Expiry Date", selection: $expiryDate, displayedComponents: .date)
                            TextField("Security Code", text: $securityCode)
                        }
                    }
                    Text("Your total amount: $\(cost)").fontWeight(.bold).font(.system(size: 20))
                    Text(payment)
                }.navigationTitle("Payment Details")
                .accentColor(.red)
            Spacer()
            Button("Confirm Payment", action: {
                showAlert = true
            }).frame(width: 250.0, height: 45.0, alignment: .center).background(Color.green)
                .foregroundColor(Color.white).cornerRadius(80.0)
                .alert("Confirm Payment", isPresented: $showAlert, actions: {
                    Button("Confirm", role: .destructive) { payment = "Your payment has been received. Thanks for donating!"}
                },
                       message: { Text("A total of $\(cost) will be deducted from your account")})
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}

extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}
