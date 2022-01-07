window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
    price.addEventListener("input", () => {
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.round(price.value * 0.1 );
      const addPofitDom = document.getElementById("profit");
      addPofitDom.innerHTML = Math.round(price.value - Math.round(price.value * 0.1 ))
    });
  });