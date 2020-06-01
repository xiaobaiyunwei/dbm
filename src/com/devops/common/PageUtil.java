package com.devops.common;
/**
 * 分页对象
 * @author fuxuemin
 *
 */
public class PageUtil {
    private Integer totlecount;//总数
    private Integer currentpage;//当前页
    private Integer totlepage;//总页数
    private Integer firstpage;//首一页
    private Integer prepage;//上一页
    private Integer nextpage;//下一页
    private Integer lastpage;//末页
    private Integer pagecount;//每页显示数
    public Integer getPagecount() {
        return pagecount;
    }
    public void setPagecount(Integer pagecount) {
        this.pagecount = pagecount;
    }
    public PageUtil(){
        
    }
    public Integer getTotlecount() {
        return totlecount;
    }
    public void setTotlecount(Integer totlecount) {
        this.totlecount = totlecount;
    }
    public Integer getCurrentpage() {
        return currentpage;
    }
    public void setCurrentpage(Integer currentpage) {
        this.currentpage = currentpage;
    }
    public Integer getTotlepage() {
        return totlepage;
    }
    public void setTotlepage(Integer totlepage) {
        this.totlepage = totlepage;
    }
    public Integer getFirstpage() {
        return firstpage;
    }
    public void setFirstpage(Integer firstpage) {
        this.firstpage = firstpage;
    }
    public Integer getPrepage() {
        return prepage;
    }
    public void setPrepage(int curpage) {
        if(curpage-1==0)
            this.prepage = Integer.valueOf(1);
        else 
            this.prepage = Integer.valueOf(curpage-1);
       
    }
    public Integer getNextpage() {
        return nextpage;
    }
    public void setNextpage(Integer curpage,Integer totpage) {
        if(curpage.intValue()==totpage.intValue())
            this.nextpage = curpage;
        else 
            this.nextpage = Integer.valueOf(curpage.intValue() + 1);
    }
    public Integer getLastpage() {
        return lastpage;
    }
    public void setLastpage(Integer lapage) {
        this.lastpage = lapage;
    }
}
