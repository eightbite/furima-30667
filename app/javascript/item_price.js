window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const salesProfitDom = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue / 10);
    salesProfitDom.innerHTML = Math.floor(inputValue - (inputValue / 10));
  })
});