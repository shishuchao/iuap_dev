package com.yonyou.iuap.crm.common.ref;

import iuap.ref.ref.RefClientPageInfo;
import iuap.ref.sdk.refmodel.model.AbstractGridRefModel;
import iuap.ref.sdk.refmodel.vo.RefViewModelVO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yonyou.iuap.crm.basedata.entity.ProvinceCityVO;
import com.yonyou.iuap.persistence.bs.dao.BaseDAO;
import com.yonyou.iuap.persistence.bs.dao.DAOException;
import com.yonyou.iuap.persistence.jdbc.framework.processor.MapListProcessor;
import com.yonyou.iuap.persistence.vo.pub.BusinessException;
import com.yonyou.iuap.crm.basedata.service.itf.IProvinceCityService;


/**
* 省份参照类
* @author 
* @date 2016年11月28日
*/
@RequestMapping({"/ref/province"})
@Controller
public class ProvinceRefController extends AbstractGridRefModel implements IRefModelRestEx{
	@Autowired 
	@Qualifier("baseDAO") private  BaseDAO dao;
	
	@Autowired private IProvinceCityService  provinceService;
	
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	

	public ProvinceRefController() {
		
	}

	
	/**
	* 设置参照属性
	* @author 
	* @date 2016年11月29日
	* @param refViewModel
	* @return
	* (non-Javadoc)
	* @see iuap.ref.sdk.refmodel.model.AbstractGridRefModel#getRefModelInfo(iuap.ref.sdk.refmodel.vo.RefViewModelVO)
	*/
	@Override
	public RefViewModelVO getRefModelInfo(@RequestBody RefViewModelVO refViewModel) {
		refViewModel = super.getRefModelInfo(refViewModel);
		refViewModel.setRefName("省份");
		refViewModel.setRefCode("province");
		refViewModel.setRootName("省份");
		refViewModel.setStrHiddenFieldCode(new String[]{"refpk"});
		refViewModel.setStrFieldCode(new String[]{"refcode","refname"});
		refViewModel.setStrFieldName(new String[]{"省份编码","省份名称"});
		return refViewModel;
	}

	
	/**
	* @author 
	* @date 2016年11月29日
	* @param paramRefViewModelVO
	* @return
	* (non-Javadoc)
	* @see iuap.ref.sdk.refmodel.model.AbstractGridRefModel#getCommonRefData(iuap.ref.sdk.refmodel.vo.RefViewModelVO)
	*/
	@Override
	public Map<String, Object> getCommonRefData(
			@RequestBody RefViewModelVO paramRefViewModelVO) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		Map<String, Object> searchParams = new HashMap<String, Object>();
		RefClientPageInfo refClientPageInfo = paramRefViewModelVO.getRefClientPageInfo();
		String condition =  paramRefViewModelVO.getContent();//获取查询条件
		if(!StringUtils.isEmpty(condition)){
			searchParams.put("condition", condition);
		}
		int currPageIndex = refClientPageInfo.getCurrPageIndex();
		PageRequest pageRequest = new PageRequest(currPageIndex, 10, new Sort(Direction.ASC, "ts"));
		Page<ProvinceCityVO> categoryPage = null;
		try {
			categoryPage = provinceService.getProvince(searchParams, pageRequest);
			
			int pageCount = categoryPage.getTotalPages();
			int pageSize = categoryPage.getSize();
			refClientPageInfo.setPageCount(pageCount);
			refClientPageInfo.setPageSize(pageSize);
			paramRefViewModelVO.setRefClientPageInfo(refClientPageInfo);

			List<Map<String, String>> list = new ArrayList<Map<String, String>>();
			
			List<ProvinceCityVO> vos = categoryPage.getContent();
			for(ProvinceCityVO vo : vos){
				HashMap<String, String> provincemap = new HashMap<String, String>();
				provincemap.put("refpk", vo.getPk_region());
				provincemap.put("refcode", vo.getCode());
				provincemap.put("refname", vo.getName());
				list.add(provincemap);
			}
			
			result.put("dataList", list);
			result.put("refViewModel", paramRefViewModelVO);
			return result;
		} catch (BusinessException e) {
			logger.error("省份参照获取错误",e);
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			logger.error("省份参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}
	
	
	@Override
	public List<Map<String,String>> getIntRefData(
			String pks) throws Exception {
		String sql = "SELECT tr.pk_region as pk, tr.`name` as name, tr.pk_father from tm_region tr where tr.pk_father='~' and tr.pk_region in ("+pks+")";
		List<Map<String,String>> results = dao.queryForList(sql, new MapListProcessor());
		return results;
	}
	
	@Override
	public List<Map<String, String>> filterRefJSON(@RequestBody RefViewModelVO arg0) {
		Map<String, Object> searchParams = new HashMap<String, Object>();
		PageRequest pageRequest = new PageRequest(0, 10, new Sort(Direction.ASC, "ts"));
		Page<ProvinceCityVO> categoryPage = null;
		try {
			categoryPage = provinceService.getProvince(searchParams, pageRequest);
			
			List<Map<String, String>> list = new ArrayList();
			
			List<ProvinceCityVO> vos = categoryPage.getContent();
			for(ProvinceCityVO vo : vos){
				HashMap<String, String> provincemap = new HashMap<String, String>();
				provincemap.put("refpk", vo.getPk_region());
				provincemap.put("refcode", vo.getCode());
				provincemap.put("refname", vo.getName());
				list.add(provincemap);
			}
			
			return list;
		} catch (BusinessException e) {
			logger.error("省份参照获取错误",e);
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Map<String, String>> matchPKRefJSON(@RequestBody RefViewModelVO arg0) {
		return null;
	}

	@Override
	public List<Map<String, String>> matchBlurRefJSON(
			@RequestBody RefViewModelVO paramRefViewModelVO) {
		// TODO 自动生成的方法存根
		String[] pks = paramRefViewModelVO.getPk_val();
		List<Map<String, String>> results = new ArrayList();
		try {
			Map<String, String> map = new HashMap();
			if(pks!=null&&pks.length>0) {
				for (int i = 0; i < pks.length; i++) {
					String pk = pks[i];
					ProvinceCityVO vo = dao.queryByPK(ProvinceCityVO.class, pk);
					map.put("refpk", vo.getPk_region()); 
					map.put("refcode", vo.getCode()); 
					map.put("refname", vo.getName()); 
					results.add(map);
				}
			}else{
				map.put("refpk", ""); 
				map.put("refcode",""); 
				map.put("refname",""); 
				results.add(map);
			}
		} catch (DAOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return results;
	}
}
