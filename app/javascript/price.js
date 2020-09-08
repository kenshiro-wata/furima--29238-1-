
const tax = 0.1;
window.addEventListener("input", function calculation(){

  const price = document.getElementById("item-price").value;

  const taxPrice = Math.floor(price * tax); //販売手数料の計算
  const salesProfit = (price - taxPrice);        //販売利益の計算
  document.getElementById("add-tax-price").textContent = taxPrice;         //販売手数料(HTMLをidから取得）
  document.getElementById("profit").textContent = salesProfit;            //販売利益(HTMLをidから取得）
})

