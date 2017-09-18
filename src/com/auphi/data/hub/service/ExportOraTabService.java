/*******************************************************************************
 *
 * Auphi Data Integration PlatformKettle Platform
 * Copyright C 2011-2017 by Auphi BI : http://www.doetl.com 

 * Support：support@pentahochina.com
 *
 *******************************************************************************
 *
 * Licensed under the LGPL License, Version 3.0 the "License";
 * you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 *
 *    https://opensource.org/licenses/LGPL-3.0 

 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 ******************************************************************************/
package com.auphi.data.hub.service;



import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.auphi.data.hub.core.PaginationSupport;
import com.auphi.data.hub.core.struct.Dto;
import com.auphi.data.hub.dao.SystemDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 导出数据库表结构接口 
 * 
 * @author anx
 *
 */
@Service("exportOraTabService")
public class ExportOraTabService {
	
	@Autowired
	private SystemDao systemDao;
	
	public void save(Map<String,Object> params){
		systemDao.save("ExportOraTab.insert",params);
	}

	
	public void update(Map<String,Object> params){
		systemDao.update("ExportOraTab.updateExportTask",params);
	}
	
	public void delete(Map<String,Object> params){
		systemDao.delete("ExportOraTab.deleteExportTask",params);
	}
	
	public Object getDataExportById(Map<String, Object> dto){
//		Dto<String, Object> dto = new BaseDto();
//		dto.put("CONFIG_ID", dto2);
		Object dataExportInfo = systemDao.queryForObject("ExportOraTab.queryDataExportInfo",dto);
		return dataExportInfo;
	}
	
	public PaginationSupport<Dto<String,Object>> query(Dto dto) throws SQLException{
		List<Dto<String,Object>> items = systemDao.queryForPage("ExportOraTab.query", dto);
		Integer total = (Integer)systemDao.queryForObject("ExportOraTab.queryCount",dto);
		PaginationSupport<Dto<String,Object>> page = new PaginationSupport<Dto<String,Object>>(items, total);
		return page;
	}
	
	
	public List getTableDataAll(Dto dto){
		List items = null;
		items = systemDao.queryForList("ExportOraTab.queryTableDataAll");
		return items;
	}
}
