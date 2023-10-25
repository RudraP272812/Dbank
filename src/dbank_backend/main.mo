import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
actor {
  
  stable var currentValue: Float = 400;
  
  currentValue := 500;
  let id = 234567890;
  stable var startTime = Time.now();
  startTime := Time.now();
  
  // Debug.print(debug_show(currentValue));
  // Debug.print(debug_show(id));
  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };


  public func withdrawl(amount: Float){
    let tempValue: Float = currentValue - amount;
    if(tempValue >= 0){
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount too large, CurrentValue is less than Zero");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };
  public func compound(){
    let currentTime =  Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue*(1.001 ** Float.fromInt(timeElapsedS));
    startTime:=currentTime;
  };
  // topUp();
};


