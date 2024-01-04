package dom;
import java.io.FileInputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

public class Test1 {
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		// xml을 다루기 위한 공장 생성
		DocumentBuilderFactory factory =
				DocumentBuilderFactory.newInstance();
		
		// 공장안에 실제 작업실(builder)을 만들겠다. 예외처리 여러개 builder 가능
		DocumentBuilder builder = factory.newDocumentBuilder();
		// 이미 만들어진 xml을 불러오는 작업
		FileInputStream xmlFile = new FileInputStream("C:\\maymin\\JspWork\\EclipseWork\\AjaxApp\\src\\main\\webapp\\dom\\test.xml");
		Document doc = builder.parse(xmlFile);
		
		// 읽어올 때 그대로 해서 보여줄 것인가, 아님 가공해서 보여줄건지 java에서 접근
		Element root = doc.getDocumentElement();
		System.out.println(root.getNodeName());
		System.out.println(root.getNodeValue());
		System.out.println(root.getNodeType());
		
		System.out.println("---------------------------------");
		
		Node n1 = root.getFirstChild();
		System.out.println(n1.getNodeName());
		System.out.println(n1.getNodeValue());
		System.out.println(n1.getNodeType());	
		
		System.out.println("---------------------------------");
		
		Node n2 = root.getLastChild();
		System.out.println(n2.getNodeName());
		System.out.println(n2.getNodeValue());
		System.out.println(n2.getNodeType());	
		
		// 홍길동의 이름과 나이 출력
		System.out.println(n1.getFirstChild().getFirstChild().getNodeValue()); // 공백에서 다시 첫번째 자식으로 접근
		System.out.println(n1.getFirstChild().getNextSibling().getLastChild().getNodeValue()); // 나이 출력
		
		xmlFile.close(); // 파일을 열어줬으니까 닫아주기
	}
}
