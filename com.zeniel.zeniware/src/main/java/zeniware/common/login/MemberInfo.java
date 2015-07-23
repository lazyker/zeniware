package zeniware.common.login;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.SpringSecurityCoreVersion;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.util.Assert;

public class MemberInfo implements UserDetails {

	private static final long serialVersionUID = -4086869747130410600L;
	
	private String userId; //아이디
	private String password;			//패스워드
	private String userNm;				//사용자 성명
	private String compId;				//회사 아이디
	private String deptId;				//부서 아이디
	private String empNumber;		//사번
	private String mailId;				//메일주소
	private String securityLevel;		//보안등급
	private String jobTitleCd;			//직위코드
	private String jobGradeCd;		//직급코드
	private String jobRoleCd;			//직책코드
	private String entitlement;		//사용자권한
	private String managerId;			//부서장 아이디
	private String birthDate;			//생년원일
	private String languageCd;		//언어코드
	private String useYn;				//사용여부
	private String activateYn;			//활성화여부
	private Set<GrantedAuthority> authorities; //아이디의 권한 목록
	
	public MemberInfo(String userId, String password, String userNm, String compId, String deptId, String empNumber, String mailId, String securityLevel,
								String jobTitleCd, String jobGradeCd, String jobRoleCd, String entitlement, String managerId, String birthDate, String languageCd, 
								String useYn, String activateYn, Collection<? extends GrantedAuthority> authorities){
		this.userId = userId;
		this.password = password;
		this.userNm = userNm;
		this.compId = compId;
		this.deptId = deptId;
		this.empNumber = empNumber;
		this.mailId = mailId;
		this.securityLevel = securityLevel;
		this.jobTitleCd = jobTitleCd;
		this.jobGradeCd = jobGradeCd;
		this.jobRoleCd = jobRoleCd;
		this.entitlement = entitlement;
		this.managerId = managerId;
		this.birthDate = birthDate;
		this.languageCd = languageCd;
		this.useYn = useYn;
		this.activateYn = activateYn; 
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}

	
	
	public String getUserNm() {
		return userNm;
	}



	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}



	public String getCompId() {
		return compId;
	}



	public void setCompId(String compId) {
		this.compId = compId;
	}



	public String getDeptId() {
		return deptId;
	}



	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}



	public String getEmpNumber() {
		return empNumber;
	}



	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}



	public String getMailId() {
		return mailId;
	}



	public void setMailId(String mailId) {
		this.mailId = mailId;
	}



	public String getSecurityLevel() {
		return securityLevel;
	}



	public void setSecurityLevel(String securityLevel) {
		this.securityLevel = securityLevel;
	}



	public String getJobTitleCd() {
		return jobTitleCd;
	}



	public void setJobTitleCd(String jobTitleCd) {
		this.jobTitleCd = jobTitleCd;
	}



	public String getJobGradeCd() {
		return jobGradeCd;
	}



	public void setJobGradeCd(String jobGradeCd) {
		this.jobGradeCd = jobGradeCd;
	}



	public String getJobRoleCd() {
		return jobRoleCd;
	}



	public void setJobRoleCd(String jobRoleCd) {
		this.jobRoleCd = jobRoleCd;
	}



	public String getEntitlement() {
		return entitlement;
	}



	public void setEntitlement(String entitlement) {
		this.entitlement = entitlement;
	}



	public String getManagerId() {
		return managerId;
	}



	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}



	public String getBirthDate() {
		return birthDate;
	}



	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}



	public String getLanguageCd() {
		return languageCd;
	}



	public void setLanguageCd(String languageCd) {
		this.languageCd = languageCd;
	}



	public String getUseYn() {
		return useYn;
	}



	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}



	public String getActivateYn() {
		return activateYn;
	}



	public void setActivateYn(String activateYn) {
		this.activateYn = activateYn;
	}



	public void setAuthorities(Set<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}



	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = Collections.unmodifiableSet(sortAuthorities(authorities));
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return getUserId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

    private static SortedSet<GrantedAuthority> sortAuthorities(Collection<? extends GrantedAuthority> authorities) {
        Assert.notNull(authorities, "Cannot pass a null GrantedAuthority collection");
        // Ensure array iteration order is predictable (as per UserDetails.getAuthorities() contract and SEC-717)
        SortedSet<GrantedAuthority> sortedAuthorities =
            new TreeSet<GrantedAuthority>(new AuthorityComparator());

        for (GrantedAuthority grantedAuthority : authorities) {
            Assert.notNull(grantedAuthority, "GrantedAuthority list cannot contain any null elements");
            sortedAuthorities.add(grantedAuthority);
        }
        
        return sortedAuthorities;
    }

    private static class AuthorityComparator implements Comparator<GrantedAuthority>, Serializable {
        private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

        public int compare(GrantedAuthority g1, GrantedAuthority g2) {
            // Neither should ever be null as each entry is checked before adding it to the set.
            // If the authority is null, it is a custom authority and should precede others.
            if (g2.getAuthority() == null) {
                return -1;
            }

            if (g1.getAuthority() == null) {
                return 1;
            }

            return g1.getAuthority().compareTo(g2.getAuthority());
        }
    }
	
}
