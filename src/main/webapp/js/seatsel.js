const Theater = document.querySelector('.Theater-layout');
const Total_Tickets = document.getElementById('tc');
const Total_Price = document.getElementById('tp');
const BuyBtn = document.getElementById('bbtn')

let TicketPrice = 350;
// const urlParams = new URLSearchParams(window.location.search);
// const movie-title = urlParams.get('movie_name');

document.getElementById('mt').innerHTML = "Harry Potter And The Deathly Hallows: Part 1";

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
        BuyBtn.classList.add('buysel')
    }
    else if(parseInt(Samount) == 0 && BuyBtn.classList.contains('buysel'))
    {
        BuyBtn.classList.remove('buysel')
    }
}