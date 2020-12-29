<%--
  Created by IntelliJ IDEA.
  User: fuxuemin
  Date: 2020/12/29
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <script src="${_currConText}${_jsURL }/jquery/jquery.js"></script>
    <title>查看Redis BigKey</title>
</head>
<body>
<div class="userlist">
    <table id = "ut">
   <%--     <tr >
            <td>database</td>
            <td>type</td>
            <td>key</td>
            <td>size_in_bytes</td>
            <td>encoding</td>
            <td>num_elements</td>
            <td>len_largest_element</td>
            <td>expiry</td>
        </tr>--%>
    </table>
</div>
</body>
<script type="text/javascript">
    mtr = document.getElementById("ut") ;
    date = '${param.date}';
    //使用ajax加载csv文件的数据
    $.ajax({
        url: date==''?"${_webContext}/csv/${param.ip}/${param.port}.csv":"${_webContext}/csv/${param.ip}/${param.port}_${param.date.replace('-','')}.csv",
        success: function(result) {
            frag = document.createDocumentFragment();
            // 对csv文件的数据先以行分割
            userList = result.split("\n");
            // 我们在对每一行以逗号作分割
            for(i=0;i<userList.length;i++){
                userary = userList[i].split(",");
                tr = document.createElement("tr");
                // 对每行的内容遍历到td标签去
                for(j = 0;j<userary.length;j++){
                    td = document.createElement("td");
                    td.append(userary[j]);
                    tr.appendChild(td);
                }
                frag.appendChild(tr);
            }
            // 加载到web页面
            mtr.appendChild(frag);
        },
        error: function(result){
            $("#ut").html("<font color=red>没有找到您要查看的结果！</font>");
        }

    });

</script>
</html>
