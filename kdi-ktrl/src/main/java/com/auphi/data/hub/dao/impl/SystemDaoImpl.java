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
package com.auphi.data.hub.dao.impl;

import java.io.Serializable;

import org.springframework.stereotype.Service;

import com.auphi.data.hub.core.BaseDaoImpl;
import com.auphi.data.hub.dao.SystemDao;

/**
 * 系统管理数据访问接口实现
 * 
 * @author zhangjiafeng
 *
 */
@Service("baseDao")
public class SystemDaoImpl extends BaseDaoImpl implements SystemDao,Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4752681949604492454L;

}
