import{dbank_backend} from "../../declarations/dbank_backend"

window.addEventListener("load",async function(){
 update();
});
document.querySelector("form").addEventListener("submit", async function (event) {
  event.preventDefault();
  const button = event.target.querySelector("#submit-btn");
  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  if (button) {
    button.setAttribute("disabled", true);
  }
  if(document.getElementById("input-amount").value.length!=0){
  await dbank_backend.topUp(inputAmount);
  }
  
  if(document.getElementById("withdrawal-amount").value.length!=0){
    await dbank_backend.withdrawl(withdrawalAmount);
    }
    await dbank_backend.compound();
  update();
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

  if (button) {
    button.removeAttribute("disabled");
  }
});
async function update() {
  const Cvalue = await dbank_backend.checkBalance();
  const valueElement = document.getElementById("value");

  if (valueElement) {
    valueElement.innerText = Math.round(Cvalue * 100) / 100;
  }
};