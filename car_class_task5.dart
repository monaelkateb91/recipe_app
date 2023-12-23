class Car {
  String brand;
  String model;
  String color;

  Car({
    this.brand = '',
    this.model = '',
    this.color='',
  });
  void start(){
    print("Car started");
  }

}

class SportCar extends Car{
  int speed;
  SportCar({
    required super.brand,
    required super.model,
    required super.color,
    required this.speed,
  });
  void carSpeed(){
    print("the car speed: $speed");
  }
}
class SmartCar extends Car{
  bool? internetConnection;
  SmartCar.namedCountructor(){
    internetConnection=true;
  }
  void checkInterntConnection(){
    print("car is connected to the internet");
  }
}
class Van extends Car {
  int numberofseats;

  Van({
    this.numberofseats = 10
  });
  @override
  void start() {
    // TODO: implement start
    super.start();
  }
}

void main(){
  var sportcar= SportCar(brand: "", model: "2024", speed: 400, color: "red");
  sportcar.start();
  sportcar.carSpeed();
  var smartcar= SmartCar.namedCountructor();
  smartcar.checkInterntConnection();
  var van=Van(numberofseats: 10);
  van.start();

}