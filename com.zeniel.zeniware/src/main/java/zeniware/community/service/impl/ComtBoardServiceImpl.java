package zeniware.community.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import zeniware.community.dao.ComtBoardDao;
import zeniware.community.service.ComtBoardService;

@Service
public class ComtBoardServiceImpl implements ComtBoardService {

	@Autowired
	private ComtBoardDao comtBoardDao;
}