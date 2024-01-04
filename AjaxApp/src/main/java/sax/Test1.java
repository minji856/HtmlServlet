package sax;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

public class Test1 extends DefaultHandler {
	int cnt =0;
	
	@Override
	public void startDocument() throws SAXException {
		System.out.println("문서의 시작");
	}

	@Override
	public void endDocument() throws SAXException {
		System.out.println("문서의 끝");
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		System.out.println("시작 태그 : " + qName + ", " + attributes);
		
		// 키 값으로
		System.out.println(attributes.getValue("age") + ", "
				+ attributes.getValue("addr"));
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		System.out.println("끝 태그 : " + qName);
	}

	@Override
	// 안에 있는 글자들을 만났을 때
	public void characters(char[] ch, int start, int length) throws SAXException {
		System.out.println("-------------------------------");
		System.out.println(cnt++);
		System.out.println(start + " : " + length);
		
		for(int i=start; i<start+length; i++) {
			System.out.print(ch[i]);
		}
		System.out.println();
		System.out.println("-------------------------------");
	}
	
	public static void main(String[] args) throws ParserConfigurationException, SAXException, IOException {
		SAXParserFactory factory =
				SAXParserFactory.newInstance();
		
		SAXParser parser = factory.newSAXParser();
		
		// dom방식과 차이나는 부분 파일의 내용을 가져오는게 아니라 meta정보만 가져오는거다
		
		File f = new File("C:\\maymin\\JspWork\\EclipseWork\\AjaxApp\\src\\main\\webapp\\sax\\test.xml");
		Test1 test1 = new Test1(); // 파일을 읽어올 객체를 생성해 줘야함
		
		parser.parse(f, test1);
	}

	
}
