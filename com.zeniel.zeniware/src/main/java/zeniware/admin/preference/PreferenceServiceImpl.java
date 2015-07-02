package zeniware.admin.preference;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PreferenceServiceImpl implements PreferenceService {
  
  @Autowired
  private PreferenceDao preferenceDao;
  
  @Override
  public List<CommonCode> getCommonCodes() {
    return preferenceDao.getCommonCodes();
  }

}