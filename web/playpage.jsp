<%@ page import="beans.User" %><%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/16
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${g.username}的游戏设置</title>
    <link rel="stylesheet" href="css/player.css">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/copy.js"></script>
</head>



<jsp:include page="head2.jsp"/>



<body>


<%
    User g = (User) request.getAttribute("g");
    String address = g.getAddress();
    String imgPath = "img/other.svg"; // 默认路径

    if (address.equals("中国")) {
        imgPath = "img/cn.svg";
    } else if (address.equals("中国台湾")) {
        imgPath = "img/cn.svg";
    } else if (address.equals("中国香港")) {
        imgPath = "img/hk.svg";
    } else if (address.equals("中国澳门")) {
        imgPath = "img/am.svg";
    }
%>



<div class="container">
    <div class="header1">
        <img src="${g.headimg}" alt="头像" class="avatar">
        <div class="name">${g.username}</div>
        <a href="${g.steamurl}">
            <img src="img/logo_steam.png" alt="已验证" class="verified steam">
        </a>
        <div class="address">
            <p>
                <img class="cn-img" style=" width: 26px;margin-right: 1px;vertical-align: middle;" src="<%=imgPath%>"
                     alt="国旗">
                ${g.address}
            </p>
        </div>
        <div class="signature1">
            <span>个性签名：</span>
        </div>
        <div class="signature">
            <span>${g.signature}</span>
        </div>
    </div>
</div>





<div class="a2">
    <div class="img1">
        <img src="img/cs2-icon-black.svg" alt="CS2" width="25%" height="25%" class="img2">
    </div>
</div>
<div class="container a1">
    <h2>Mouse<img src="img/Mouse.svg" alt="Mouseimg" class="verified"></h2>
    <table class="table">
        <tr>
            <th>DPI</th>
            <th>Sensitivity</th>
            <th>eDPI</th>
            <th>Zoom Sensitivity</th>
        </tr>
        <tr>
            <td>${g.a1}</td>
            <td>${g.a2}</td>
            <td>${g.a3}</td>
            <td>${g.a4}</td>
        </tr>
        <tr>
            <th>Hz</th>
            <th>Windows Sensitivity</th>
            <th></th>
            <th></th>
        </tr>
        <tr>
            <td>${g.a5}</td>
            <td>${g.a6}</td>
            <td></td>
            <td></td>
        </tr>
    </table>
</div>
<div class="fu">
    <div class="a3">
        <h2>Crosshair<img src="img/aim.svg" alt="Crosshairimg" class="verified"></h2>
        <table class="table">
            <tr>
                <th>
                    <pre class="c1" id="myP1">${g.b1}</pre>
                </th>
            </tr>
            <tr>
                <td><button type="button" class="btn btn-default" onclick="myFunction('myP1')">复制准星</button></td>
            </tr>
        </table>
    </div>
    <div class="a3">
        <h2>Viewmodel<img src="img/shou.svg" alt="Viewmodel" class="verified"></h2>
        <table class="table">
            <tr>
                <th>
                    <pre class="c1" id="myV1">${g.b2}</pre>
                </th>
            </tr>
            <tr>
                <td><button type="button" class="btn btn-default" onclick="myFunction('myV1')">复制手臂</button></td>
            </tr>
        </table>
    </div>
    <div class="a3 a4">
        <h2>Launch Options<img src="img/qidong.svg" alt="Launch Options" class="verified"></h2>
        <table class="table">
            <tr>
                <th>
                    <pre class="c1" id="myR1">${g.b3}</pre>
                </th>
            </tr>
            <tr>
                <td><button type="button" class="btn btn-default" onclick="myFunction('myR1')">复制准星</button></td>
            </tr>
        </table>
    </div>
</div>

<div class="container a1">
    <h2>Video Settings<img src="img/view.svg" alt="Mouseimg" class="verified"></h2>
    <div class="Video">
        <table class="table">
            <h3>Video</h3>
            <tr>
                <th>Resolution</th>
                <th>Aspect Ratio</th>
                <th>Scaling Mode</th>
                <th>Brightness</th>
            </tr>
            <tr>
                <td>${g.c1}</td>
                <td>${g.c2}</td>
                <td>${g.c3}</td>
                <td>${g.c4}</td>
            </tr>
            <tr>
                <th>Display Mode</th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <tr>
                <td>${g.c5}</td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
    <div class="Advanced Video">
        <table class="table">
            <h3>Advanced Video</h3>
            <tr>
                <th>Boost Player Contrast</th>
                <th>Wait for Vertical Sync</th>
                <th>Multisampling Anti-Aliasing Mode</th>
                <th>Global Shadow Quality</th>
            </tr>
            <tr>
                <td>${g.c6}</td>
                <td>${g.c7}</td>
                <td>${g.c8}</td>
                <td>${g.c9}</td>
            </tr>
            <tr>
                <th>Model / Texture Detail</th>
                <th>Texture Filtering Mode</th>
                <th>Shader Detail</th>
                <th>Particle Detail</th>
            </tr>
            <tr>
                <td>${g.c10}</td>
                <td>${g.c11}</td>
                <td>${g.c12}</td>
                <td>${g.c13}</td>
            </tr>
            <tr>
                <th>Ambient Occlusion</th>
                <th>High Dynamic Range</th>
                <th>FidelityFX Super Resolution</th>
                <th>NVIDIA Reflex Low Latency</th>
            </tr>
            <tr>
                <td>${g.c14}</td>
                <td>${g.c15}</td>
                <td>${g.c16}</td>
                <td>${g.c17}</td>
            </tr>
        </table>
    </div>
</div>

<div class="container a1">
    <h2>Gear<img src="img/waishe.svg" alt="Gearimg" class="verified"></h2>
    <div class="Gear">
        <table class="table">
            <tr>
                <th><img src="${g.d1img}" alt="test" class="Gearimg"></th>
                <th><img src="${g.d2img}" alt="test" class="Gearimg"></th>
                <th><img src="${g.d3img}" alt="test" class="Gearimg"></th>
                <th><img src="${g.d4img}" alt="test" class="Gearimg"></th>
            </tr>
            <tr>
                <td>${g.d1}</td>
                <td>${g.d2}</td>
                <td>${g.d3}</td>
                <td>${g.d4}</td>
            </tr>
        </table>
    </div>
</div>
</body>


<jsp:include page="foot.jsp"/>
</html>
