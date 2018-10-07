package com.aofei.kettle.core.trans;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.pentaho.di.base.AbstractMeta;
import org.pentaho.di.cluster.SlaveServer;
import org.pentaho.di.core.Const;
import org.pentaho.di.core.logging.LogLevel;
import org.pentaho.di.core.xml.XMLHandler;
import org.pentaho.di.trans.TransExecutionConfiguration;
import org.springframework.util.StringUtils;
import org.xml.sax.SAXException;

import javax.xml.parsers.ParserConfigurationException;
import java.io.IOException;
import java.util.*;

public class TransExecutionConfigurationCodec {

	public static JSONObject encode(TransExecutionConfiguration executionConfiguration) {
		JSONObject jsonObject = new JSONObject();
		
		jsonObject.put("exec_local", executionConfiguration.isExecutingLocally() ? "Y" : "N");
		
		jsonObject.put("exec_remote", executionConfiguration.isExecutingRemotely() ? "Y" : "N");
		if(executionConfiguration.getRemoteServer() != null) {
			jsonObject.put("remote_server", executionConfiguration.getRemoteServer().getName());
		}
		jsonObject.put("pass_export", executionConfiguration.isPassingExport() ? "Y" : "N");
		
		jsonObject.put("exec_cluster", executionConfiguration.isExecutingClustered() ? "Y" : "N");
		jsonObject.put("cluster_post", executionConfiguration.isClusterPosting() ? "Y" : "N");
		jsonObject.put("cluster_prepare", executionConfiguration.isClusterPreparing() ? "Y" : "N");
		jsonObject.put("cluster_start", executionConfiguration.isClusterStarting() ? "Y" : "N");
		jsonObject.put("cluster_show_trans", executionConfiguration.isClusterShowingTransformation() ? "Y" : "N");
		
		JSONArray jsonArray = new JSONArray();
		List<String> paramNames = new ArrayList<String>( executionConfiguration.getParams().keySet() );
	    Collections.sort( paramNames );
		for (String name : paramNames) {
			String value = executionConfiguration.getParams().get(name);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("name", name);
			jsonObject2.put("value", value);
			jsonArray.add(jsonObject2);
		}
		jsonObject.put("parameters", jsonArray);
		
		jsonArray = new JSONArray();
		List<String> variableNames = new ArrayList<String>( executionConfiguration.getVariables().keySet() );
		Collections.sort(variableNames);
		for (String name : variableNames) {
			String value = executionConfiguration.getVariables().get(name);

			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("name", name);
			jsonObject2.put("value", value);
			jsonArray.add(jsonObject2);
		}
	    jsonObject.put("variables", jsonArray);
	    
	    jsonArray = new JSONArray();
	    List<String> argumentNames = new ArrayList<String>( executionConfiguration.getArguments().keySet() );
		Collections.sort(argumentNames);
		for (String name : argumentNames) {
			String value = executionConfiguration.getArguments().get(name);
			JSONObject jsonObject2 = new JSONObject();
			jsonObject2.put("name", name);
			jsonObject2.put("value", value);
			jsonArray.add(jsonObject2);
		}
		jsonObject.put("arguments", jsonArray);
		
		jsonObject.put("replay_date", XMLHandler.date2string(executionConfiguration.getReplayDate()));
		jsonObject.put("safe_mode", executionConfiguration.isSafeModeEnabled() ? "Y" : "N");
		jsonObject.put("log_level", executionConfiguration.getLogLevel().getCode());
		jsonObject.put("clear_log", executionConfiguration.isClearingLog() ? "Y" : "N");
		jsonObject.put("gather_metrics", executionConfiguration.isGatheringMetrics() ? "Y" : "N");
		
		jsonObject.put("log_file", executionConfiguration.isSetLogfile() ? "Y" : "N");
		jsonObject.put("log_filename", executionConfiguration.getLogFileName());
		jsonObject.put("log_file_append", executionConfiguration.isSetAppendLogfile() ? "Y" : "N");
		jsonObject.put("show_subcomponents", executionConfiguration.isShowingSubComponents() ? "Y" : "N");
		jsonObject.put("create_parent_folder", executionConfiguration.isCreateParentFolder() ? "Y" : "N");
		
		if(executionConfiguration.getPassedBatchId() != null) {
			jsonObject.put("passedBatchId", executionConfiguration.getPassedBatchId());
		}

		return jsonObject;
	}
	
