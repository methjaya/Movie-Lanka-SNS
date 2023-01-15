const Buy_Tickets_Btn = document.getElementById("bk_tckt");

$(document).ready(function() {
    $.get("movie?mId='"+sessionStorage.getItem("id")+"'", function(responseJson) {

        // $("#dsp-p"+x.toString()).text(item);
        document.getElementById("movie-name").textContent=responseJson[0];
        document.getElementById("movie-description").textContent=responseJson[1];
        document.getElementById("movie-release-date").textContent=responseJson[2];
        document.getElementById("movie-genre").textContent=responseJson[3];
        document.getElementById("movie-rating").textContent=responseJson[4];
        document.getElementById("movie-duration").textContent=responseJson[5];
        $('#i-frame-video').attr('src', responseJson[6]);
        document.getElementById("tckt_cst").value = responseJson[7];
        console.log(responseJson)

    });
});

Buy_Tickets_Btn.addEventListener("click", function(){
    let Movie_Title = document.getElementById("movie-name").innerHTML;
    let Movie_price = document.getElementById("tckt_cst").value;
    Set_Movie_name(Movie_Title,Movie_price);

});

function Set_Movie_name(title, price){
    $.ajax({
        type: "POST",
        url: "movie_detail_session",
        data: { movie_title: title , movie_price : price},
        success: function(){
            window.location.href = "tselector.jsp";
        }
    });
}
