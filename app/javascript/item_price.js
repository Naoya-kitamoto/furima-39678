window.addEventListener('turbo:load', () => {
});

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const addProfitDom = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  if (inputValue !== "") {
    const price = parseInt(inputValue, 10);
    const tax = Math.floor(price * 0.1);
    const profit = Math.floor(price - tax);
    addTaxDom.innerHTML = `${tax}`;
    addProfitDom.innerHTML = `${profit}`;
  } else {
    addTaxDom.innerHTML = "0";
    addProfitDom.innerHTML = "0";
  }
});
