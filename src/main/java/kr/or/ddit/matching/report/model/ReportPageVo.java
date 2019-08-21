package kr.or.ddit.matching.report.model;

public class ReportPageVo {

	private int mat_id;
	private String mat_title;
	private String mat_cont;
	private String day;
	private String stTime;
	private String endTime;
	private String mat_type;
	private String mem_id;
	private int rep_id;

	public ReportPageVo() {

	}

	public ReportPageVo(int mat_id, String mat_title, String mat_cont, String day, String stTime, String endTime,
			String mat_type, String mem_id) {
		super();
		this.mat_id = mat_id;
		this.mat_title = mat_title;
		this.mat_cont = mat_cont;
		this.day = day;
		this.stTime = stTime;
		this.endTime = endTime;
		this.mat_type = mat_type;
		this.mem_id = mem_id;
	}

	public int getRep_id() {
		return rep_id;
	}

	public void setRep_id(int rep_id) {
		this.rep_id = rep_id;
	}

	public int getMat_id() {
		return mat_id;
	}

	public void setMat_id(int mat_id) {
		this.mat_id = mat_id;
	}

	public String getMat_title() {
		return mat_title;
	}

	public void setMat_title(String mat_title) {
		this.mat_title = mat_title;
	}

	public String getMat_cont() {
		return mat_cont;
	}

	public void setMat_cont(String mat_cont) {
		this.mat_cont = mat_cont;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getStTime() {
		return stTime;
	}

	public void setStTime(String stTime) {
		this.stTime = stTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getMat_type() {
		return mat_type;
	}

	public void setMat_type(String mat_type) {
		this.mat_type = mat_type;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	@Override
	public String toString() {
		return "ReportPageVo [mat_id=" + mat_id + ", mat_title=" + mat_title + ", mat_cont=" + mat_cont + ", day=" + day
				+ ", stTime=" + stTime + ", endTime=" + endTime + ", mat_type=" + mat_type + ", mem_id=" + mem_id
				+ ", rep_id=" + rep_id + "]";
	}

}
