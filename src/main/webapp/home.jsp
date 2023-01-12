<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <%--    <%--%>
    <%--        String[][] y=(String[][]) request.getAttribute("mDetails");--%>
    <%--        int count=Integer.parseInt(request.getAttribute("LatestPanelCount").toString());--%>
    <%--        int counts=5;--%>
    <%--    %>--%>
    <%--    <%!--%>
    <%--        private String stringCheck(String xz) {--%>
    <%--            if (xz.length() > 10)--%>
    <%--                return xz.substring(0, 7) + "...";--%>
    <%--            else--%>
    <%--                return xz;--%>
    <%--        }--%>
    <%--    %>--%>
    <%--    <script src="home.js" type="text/javascript"></script>--%>
    <%--</head>--%>
    <%--<body >--%>
    <%--<h1><%= count %></h1>--%>
    <%--<h1><%= y[0][0] %></h1>--%>
    <%--<h1><%= y[0][1] %></h1>--%>
    <%--<h1><%= y[0][2] %></h1>--%>
    <%--<h1><%=stringCheck("1234567891")%></h1>--%>
    <%--<button onclick="window.location.href='https://www.youtube.com/'">redirect</button>--%>
    <%--<img src=<%=y[0][2]%>>--%>

    <%--<h1>${year}</h1>--%>
    <%--<br/>--%>
    <%--<a href="config" id="srv">Hello Servlet</a>--%>
    <%--<a href="fileUpload.jsp" id="flSrv">Hello Servlet</a>--%>
    <%--</body>--%>
    <%--</html>--%>


    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/home.css" rel="stylesheet">
        <script src="js/home.js" type="text/javascript"></script>
        <%
            String[][] LatestMDetails=(String[][]) request.getAttribute("LmDetails");
            String[][] TMDetails=(String[][]) request.getAttribute("TmDetails");
            String[][] NMDetails=(String[][]) request.getAttribute("NmDetails");
            int countL=Integer.parseInt(request.getAttribute("LatestPanelCount").toString());
            int countT=Integer.parseInt(request.getAttribute("TrendingPanelCount").toString());
            int countN=Integer.parseInt(request.getAttribute("NowShowingPanelCount").toString());
        %>
        <%!
            private String stringCheck(String xz) {
                if (xz!=null && xz.length() > 20)
                    return xz.substring(0, 17) + "...";
                else
                    return xz;
            }
        %>
        <title>Home</title>
    </head>
