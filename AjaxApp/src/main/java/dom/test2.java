package dom;

import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.Text;
import org.xml.sax.SAXException;

public class test2 {

	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException, TransformerException {
		DocumentBuilderFactory factory =
				DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		// fileinputstream 을 인자로 받지말고 바로
		Document doc = 
				builder.parse("C:\\maymin\\JspWork\\EclipseWork\\AjaxApp\\src\\main\\webapp\\dom\\test.xml");
		
		Element root = doc.getDocumentElement();
		
		// null 이 아닐 때까지 반복을 돌겠다
		for(Node n = root.getFirstChild(); n!=null;
				n = n.getNextSibling()) {
						// == 1 이라고 해도되지만 가독성이 떨어짐
			if(n.getNodeType() == Node.ELEMENT_NODE) {
				Element e = doc.createElement("address");
				Text t = doc.createTextNode("서울시 강남구");

				// address 안에 textnode가 추가됨
				e.appendChild(t);
				n.appendChild(e);
			}
		}
		// 메모리상에서만 추가된거고 파일에 추가된건 아니다
		// 홍길동의 주소
		System.out.println(root.getFirstChild().
				getNextSibling().
				getLastChild().
				getTextContent());
		
		// 수정한 내용을 실제 파일에 적용
		TransformerFactory transFactory = 
				TransformerFactory.newInstance();
		Transformer trans = transFactory.newTransformer(); // 작업실 생성
		
		// 파일을 저장하기전에 다양한 속성들을 미리 지정해 줄 수 있음
		trans.setOutputProperty(OutputKeys.ENCODING, "utf-8"); // utf-8로 되어있으면 굳이 안해도되긴하다
		trans.setOutputProperty(OutputKeys.INDENT, "yes"); // 자동 들여쓰기
		
		DOMSource source = new DOMSource(doc);
		// 덮어 씌우지 않으려고 test2.xml로 설정
		StreamResult result = new StreamResult(new FileOutputStream("C:\\maymin\\JspWork\\EclipseWork\\AjaxApp\\src\\main\\webapp\\dom\\test2.xml"));
	
		trans.transform(source, result);
	}
}
