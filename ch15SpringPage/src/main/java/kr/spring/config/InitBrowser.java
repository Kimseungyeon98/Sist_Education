package kr.spring.config;

import java.awt.Desktop;
import java.net.URI;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Component;

//서버 실행시 웹 자동 부팅
@Component
public class InitBrowser{
	@PostConstruct
	public void init() {
		String url = "http://localhost:8000/";
		System.setProperty("java.awt.headless","false");
		try {
			Desktop.getDesktop().browse(URI.create(url));
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}