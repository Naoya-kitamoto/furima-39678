window.addEventListener('turbo:load', () => {
  console.log("OK");
});

const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const addProfitDom = document.getElementById("profit")

priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;
  if (inputValue !== "") {
    const price = parseInt(inputValue, 10);
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;
    addTaxDom.innerHTML = `${tax}`;
    addProfitDom.innerHTML = `${profit}`;
  }
});
