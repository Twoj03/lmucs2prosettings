<%--
  Created by IntelliJ IDEA.
  User: Rinne7z
  Date: 2023/12/26
  Time: 2:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>修改资料</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/edit.css">
    <script src="js/copy.js"></script>
    <style>
        .myButtonContainer {
            position: absolute;
            right: 0;
            top: 20%;
            transform: translateY(-50%);
            margin-top: -90px;
        }

        /* 新的CSS类 */
        .black-text {
            color: black;
        }

        .centered-table {
            margin-left: auto;
            margin-right: auto;
            table-layout: fixed;
            /* 新增的属性 */
        }

        .h1,
        .h2,
        h1,
        h2 {
            margin-top: 100px;
            margin-bottom: 0px;
        }

        .h3,
        h3 {
            margin-top: 0px;
            margin-bottom: -50px;
            font-size: 30px;
        }

        /* 新增的CSS类 */
        .small-input {
            width: 100px;
        }

        /* select#gunView { */
        /* position: absolute; 或者 relative, fixed, sticky */
        /* top: 50px; 从上边缘开始的距离 */
        /* left: 50px; 从左边缘开始的距离 */
        /* } */
    </style>
    <script type="text/javascript">
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>

    <script>
        function openNewWindowAndCloseCurrent() {
            // 在新窗口中打开页面
            var newWindow = window.open('newlogin.jsp');

            // 当新窗口加载完成后，关闭当前窗口
            newWindow.onload = function () {
                window.close();
            }
        }
    </script>
</head>

<script>
    function updateGunView() {
        var gunView = document.getElementById('gunView');
        var b2 = document.getElementById('b2');
        if (gunView.value === '') {
            b2.value = b2.value;
        } else {
            b2.value = gunView.value;
        }
    }


    function updateText(selectElem, textElemId, inputElemId) {
        var selectedValue = selectElem.value;
        if (selectedValue !== '') {
            // 更新innerText
            document.getElementById(textElemId).innerText = selectedValue;
            // 更新input的value
            document.getElementById(inputElemId).value = selectedValue;
        }
    }

    function addPercentage() {
        var input = document.getElementById('c4');
        var value = input.value;
        if (!value.endsWith('%')) {
            input.value = value + '%';
        }
    }
</script>

<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="https://www.csgo.com.cn/">CS2</a>
        </div>
        <ul class="nav navbar-nav">
            <!-- <li class="active"><a href="#">主页</a></li> -->
            <li><a href="UserDetailServlet3?id=${g.id}">主页</a></li>
            <li><a href="UserDetailServlet2?id=${g.id}">玩家</a></li>
            <li><a href="https://shimo.im/docs/e1Azd0nerMC6XYqW/">支持</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="UserDetailServlet1?id=${g.id}">${g.username}</a></li>
        </ul>
    </div>
