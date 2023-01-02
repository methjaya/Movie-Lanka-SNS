
// var LatestPanelCount=6;
// var TrendingPanelCount=6;
// var NowShowingPanelCount=13;

function dspCardsLatest(LatestPanelCount){
  for(let x=0;x<LatestPanelCount;x++){
    document.getElementById("l"+x.toString()).style.visibility="visible";
  }
}


function dspCardsTrending(TrendingPanelCount){
  for(let x=0;x<TrendingPanelCount;x++){
    document.getElementById("t"+x.toString()).style.visibility="visible";
  }
}


function dspCardsNShowing(NowShowingPanelCount){
  if(NowShowingPanelCount<=6){
    document.getElementById("now-showing-rec-card-panel-2").style.display="none";
    document.getElementById("now-showing-rec-card-panel-3").style.display="none";
  }
  if(NowShowingPanelCount<=12){
    document.getElementById("now-showing-rec-card-panel-3").style.display="none";
  }
  for(let x=0;x<NowShowingPanelCount;x++){
    document.getElementById("n"+x.toString()).style.visibility="visible";
  }
}

function dspCards(LatestPanelCount,TrendingPanelCount,NowShowingPanelCount){
  dspCardsLatest(LatestPanelCount);
  dspCardsTrending(TrendingPanelCount);
  dspCardsNShowing(NowShowingPanelCount);
}




function x(number){
  window.alert(number);
}


function displayTest(xy){
  if(xy.length>10){
    document.write(xy.substring(0,7)+"...");
  }
  else{
    document.write(xy);
  }

}




