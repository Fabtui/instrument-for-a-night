const checkoutAmount = () => {
 const rentPurchases = document.querySelectorAll('.rent-checkout-item');
 if (rentPurchases) {
   const totalAmount = document.querySelector('.total-amount')
   function displayPrice(total_price) {
     totalAmount.textContent = `Total amount ${total_price}€`
   }
   let total_price = 0;
   rentPurchases.forEach( rentPurchase => {
     const price = parseInt(rentPurchase.dataset.price, 10);
     const id = rentPurchase.dataset.id;
     const checkbox = document.querySelector(`#checkout-checkbox-${id}`)
     if (checkbox.checked) {
       total_price += price
       displayPrice(total_price)
     }
     checkbox.addEventListener('click', (e) => {
     if (checkbox.checked) {
       total_price = total_price + price
       displayPrice(total_price)
      } else {
       total_price = total_price - price
       displayPrice(total_price)
     }
     })
   })
 }
}

export { checkoutAmount };
