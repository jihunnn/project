package com.project.simple.product.page;

public class Criteria1 {
    private int page;//���� ������
    private int perPageNum;  //perPageNum ���������� ������ ��ǰ�� ����   
    public int getPageStart() {

        return (this.page-1)*perPageNum;
    }
    
    public Criteria1() {
        this.page = 1;
        this.perPageNum = 9;
    }
    
    public int getPage() {
        return page;
    }
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    
    public int getPerPageNum() {
        return perPageNum;
    }
    
    public void setPerPageNum(int pageCount) {
        int cnt = this.perPageNum;
        if(pageCount != cnt) {
            this.perPageNum = cnt;
        } else {
            this.perPageNum = pageCount;
        }
    }

}
