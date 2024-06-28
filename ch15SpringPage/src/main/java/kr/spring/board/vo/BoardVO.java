package kr.spring.board.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private long board_num;
	@NotBlank
	private String category;
	@NotBlank
	private String title;
	@NotEmpty
	private String content;
	private int hit;
	private Date reg_date;
	private Date modify_date;
	private MultipartFile upload;
	private String filename;
	private String ip;
	private long mem_num;
	
	private String id;
	private String nick_name;
	
	private int re_cnt;
	private int fav_cnt;
	
}
