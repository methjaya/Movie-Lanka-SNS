let Invoice_Today = document.getElementById("order-date");

const All_Inputs = document.querySelectorAll('input');
const pay = document.getElementById("paypal-button-container");

//Hide Initially
pay.hidden = true;

Invoice_Today.innerHTML = Today();

let randnum = generateRandomNumber();

document.getElementById("ticket-no").innerHTML = randnum;
document.getElementById("invoice_num").value = randnum;

function Today() {
    let yourDate = new Date()
    const offset = yourDate.getTimezoneOffset()
    yourDate = new Date(yourDate.getTime() - (offset*60*1000))
    return yourDate.toISOString().split('T')[0]
}

function generateRandomNumber() {
    let randomNumber = "";
    for (let i = 0; i < 25; i++) {
        randomNumber += Math.floor(Math.random() * 10);
    }
    return randomNumber;
}

// Add an event listener to each input field
All_Inputs.forEach(inputField => {
    inputField.addEventListener('input', () => {
        // Check if all input fields are filled
        let allInputsFilled = true;
        All_Inputs.forEach(inputField => {
            if (inputField.value.trim() === '') {
                allInputsFilled = false;
            }
        });

        pay.hidden = !allInputsFilled;
    });
});