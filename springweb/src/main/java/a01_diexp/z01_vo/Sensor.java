package a01_diexp.z01_vo;

import java.util.Properties;
import java.util.Set;

//  a01_diexp.z01_vo.Sensor

public class Sensor {
	// Set, Properties를 선언..
	private Set<String> agent; //  중복불가 + 순서확보 못함..
	private Properties addInfo; // key, value 할당.
	
	public Set<String> getAgent() {
		return agent;
	}
	public void setAgent(Set<String> agent) {
		this.agent = agent;
	}
	public Properties getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(Properties addInfo) {
		this.addInfo = addInfo;
	}
	
	
}