<body onLoad="dspCards(<%=countL%>,<%=countT%>,<%=countN%>)">
<div class="home-container" id="home-container">
    <div class="carousel">
        <img
                src="img/QOH5g9.webp"
                alt="Interstellar"
                class="crsl-img"
        />
    </div>
    <div class="latest-panel" id="latest-panel-1">
        <div class="panel-title">
            <h2>Latest Movies</h2>
        </div>
        <div class="rec-card-panel">
            <div class="rec-card lrc"  id="l0" onclick="rdr('<%=LatestMDetails[0][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[0][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    <%--                            onclick="window.location.href='https://www.youtube.com/'"--%>
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[0][0])%></div>
                    <div class="m-year"><%=LatestMDetails[0][1]%></div>
                </div>
            </div>

            <div class="rec-card lrc" id="l1" onclick="rdr('<%=LatestMDetails[1][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[1][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[1][0])%></div>
                    <div class="m-year"><%=LatestMDetails[1][1]%></div>
                </div>
            </div>

            <div class="rec-card lrc" id="l2" onclick="rdr('<%=LatestMDetails[2][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[2][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[2][0])%></div>
                    <div class="m-year"><%=LatestMDetails[2][1]%></div>
                </div>
            </div>

            <div class="rec-card lrc" id="l3" onclick="rdr('<%=LatestMDetails[3][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[3][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[3][0])%></div>
                    <div class="m-year"><%=LatestMDetails[3][1]%></div>
                </div>
            </div>

            <div class="rec-card lrc" id="l4" onclick="rdr('<%=LatestMDetails[4][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[4][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[4][0])%></div>
                    <div class="m-year"><%=LatestMDetails[4][1]%></div>
                </div>
            </div>

            <div class="rec-card lrc" id="l5" onclick="rdr('<%=LatestMDetails[5][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=LatestMDetails[5][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(LatestMDetails[5][0])%></div>
                    <div class="m-year"><%=LatestMDetails[5][1]%></div>
                </div>
            </div>

        </div>
    </div>

    <div class="trending-panel" id="trending-panel-1">
        <div class="panel-title">
            <h2>Trending Movies</h2>
        </div>
        <div class="rec-card-panel">
            <div class="rec-card trc" id="t0" onclick="rdr('<%=TMDetails[0][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[0][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[0][0])%></div>
                    <div class="m-year"><%=TMDetails[0][1]%></div>
                </div>
            </div>

            <div class="rec-card trc" id="t1" onclick="rdr('<%=TMDetails[1][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[1][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[1][0])%></div>
                    <div class="m-year"><%=TMDetails[1][1]%></div>
                </div>
            </div>

            <div class="rec-card trc" id="t2" onclick="rdr('<%=TMDetails[2][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[2][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[2][0])%></div>
                    <div class="m-year"><%=TMDetails[2][1]%></div>
                </div>
            </div>

            <div class="rec-card trc" id="t3" onclick="rdr('<%=TMDetails[3][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[3][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[3][0])%></div>
                    <div class="m-year"><%=TMDetails[3][1]%></div>
                </div>
            </div>

            <div class="rec-card trc" id="t4" onclick="rdr('<%=TMDetails[4][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[4][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[4][0])%></div>
                    <div class="m-year"><%=TMDetails[4][1]%></div>
                </div>
            </div>

            <div class="rec-card trc" id="t5" onclick="rdr('<%=TMDetails[5][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=TMDetails[5][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(TMDetails[5][0])%></div>
                    <div class="m-year"><%=TMDetails[5][1]%></div>
                </div>
            </div>

        </div>
    </div>

    <div class="now-showing-panel" id="now-showing-panel-1">
        <div class="panel-title">
            <h2>Now Showing</h2>
        </div>
        <div class="rec-card-panel" id="now-showing-rec-card-panel-1">
            <div class="rec-card nrc" id="n0" onclick="rdr('<%=NMDetails[0][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[0][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[0][0])%></div>
                    <div class="m-year"><%=NMDetails[0][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n1" onclick="rdr('<%=NMDetails[1][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[1][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[1][0])%></div>
                    <div class="m-year"><%=NMDetails[1][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n2" onclick="rdr('<%=NMDetails[2][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[2][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[2][0])%></div>
                    <div class="m-year"><%=NMDetails[2][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n3" onclick="rdr('<%=NMDetails[3][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[3][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[3][0])%></div>
                    <div class="m-year"><%=NMDetails[3][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n4" onclick="rdr('<%=NMDetails[4][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[4][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[4][0])%></div>
                    <div class="m-year"><%=NMDetails[4][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n5" onclick="rdr('<%=NMDetails[5][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[5][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[5][0])%></div>
                    <div class="m-year"><%=NMDetails[5][1]%></div>
                </div>
            </div>

        </div>

        <div class="rec-card-panel" id="now-showing-rec-card-panel-2">
            <div class="rec-card nrc" id="n6" onclick="rdr('<%=NMDetails[6][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[6][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[6][0])%></div>
                    <div class="m-year"><%=NMDetails[6][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n7" onclick="rdr('<%=NMDetails[7][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[7][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[7][0])%></div>
                    <div class="m-year"><%=NMDetails[7][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n8" onclick="rdr('<%=NMDetails[8][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[8][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[8][0])%></div>
                    <div class="m-year"><%=NMDetails[8][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n9" onclick="rdr('<%=NMDetails[9][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[9][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[9][0])%></div>
                    <div class="m-year"><%=NMDetails[9][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n10" onclick="rdr('<%=NMDetails[10][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[10][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[10][0])%></div>
                    <div class="m-year"><%=NMDetails[10][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n11" onclick="rdr('<%=NMDetails[11][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[11][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[11][0])%></div>
                    <div class="m-year"><%=NMDetails[11][1]%></div>
                </div>
            </div>

        </div>

        <div class="rec-card-panel" id="now-showing-rec-card-panel-3">
            <div class="rec-card nrc" id="n12" onclick="rdr('<%=NMDetails[12][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[12][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[12][0])%></div>
                    <div class="m-year"><%=NMDetails[12][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n13" onclick="rdr('<%=NMDetails[13][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[13][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[13][0])%></div>
                    <div class="m-year"><%=NMDetails[13][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n14" onclick="rdr('<%=NMDetails[14][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[14][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[14][0])%></div>
                    <div class="m-year"><%=NMDetails[14][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n15" onclick="rdr('<%=NMDetails[15][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[15][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[15][0])%></div>
                    <div class="m-year"><%=NMDetails[15][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n16" onclick="rdr('<%=NMDetails[16][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[16][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[16][0])%></div>
                    <div class="m-year"><%=NMDetails[16][1]%></div>
                </div>
            </div>

            <div class="rec-card nrc" id="n17" onclick="rdr('<%=NMDetails[17][0]%>')">
                <div class="rec-card-img">
                    <img
                            src=<%=NMDetails[17][2]%>;
                            alt="Interstellar"
                            class="latest-panel-img"
                    />
                </div>
                <div class="title">
                    <div class="m-title"><%=stringCheck(NMDetails[17][0])%></div>
                    <div class="m-year"><%=stringCheck(NMDetails[17][1])%></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>


