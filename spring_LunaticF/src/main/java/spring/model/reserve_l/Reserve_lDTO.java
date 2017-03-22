package spring.model.reserve_l;

public class Reserve_lDTO {

	private int reserveno;		// 예약 번호(PK)
	private String retitle;		// 예약 게시판 글 제목
	private String recontent;	// 예약 게시판 글 내용
	private String reterm;		// 예약 하고자 하는 날짜
	private String restate;	// 예약 장소(경기장)
	private int retimnum;		// 참가 인원
	private String redate;		// 예약글 작성 날짜
	private int reviewcnt;		// 게시판 조회수
	private int grpno;			// 예약글 그룹넘버
	private int indent;			// 예약글 답글 개수
	private int ansnum;			//	답글 번호
	private String id;			// 예약자 ID(FK)

	public int getReserveno() {
		return reserveno;
	}

	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}

	public String getRetitle() {
		return retitle;
	}

	public void setRetitle(String retitle) {
		this.retitle = retitle;
	}

	public String getRecontent() {
		return recontent;
	}

	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}

	public String getReterm() {
		return reterm;
	}

	public void setReterm(String reterm) {
		this.reterm = reterm;
	}

	public String getRestate() {
		return restate;
	}

	public void setRestate(String restate) {
		this.restate = restate;
	}

	public int getRetimnum() {
		return retimnum;
	}

	public void setRetimnum(int retimnum) {
		this.retimnum = retimnum;
	}

	public String getRedate() {
		return redate;
	}

	public void setRedate(String redate) {
		this.redate = redate;
	}

	public int getReviewcnt() {
		return reviewcnt;
	}

	public void setReviewcnt(int reviewcnt) {
		this.reviewcnt = reviewcnt;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getAnsnum() {
		return ansnum;
	}

	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
