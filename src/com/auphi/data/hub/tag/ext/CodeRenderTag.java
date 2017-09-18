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
package com.auphi.data.hub.tag.ext;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.auphi.data.hub.core.struct.BaseDto;
import com.auphi.data.hub.core.struct.Dto;
import com.auphi.data.hub.core.util.CloudConstants;
import com.auphi.data.hub.core.util.TagConstant;
import com.auphi.data.hub.core.util.TagHelper;
import com.auphi.data.hub.core.util.WebUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.auphi.data.hub.core.template.DefaultTemplate;
import com.auphi.data.hub.core.template.FileTemplate;
import com.auphi.data.hub.core.template.TemplateEngine;
import com.auphi.data.hub.core.template.TemplateEngineFactory;
import com.auphi.data.hub.core.template.TemplateType;

/**
 * CodeRenderTag标签
 * 导入Ext扩展组件的CSS、JS资源
 * 
 * @author zhangjiafeng
 */
public class CodeRenderTag extends TagSupport {
	
	private static Log log = LogFactory.getLog(CodeRenderTag.class);
	private String fields;

	/**
	 * 标签开始
	 */
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		StringBuffer sb = new StringBuffer();
		sb.append(TagConstant.SCRIPT_START);
		Dto dto = new BaseDto();
		String[] arrayFields = fields.split(",");
		TemplateEngine engine = TemplateEngineFactory.getTemplateEngine(TemplateType.VELOCITY);
		DefaultTemplate template = new FileTemplate();
		template.setTemplateResource(TagHelper.getTemplatePath(getClass().getName()));
		for (int i = 0; i < arrayFields.length; i++) {
			List codeList = WebUtils.getCodeListByField(arrayFields[i], request);
			dto.put("codeList", codeList);
			dto.put("field", arrayFields[i]);
			StringWriter writer = engine.mergeTemplate(template, dto);
			sb.append(writer.toString());
		}
		sb.append(TagConstant.SCRIPT_END);
		try {
			pageContext.getOut().write(sb.toString());
		} catch (IOException e) {
			log.error(CloudConstants.Exception_Head + e.getMessage());
			e.printStackTrace();
		}
		return super.SKIP_BODY;
	}

	/**
	 * 标签结束
	 */
	public int doEndTag() throws JspException {
		return super.EVAL_PAGE;
	}

	/**
	 * 释放资源
	 */
	public void release() {
		fields = null;
		super.release();
	}

	public void setFields(String fields) {
		this.fields = fields;
	}

}