</nav>
<form action="UpDateServlet" method="post">
    <div class="myContainer">
        <div class="myHeader">
            <img src="${g.headimg}" alt="头像" class="avatar" style="width: 200px;height: 200px">
            <div class="myName">${g.username}</div>
            <table class="myTable centered-table">
                <h2>基础资料</h2>
                <div class="ht1">
                    <tr>
                        <th>id：</th>
                        <input type="hidden" id="id" name="id" value="${g.id}">
                        <td>${g.id}</td>
                    </tr>
                    <tr>
                        <th>用户名：</th>
                        <input type="hidden" id="username" name="username" value="${g.username}">
                        <td>${g.username}</td>
                    </tr>
                    <tr>
                        <th><a href="https://shimo.im/docs/rp3OMj6Pr9sppvkm/">steam主页地址(点击查看获取教程)</a></th>
                        <td><input type="text" id="steamurl" name="steamurl" value="${g.steamurl}"></td>
                    </tr>
                    <tr>
                        <th>国籍：</th>
                        <td><input type="text" id="address" name="address" value="${g.address}"></td>
                    </tr>
                    <tr>
                        <th>个性签名:</th>
                        <td><input type="text" id="signature" name="signature" value="${g.signature}"></td>
                    </tr>
                    <tr>
                        <th>准星：</th>
                        <td><input type="text" id="b1" name="b1" value="${g.b1}"></td>
                    </tr>
                    <tr>
                        <th style="display: flex; align-items: center;">持枪视角：
                            <select id="gunView" onchange="updateGunView()" style="height: 34.6px; margin-left: 10px;">
                                <option value="">请选择...</option>
                                <option
                                        value="viewmodel_fov 60; viewmodel_offset_x 1; viewmodel_offset_y 1; viewmodel_offset_z -1; viewmodel_presetpos 1;">
                                    默认</option>
                                <option
                                        value="viewmodel_fov 54; viewmodel_offset_x 0; viewmodel_offset_y 0; viewmodel_offset_z 0; viewmodel_presetpos 2;">
                                    写实</option>
                                <option
                                        value="viewmodel_fov 68; viewmodel_offset_x 2.5; viewmodel_offset_y 0; viewmodel_offset_z -1.5; viewmodel_presetpos 3;">
                                    经典</option>
                            </select>
                        </th>
                        <td><input type="text" id="b2" name="b2" value="${g.b2}" readonly></td>
                    </tr>


                    <tr>
                        <th>启动项：</th>
                        <td><input type="text" id="b3" name="b3" value="${g.b3}"></td>
                    </tr>

                </div>
            </table>
            <div>
                <h3>鼠标设置</h3>
                <table class="myTable centered-table">
                    <tr>
                        <th>DPI</th>
                        <th>游戏内灵敏度</th>
                        <th>eDPI</th>
                        <th>开镜灵敏度</th>
                    </tr>
                    <tr>
                        <td><input class="small-input" type="text" id="a1" name="a1" value="${g.a1}"></td>
                        <td><input class="small-input" type="text" id="a2" name="a2" value="${g.a2}"></td>
                        <td><input class="small-input" type="text" id="a3" name="a3" value="${g.a3}"></td>
                        <td><input class="small-input" type="text" id="a4" name="a4" value="${g.a4}"></td>
                    </tr>
                    <tr>
                        <th>鼠标轮询率</th>
                        <th>系统指针灵敏度</th>
                    </tr>
                    <tr>
                        <td><input class="small-input" type="text" id="a5" name="a5" value="${g.a5}"></td>
                        <td><input class="small-input" type="text" id="a6" name="a6" value="${g.a6}"></td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>显示设置</h3>
                <table class="myTable centered-table">
                    <tr>
                        <th>分辨率
                            <input type="hidden" id="c1-input" name="c1" VALUE="${g.c1}">
                            <select onchange="updateText(this, 'c1', 'c1-input')">
                                <option value="">请选择...</option>
                                <option value="640x480">640x480</option>
                                <option value="720x576">720x576</option>
                                <option value="800x600">800x600</option>
                                <option value="1024x768">1024x768</option>
                                <option value="1152x864">1152x864</option>
                                <option value="1280x960">1280x960</option>
                                <option value="1280x1024">1280x1024</option>
                                <option value="1440x1080">1440x1080</option>
                                <option value="1600x1024">1600x1024</option>
                                <option value="1680x1050">1680x1050</option>
                                <option value="1920x1080">1920x1080</option>
                            </select>
                        </th>
                        <th>宽高比
                            <input type="hidden" id="c2-input" name="c2" VALUE="${g.c2}">
                            <select onchange="updateText(this, 'c2', 'c2-input')">
                                <option value="">请选择...</option>
                                <option value="4:3">4:3</option>
                                <option value="16:9">16:9</option>
                                <option value="16:10">16:10</option>
                            </select>
                        </th>
                        <th>缩放模式
                            <input type="hidden" id="c3-input" name="c3" VALUE="${g.c3}">
                            <select onchange="updateText(this, 'c3', 'c3-input')">
                                <option value="">请选择...</option>
                                <option value="Native">原生</option>
                                <option value="Stretched">拉伸</option>
                                <option value="Stretched">黑边</option>
                            </select>
                        </th>
                        <th>亮度(输入数字)</th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c1">${g.c1}</td>
                        <td class="small-input" id="c2">${g.c2}</td>
                        <td class="small-input" id="c3">${g.c3}</td>
                        <td><input class="small-input" type="text" id="c4" name="c4" value="${g.c4}" onblur="addPercentage()"></td>
                    </tr>
                    <tr>
                        <th>显示模式
                            <input type="hidden" id="c5-input" name="c5" VALUE="${g.c5}">
                            <select onchange="updateText(this, 'c5', 'c5-input')">
                                <option value="">请选择...</option>
                                <option value="Fullscreen">全屏</option>
                                <option value="Windowed">窗口</option>
                                <option value="Fullscreen Windowed">无边框窗口</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c5">${g.c5}</td>
                    </tr>
                </table>
            </div>
            <div>
                <h3>视频设置</h3>
                <table class="myTable centered-table">
                    <tr>
                        <th>提高角色对比度
                            <input type="hidden" id="c6-input" name="c6" VALUE="${g.c6}">
                            <select onchange="updateText(this, 'c6', 'c6-input')">
                                <option value="">请选择...</option>
                                <option value="Disabled">关闭</option>
                                <option value="Enabled">开启</option>
                            </select>
                        </th>
                        <th>等待垂直同步
                            <input type="hidden" id="c7-input" name="c7" VALUE="${g.c7}">
                            <select onchange="updateText(this, 'c7', 'c7-input')">
                                <option value="">请选择...</option>
                                <option value="Disabled">关闭</option>
                                <option value="Enabled">开启</option>
                            </select>
                        </th>
                        <th>多重采样抗锯齿模式
                            <input type="hidden" id="c8-input" name="c8" VALUE="${g.c8}">
                            <select onchange="updateText(this, 'c8', 'c8-input')">
                                <option value="">请选择...</option>
                                <option value="None">无</option>
                                <option value="CMAA2">CMAA2</option>
                                <option value="2x MSAA">2x MSAA</option>
                                <option value="4x MSAA">4x MSAA</option>
                                <option value="8x MSAA">8x MSAA</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c6">${g.c6}</td>
                        <td class="small-input" id="c7">${g.c7}</td>
                        <td class="small-input" id="c8">${g.c8}</td>
                    </tr>

                    <tr>
                        <th>全局阴影质量
                            <input type="hidden" id="c9-input" name="c9" VALUE="${g.c9}">
                            <select onchange="updateText(this, 'c9', 'c9-input')">
                                <option value="">请选择...</option>
                                <option value="Low">低</option>
                                <option value="Medium">中</option>
                                <option value="High">高</option>
                                <option value="Very High">超高</option>
                            </select>
                        </th>
                        <th>模型/纹理细节
                            <input type="hidden" id="c10-input" name="c10" VALUE="${g.c10}">
                            <select onchange="updateText(this, 'c10', 'c10-input')">
                                <option value="">请选择...</option>
                                <option value="Low">低</option>
                                <option value="Medium">中</option>
                                <option value="High">高</option>
                            </select>
                        </th>
                        <th>纹理过滤模式
                            <input type="hidden" id="c11-input" name="c11" VALUE="${g.c11}">
                            <select onchange="updateText(this, 'c11', 'c11-input')">
                                <option value="">请选择...</option>
                                <option value="Bilinear">双线性</option>
                                <option value="Trilinear">三线性</option>
                                <option value="Anisotropic 2x">各向异性过滤2x</option>
                                <option value="Anisotropic 4x">各向异性过滤4x</option>
                                <option value="Anisotropic 8x">各向异性过滤8x</option>
                                <option value="Anisotropic 16x">各向异性过滤16x</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c9">${g.c9}</td>
                        <td class="small-input" id="c10">${g.c10}</td>
                        <td class="small-input" id="c11">${g.c11}</td>
                    </tr>

                    <tr>
                        <th>着色器细节
                            <input type="hidden" id="c12-input" name="c12" VALUE="${g.c12}">
                            <select onchange="updateText(this, 'c12', 'c12-input')">
                                <option value="">请选择...</option>
                                <option value="Low">低</option>
                                <option value="High">高</option>
                            </select>
                        </th>
                        <th>粒子特效细节
                            <input type="hidden" id="c13-input" name="c13" VALUE="${g.c13}">
                            <select onchange="updateText(this, 'c13', 'c13-input')">
                                <option value="">请选择...</option>
                                <option value="Low">低</option>
                                <option value="Medium">中</option>
                                <option value="High">高</option>
                                <option value="Very High">超高</option>
                            </select>
                        </th>
                        <th>环境光遮蔽
                            <input type="hidden" id="c14-input" name="c14" VALUE="${g.c14}">
                            <select onchange="updateText(this, 'c14', 'c14-input')">
                                <option value="">请选择...</option>
                                <option value="Disabled">关闭</option>
                                <option value="Medium">中</option>
                                <option value="High">高</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c12">${g.c12}</td>
                        <td class="small-input" id="c13">${g.c13}</td>
                        <td class="small-input" id="c14">${g.c14}</td>
                    </tr>

                    <tr>
                        <th>高动态范围
                            <input type="hidden" id="c15-input" name="c15" VALUE="${g.c15}">
                            <select onchange="updateText(this, 'c15', 'c15-input')">
                                <option value="">请选择...</option>
                                <option value="Performance">性能</option>
                                <option value="Quality">质量</option>
                            </select>
                        </th>
                        <th>FidelityFX 超分辨率
                            <input type="hidden" id="c16-input" name="c16" VALUE="${g.c16}">
                            <select onchange="updateText(this, 'c16', 'c16-input')">
                                <option value="">请选择...</option>
                                <option value="Performance">性能</option>
                                <option value="Balanced">平衡</option>
                                <option value="Quality">质量</option>
                                <option value="Disabled(Highest Quality)">关闭(最高质量)</option>
                            </select>
                        </th>
                        <th>NVIDIA Reflex 低延迟
                            <input type="hidden" id="c17-input" name="c17" VALUE="${g.c17}">
                            <select onchange="updateText(this, 'c17', 'c17-input')">
                                <option value="">请选择...</option>
                                <option value="Disabled">关闭</option>
                                <option value="Enabled">开启</option>
                                <option value="Enabled+boost">开启+加速</option>
                            </select>
                        </th>
                    </tr>
                    <tr>
                        <td class="small-input" id="c15">${g.c15}</td>
                        <td class="small-input" id="c16">${g.c16}</td>
                        <td class="small-input" id="c17">${g.c17}</td>
                    </tr>
                    <tr>
                        <th>鼠标</th>
                        <th>键盘</th>
                        <th>耳机</th>
                        <th>鼠标垫</th>
                    </tr>
                    <tr>
                        <td><input class="small-input" type="text" id="d1" name="d1" value="${g.d1}"></td>
                        <td><input class="small-input" type="text" id="d2" name="d2" value="${g.d2}"></td>
                        <td><input class="small-input" type="text" id="d3" name="d3" value="${g.d3}"></td>
                        <td><input class="small-input" type="text" id="d4" name="d4" value="${g.d4}"></td>
                    </tr>
                </table>
            </div>
            <div style="text-align: center;">
                <button style="width:200px; height:50px;font-size:20px;">保存设置</button>
            </div>
        </div>
    </div>
</form>
</body>

</html>
