package com.project.simple.product.page;

public class PageMaker1 {
	  
    private Criteria1 cri;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 10;
    
    public Criteria1 getCri() {
        return cri;
    }
    public void setCri(Criteria1 cri) {
        this.cri = cri;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        calcData();
    }
    
    private void calcData() {
        //�������� ��ȣ  = (���� ������ ��ȣ/ȭ�鿡 ������ ������ ��ȣ�� ����) * ȭ�鿡 ������ ������ ��ȣ�� ���� 
        endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
        
        //���� ������ ��ȣ=(�������� ��ȣ - ȭ�鿡 ������ ������ ��ȣ�� ����)
        startPage = (endPage - displayPageNum) + 1;
        if(startPage <= 0) startPage = 1;
        
        //������ ������ ��ȣ = �ѻ�ǰ ��/���������� ������ ��ǰ��
        int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        
        //���� ��ư ���� ���� = ������������ȣ ==1?false : true
        prev = startPage == 1 ? false : true;
        
        //���� ��ư ���� ���� = ����������ȣ * ���������� ������ �Խñ��� ����
        next = endPage * cri.getPerPageNum() < totalCount ? true : false;
        
    }
    //Ư�� �������� ��ǰ ���۹�ȣ, ��ǰ ���� �� ��ȣ
    public int getStartPage() {
        return startPage;
    }
    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }
    public int getEndPage() {
        return endPage;
    }
    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }
    public boolean isPrev() {
        return prev;
    }
    public void setPrev(boolean prev) {
        this.prev = prev;
    }
    public boolean isNext() {
        return next;
    }
    public void setNext(boolean next) {
        this.next = next;
    }
    public int getDisplayPageNum() {
        return displayPageNum;
    }
    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }

}
