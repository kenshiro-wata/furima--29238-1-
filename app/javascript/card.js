const pay = () => {
  Payjp.setPublicKey("pk_test_477e018f9d704ccc48bd1f6a"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
 
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    const card = {
      number: formData.get("manage_order[number]"),
      cvc: formData.get("manage_order[cvc]"),
      exp_month: formData.get("manage_order[exp_month]"),
      exp_year: `20${formData.get("manage_order[exp_year]")}`,
    };
   

    console.log(card)

    Payjp.createToken(card, (status, response) => {
      console.log(response)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
 };
 
 window.addEventListener("load", pay);