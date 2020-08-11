function sales_commission_calculator() {
  const item_price = document.getElementById("item-price")
  const tax = 0.1;

  item_price.addEventListener("input", (e) => {
    const XHR = new XMLHttpRequest();
    const path = location.pathname;
    XHR.open("GET", `${path}`, true);
    XHR.responseType = "json";
    XHR.send();
    XHR.onload = () => {
      const add_tax_price = document.getElementById("add-tax-price");
      const profit = document.getElementById("profit")
      const sales_commission = parseInt(document.getElementById("item-price").value * tax, 10);
      const sales_profit = parseInt(document.getElementById("item-price").value - sales_commission);
      add_tax_price.innerHTML = sales_commission;
      profit.innerHTML = sales_profit;
    }
  });
}
window.addEventListener("load", sales_commission_calculator);
