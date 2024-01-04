package model;

public class FactoryBean {
	private FactoryBean() {}
	private static FactoryBean factory = new FactoryBean();	// 단 하나만 생성 - 싱글톤
	
	public static FactoryBean newInstance() {
		return factory;
	}
	
	public ICommand createInstance(String cmd) {
		if(cmd.equals("REGISTER")) {
			return new RegisterCommand();
		}
		else if(cmd.equals("CONFIRM")) {
			return new ConfirmCommand();
		}
		else if(cmd.equals("COMPLETE")) {
			return new CompleteCommand();
		}
		else {
			return new MainCommand();
		}
	}
}
