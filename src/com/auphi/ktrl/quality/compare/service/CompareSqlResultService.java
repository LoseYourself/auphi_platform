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
package com.auphi.ktrl.quality.compare.service;

import com.auphi.data.hub.core.PaginationSupport;
import com.auphi.ktrl.quality.compare.domain.CompareSql;
import com.auphi.ktrl.quality.compare.domain.CompareSqlResult;

import java.sql.SQLException;

/**
 * ${DESCRIPTION}
 *
 * @auther Tony
 * @create 2017-02-11 10:31
 */
public interface CompareSqlResultService {

    PaginationSupport<CompareSqlResult> findPage(CompareSqlResult sqlResult);

    void save(CompareSqlResult compareSqlResult);

    void execCompareSql(CompareSql compareSql) throws SQLException;
}
