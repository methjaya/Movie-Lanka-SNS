const Theater = document.querySelector('.Theater-layout');
const Buy_Cont = document.querySelector('.buy-cont');

const Total_Tickets = document.getElementById('tc');
const Total_Price = document.getElementById('tp');
const BuyBtn = document.getElementById('bbtn')

let TicketPrice = document.getElementById("tct_P").value;
let Selected_seats_Pre = document.getElementsByClassName('selected');

//Select A Seat
Theater.addEventListener('click', e => {
    if (e.target.classList.contains('seat') && !e.target.classList.contains('occupied')) {
        e.target.classList.toggle('selected');
    }

    updateSelectedCount();
});

//Update the number of tickets selected and the Total Price
function updateSelectedCount() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    const selectedSeatsCount = selectedSeats.length;

    Total_Tickets.innerText = selectedSeatsCount;
    Total_Price.innerText = selectedSeatsCount * TicketPrice;

    SetBuyButton(selectedSeatsCount);
}

function SetBuyButton(Samount) {
    if (parseInt(Samount) > 0 && !BuyBtn.classList.contains('buysel'))
    {
        BuyBtn.classList.add('buysel');
    }
    else if(parseInt(Samount) === 0 && BuyBtn.classList.contains('buysel'))
    {
        BuyBtn.classList.remove('buysel');
    }
}

// Get the Selected Seats when the proceed button is clicked
Buy_Cont.addEventListener('click',e => {

    if (e.target.classList.contains('buybtn')) {
        let Selected_seats_Final = [];

        for (let i = 0; i < Selected_seats_Pre.length; i++) {
            Selected_seats_Final[i-1] = Selected_seats_Pre[i].innerHTML;
        }

        Pass_Selected_Seats(Selected_seats_Final.join());

        document.getElementById("buyfrm").submit();
    }

});

function Pass_Selected_Seats(Seats_Final)
{
    $.ajax({
        type: "POST",
        url: "seats_session",
        data: { "seats": Seats_Final }
    });
}