	public static TransExecutionConfiguration decode(JSONObject jsonObject, AbstractMeta meta) throws ParserConfigurationException, SAXException, IOException {
		TransExecutionConfiguration executionConfiguration = new TransExecutionConfiguration();
		executionConfiguration.setExecutingLocally("Y".equalsIgnoreCase(jsonObject.getString("exec_local")));
		
		executionConfiguration.setExecutingRemotely("Y".equalsIgnoreCase(jsonObject.getString("exec_remote")));
		String remoteServer = jsonObject.getString("remote_server");
		if(StringUtils.hasText(remoteServer)) {
			SlaveServer slaveServer = meta.findSlaveServer(remoteServer);
			executionConfiguration.setRemoteServer(slaveServer);
		}
		executionConfiguration.setPassingExport("Y".equalsIgnoreCase(jsonObject.getString("pass_export")));
		
		executionConfiguration.setExecutingClustered("Y".equalsIgnoreCase(jsonObject.getString("exec_cluster")));
		executionConfiguration.setClusterPosting("Y".equalsIgnoreCase(jsonObject.getString("cluster_post")));
		executionConfiguration.setClusterPreparing("Y".equalsIgnoreCase(jsonObject.getString("cluster_prepare")));
		executionConfiguration.setClusterShowingTransformation("Y".equalsIgnoreCase(jsonObject.getString("cluster_show_trans")));
		executionConfiguration.setClusterStarting("Y".equalsIgnoreCase(jsonObject.getString("cluster_start")));
		
		Map<String, String> map = new HashMap<String, String>();
		JSONArray jsonArray = jsonObject.getJSONArray("parameters");
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			String paramName = jsonObject2.getString("name");
			String paramValue = jsonObject2.getString("value");
			String defaultValue = jsonObject2.getString("default_value");

			if (Const.isEmpty(paramValue)) {
				paramValue = Const.NVL(defaultValue, "");
			}
			map.put(paramName, paramValue);
		}
		executionConfiguration.setParams( map );
		
		jsonArray = jsonObject.getJSONArray("variables");
		map = new HashMap<String, String>();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			String varName = jsonObject2.getString("name");
			String varValue = jsonObject2.getString("value");
			
			if (!Const.isEmpty(varName)) {
				map.put(varName, varValue);
			}
		}
		executionConfiguration.setVariables(map);
	    
		jsonArray = jsonObject.getJSONArray("arguments");
		map = new HashMap<String, String>();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject2 = jsonArray.getJSONObject(i);
			String varName = jsonObject2.getString("name");
			String varValue = jsonObject2.getString("value");
			if (!Const.isEmpty(varName)) {
				map.put(varName, varValue);
			}
		}
		executionConfiguration.setArguments(map);
		
		executionConfiguration.setReplayDate(XMLHandler.stringToDate(jsonObject.getString("replay_date")));
		executionConfiguration.setSafeModeEnabled("Y".equalsIgnoreCase(jsonObject.getString("safe_mode")));
		executionConfiguration.setLogLevel(LogLevel.getLogLevelForCode(jsonObject.getString("log_level")));
		executionConfiguration.setClearingLog("Y".equalsIgnoreCase(jsonObject.getString("clear_log")));
		executionConfiguration.setGatheringMetrics("Y".equalsIgnoreCase(jsonObject.getString("gather_metrics")));
		
		executionConfiguration.setSetLogfile("Y".equalsIgnoreCase(jsonObject.getString("log_file")));
		executionConfiguration.setLogFileName(jsonObject.getString("log_filename"));
		executionConfiguration.setSetAppendLogfile("Y".equalsIgnoreCase(jsonObject.getString("log_file_append")));
		executionConfiguration.setShowingSubComponents("Y".equalsIgnoreCase(jsonObject.getString("show_subcomponents")));
		executionConfiguration.setCreateParentFolder("Y".equalsIgnoreCase(jsonObject.getString("create_parent_folder")));
		
		if(jsonObject.containsKey("passedBatchId")) {
			executionConfiguration.setPassedBatchId( Long.parseLong( jsonObject.getString("passedBatchId" )));
		}

		return executionConfiguration;
	}
	
}