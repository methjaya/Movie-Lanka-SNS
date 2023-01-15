const button = document.getElementById("chnge_mindID");

let Cancel_warning = "1. This will be the only chance to cancel the booking !.<br>2. Refunds will be manually processed and it will take (2-3 working days).<br>3. It will also take some time for paypal to refund your money to your bank account.<br>4. These seats will now be available for others to book.<br>5. This process is irreversible !"


button.addEventListener("click", function() {
    Swal.fire({
        title: 'Are you sure you want to cancel this booking ?',
        html: Cancel_warning,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#151650',
        cancelButtonColor: '#e53637',
        confirmButtonText: 'Yes, cancel it!'
    }).then((result) => {
        if (result.value && IF_Cancelled()) {
            Swal.fire(
                'Cancelled !',
                'Your booking has been cancelled !',
                'success'
            )
        }
    })
});

function IF_Cancelled()
{
    // Delete all the added records
    $.ajax({
        type: "POST",
        url: "remove_records"
    });
}