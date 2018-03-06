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



/**
 * 用户业务接口 
 * 
 * @author skyform
 *
 */

public interface DataExportService  {


	public PaginationSupport<Dto<String,Object>> queryExportTask(Dto dto) throws SQLException;
	
	public void saveExportTask(Map<String,Object> params);
	public void updateExportTask(Map<String,Object> params);
	
	public void deleteExportTask(Map<String,Object> params);
	
	public Object getDataExportById(Map<String, Object> dto);
	
	public List<Dto> getTable();
	
	public List<Dto> getReturnField(Map<String, Object> dto);
	
}
