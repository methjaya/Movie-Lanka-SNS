const DateBar = document.querySelector(".date-select-bar");
const TimeBox = document.querySelector(".ttselector-body");
const Time_Container = document.getElementById("time-cont")

let Clicked_Date = document.getElementsByClassName("selected")[0].innerHTML;

DateBar.addEventListener("click", function(event) {
    let Section = event.target;

    // Change between dates
    if (Section.classList.contains('date-bx'))
    {
        let Previous_selection = document.querySelector(".selected");
        if(Previous_selection){
            Previous_selection.classList.remove("selected");
        }

        // Change the state to clicked
        Section.classList.add('selected');

        // Get the value of the clicked element
        Clicked_Date = Section.innerHTML;

        // Remove Existing Elements inside the time container
        while(Time_Container.firstChild){
            Time_Container.removeChild(Time_Container.firstChild)
        }

        // Add new values to the time container with the correct date
        updateTimes();
    }
});

TimeBox.addEventListener("click", function(event) {
    let Section = event.target;

    if(Section.classList.contains('time')){
        let parent = Section.closest('.ttselector-theatre');
        let S_Time = Section.innerHTML;
        let T_Name = parent.getElementsByClassName('T-name')[0].innerHTML;

        redirectTONextPage(S_Time,T_Name)
    }
});


function updateTimes() {
    $.ajax({
        type: "POST",
        url: "tselect_dchange",
        data: {selectedDate: Clicked_Date},
        success: function(data) {
            $("#time-cont").append(data);
        }
    });
}

function redirectTONextPage(S_T,T_N){
    $.ajax({
        type: "POST",
        url: "tselect_session",
        data: {SelectedTime: S_T, SelectedDate : Clicked_Date, SelectedTheatre : T_N},
        success: function(){
            window.location.href = "seatsel.jsp";
        }
    });
}
