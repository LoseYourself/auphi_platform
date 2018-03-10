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
package com.auphi.ktrl.schedule.view;

import java.util.HashMap;
import java.util.TreeMap;

public class HashMapAndArray {
	private TreeMap<Integer, FieldMappingView> hashMap = new TreeMap<Integer, FieldMappingView>();
	private String[] primarys = {};

	public TreeMap<Integer, FieldMappingView> getHashMap() {
		return hashMap;
	}

	public void setHashMap(TreeMap<Integer, FieldMappingView> hashMap) {
		this.hashMap = hashMap;
	}

	public String[] getPrimarys() {
		return primarys;
	}

	public void setPrimarys(String[] primarys) {
		this.primarys = primarys;
	}

}
