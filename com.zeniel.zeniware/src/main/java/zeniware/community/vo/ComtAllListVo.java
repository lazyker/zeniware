package zeniware.community.vo;

import java.io.Serializable;

public class ComtAllListVo implements Serializable {
	private String fcComtId;
	private int fcAdmSeq;			//FC_ADM_SEQ
	private String compId;			//COMP_ID
	private String deptId;			//DEPT_ID
	private String cumtNm;			//CUMT_NM
	private String cumtComment;		//CUMT_COMMENT
	private String admActYn;		//ADM_ACT_YN
	private String openYn;			//OPEN_YN
	private String regDate;			//REG_DATE
	private String modDate;			//MOD_DATE
	private String regUserId;		//REG_USER_ID
	private String modUserId;		//MOD_USER_ID
	private int talNumCnt;			//TOTAL_NUMBER_CNT(가입총인원)
	private String joinYn;			// JOIN_YN(가입여부)
	private String mastGubun;		//MAST_GUBUN
}