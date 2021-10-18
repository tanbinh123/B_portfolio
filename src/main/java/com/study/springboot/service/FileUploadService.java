package com.study.springboot.service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	// 리눅스 기준으로 파일 경로를 작성 ( 루트 경로인 /으로 시작한다. )
	// 윈도우라면 workspace의 드라이브를 파악하여 JVM이 알아서 처리해준다.
	// 따라서 workspace가 C드라이브에 있다면 C드라이브에 
	// upload 폴더를 생성해 놓아야 한다.
	//디폴트는 C:/upload폴더에 생성됨.
	private static String SAVE_PATH = "/upload/"; 
	private static String PREFIX_URL = "/upload/";
	
	public String restore(MultipartFile multipartFile) {
		
		String url = null;
		String savepath = "";
		try {
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\bin\main\static\ upload
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\src\main\resources\static\ upload
			//C:\Users\Gi7A-00\Documents\SprintBoot\Ex26_FileUploadParam\src\main\resources\static
			savepath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
			savepath = savepath.replace("\\", "/");
			System.out.println("savepath2 : " + savepath);
			savepath = savepath.replace("/target/classes/static", "/src/main/resources/static");
			System.out.println("savepath3 : " + savepath);
			SAVE_PATH = savepath;
			PREFIX_URL = savepath;
			
			// 파일 정보
			String originFilename = multipartFile.getOriginalFilename();
			String extName
				= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = multipartFile.getSize();
			
			// 서버에서 저장 할 파일 이름
			String saveFileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(multipartFile, saveFileName);
			url = PREFIX_URL + "/" + saveFileName;
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		return url;
	}
	
	
	// 현재 시간을 기준으로 파일 이름 생성
	public String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	public String items_img_name(MultipartFile multipartFile) {

		String originFilename = multipartFile.getOriginalFilename();
		String extName
		= originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		String saveFileName = genSaveFileName(extName);
		
		return saveFileName;
	}
	// 파일을 실제로 write 하는 메서드
	private void writeFile(MultipartFile multipartFile, String saveFileName)
								throws IOException{
		System.out.println("savefile:" + SAVE_PATH + "/" + saveFileName );
		
		byte[] data = multipartFile.getBytes();
		FileOutputStream fos = new FileOutputStream(SAVE_PATH + "/" + saveFileName);
		fos.write(data);
		fos.close();
		
		return;
	}
}