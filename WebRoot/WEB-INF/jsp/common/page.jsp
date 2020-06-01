<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<style>
.pagenumon {
	background:#838181;
}
.pagenumoff {
	background:#ffffff;
}
.page a{ color:#0132cc; border:1px solid #bad9ee; padding:0px 4px!important;  margin:0 2px!important;display:block; float:left; text-decoration:none;}
</style>

<c:set var="curPageSize" value="${param.pageSize}"></c:set>
<c:if test="${empty param.pageSize}">
	<c:set var="curPageSize" value="10"></c:set>
	<c:if test="${not empty pageSize}">
		<c:set var="curPageSize" value="${pageSize}"></c:set>
	</c:if>
</c:if>
<util:pageCount pageSize="${curPageSize }"  totalCount="${totalCount }" var="pageCount"/>
<div class="pagination solid">
<div class="page-bottom">
	<!-- 首页，上一页处理start -->
	<c:if test="${(pageObj.currentpage!=pageObj.firstpage)}">
		<a style="cursor:pointer" onClick="goPage(${pageObj.firstpage});" class="page-prev" target="_self">
		 	<span>首页</span>
		</a>
		<a style="cursor:pointer" onClick="goPage(${pageObj.prepage});" class="page-prev" target="_self">
			 <span>上一页</span>
		</a>
	</c:if>
	<c:if test="${pageObj.currentpage==pageObj.firstpage}">
		<a href="javascript:void(0);" style="cursor:pointer;background:#ffffff; color:#838181; font-weight:bold; border:1px solid #838181; TEXT-DECORATION:none " class="page-prev" target="_self" title="已是首页">
			<span>首页</span>
		</a>
		<a href="javascript:void(0);" style="cursor:pointer;background:#ffffff; color:#838181; font-weight:bold; border:1px solid #838181; TEXT-DECORATION:none " class="page-prev" target="_self" title="没有上一页">
			<span>上一页</span>
		</a>
	</c:if>
	<!-- 首页，上一页处理end -->
	
	<c:set var="tmpPage" value="0"/>
	<c:if test="${pageObj.currentpage<3 }">
		<c:set var="tmpPage" value="3"/>
	</c:if>
	<c:if test="${pageObj.currentpage>=3 }">
		<c:set var="tmpPage" value="${pageObj.currentpage }"/>
	</c:if>
	<c:if test="${pageCount-pageObj.currentpage<2 }">
		<c:set var="tmp1" value="${2-(pageCount-pageObj.currentpage) }"/>
		<c:set var="tmpPage" value="${tmpPage-tmp1 }"/>
		<c:if test="${tmpPage<3 }">
			<c:set var="tmpPage" value="3"/>
		</c:if>
	</c:if>
	<c:forEach begin="0" end="4" var="y"> 
		<c:if test="${tmpPage-2+y<=pageCount }">
		<a 
		<c:if test="${pageObj.currentpage ne tmpPage-2+y }">style="cursor:pointer"</c:if> id="a_${tmpPage-2+y}" 
		<c:if test="${pageObj.currentpage ne tmpPage-2+y }">onClick="goPage(${tmpPage-2+y});"</c:if> 
		class="<c:if test="${pageObj.currentpage eq tmpPage-2+y }">page-cur</c:if>
		<c:if test="${pageObj.currentpage ne tmpPage-2+y }">pagenumoff</c:if>" 
		target="_self">		
			<span>${tmpPage-2+y }</span>
		</a>
		</c:if>
	</c:forEach>
	
	<!-- 首页，尾页处理start -->
	<c:if test="${(pageObj.currentpage!=pageObj.lastpage) && pageObj.lastpage>0}">
		<a target="_self" style="cursor:pointer" class="page-next" onClick="goPage(${pageObj.nextpage});">
			<span>下一页</span>
		</a>
		<a target="_self" style="cursor:pointer" class="page-next" onClick="goPage(${pageObj.lastpage});">
			<span>&nbsp;尾页&nbsp;</span>
		</a>
	</c:if>	
	<c:if test="${pageObj.currentpage==pageObj.lastpage||pageObj.lastpage<0}">
		<a href="javascript:void(0);" style="cursor:pointer;background:#ffffff; color:#838181; font-weight:bold; border:1px solid #838181; TEXT-DECORATION:none " class="page-next" title="没有下一页" target="_self"> <span>下一页</span> </a>
		<a href="javascript:void(0);" style="cursor:pointer;background:#ffffff; color:#838181; font-weight:bold; border:1px solid #838181; TEXT-DECORATION:none " class="page-next" title="已到尾页" target="_self"> <span>&nbsp;尾页&nbsp;</span> </a>		
	</c:if>
	<!-- 首页，尾页处理end -->
	
	<span style=" line-height: 22px;" class="page-skip"> 共${pageCount }页     共${totalCount}条记录     跳至   
		<input id="pageform" name="pageform" maxlength="3" size="3" onkeyup="this.value=this.value.replace(/\D/g,'');" onafterpaste="this.value=this.value.replace(/\D/g,'')" value="${pageObj.currentpage}" />
		<input type="button" name="pageturn" value="跳到" onclick="gotoPage(document.getElementById('pageform').value);">
	</span>
</div>
</div>


<script>
function gotoPage(pageNum){
	if(pageNum<1){
		goPage(1);
	}
	if(pageNum>${pageCount}){
		goPage(${pageCount});
	}
	if(pageNum > 0 && pageNum <= ${pageCount}){
		goPage(pageNum);
	}
}
</script>