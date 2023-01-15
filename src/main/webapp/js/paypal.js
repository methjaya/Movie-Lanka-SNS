let check = 0;
let Price = document.getElementById("mprice").innerHTML;
let Total_Price = parseInt(Price);

let D_Price;

if(Total_Price != null && Total_Price !== 0){
    D_Price = (Total_Price / 365).toFixed(2).toString();
}
else
{
    D_Price = "1";
}

const paypalButtonsComponent = paypal.Buttons({
    // optional styling for buttons
    // https://developer.paypal.com/docs/checkout/standard/customize/buttons-style-guide/
    style: {
        color: "gold",
        shape: "pill",
        layout: "horizontal",
        tagline: "false"
    },

    // set up the transaction
    createOrder: (data, actions) => {
        // pass in any options from the v2 orders create call:
        // https://developer.paypal.com/api/orders/v2/#orders-create-request-body
        const createOrderPayload = {
            purchase_units: [
                {
                    amount: {
                        value: D_Price
                    }
                }
            ]
        };

        return actions.order.create(createOrderPayload);
    },

    // finalize the transaction
    onApprove: (data, actions) => {
        const captureOrderHandler = (details) => {
            const payerName = details.payer.name.given_name;
            console.log('Transaction completed');

            check = 0;
            document.getElementById("PStatus").value = check;

            document.getElementById("payment-form").submit();
        };

        return actions.order.capture().then(captureOrderHandler);
    },

    // handle unrecoverable errors
    onError: (err) => {
        console.log('An error prevented the buyer from checking out with PayPal');

        check = 1;
        document.getElementById("PStatus").value = check;

        document.getElementById("payment-form").submit();
    }
});

paypalButtonsComponent
    .render("#paypal-button-container")
    .catch((err) => {
        console.error('PayPal Buttons failed to render');

        check = 2;
        document.getElementById("PStatus").value = check;

        document.getElementById("payment-form").submit();
    });
