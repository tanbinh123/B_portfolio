package com.study.springboot;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.study.springboot.service.FileUploadService;
import com.study.springboot.service.ShoppingItemsService;

@Controller
public class FileUploadController {
	@Autowired
	private ServletContext context;
	

	@RequestMapping("/uploadForm")
	public String uploadForm() throws Exception{

		
		
		return "FileUpload/fileForm";
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(200000000);
		multipartResolver.setMaxInMemorySize(200000000);
		multipartResolver.setDefaultEncoding("utf-8");
		return multipartResolver;
	}

	@Autowired
	private FileUploadService fileUploadService;
	
	@Autowired
	public ShoppingItemsService shoppingItemsService;
	
	@RequestMapping(value = "/uploadOk", method = RequestMethod.POST)
	public @ResponseBody String uploadOk(
			Model model, 
			@RequestParam("items_name") String items_name,
			@RequestParam("items_email") String items_email,
			@RequestParam("items_title") String items_title,
			@RequestParam("items_price") int items_price,
			@RequestParam("items_numb") int items_numb,
			@RequestParam("items_status") int items_status, 
			@RequestParam("items_member_idx") int items_member_idx, 
			@RequestParam("file") MultipartFile file) {

		System.out.println("items_name:" + items_name);
		System.out.println("items_email:" + items_email);
		System.out.println("items_title:" + items_title);
		System.out.println("items_price:" + items_price);
		System.out.println("items_numb:" + items_numb);
		System.out.println("items_status:" + items_status);
		System.out.println("items_member_idx:" + items_member_idx);
		

		String url = fileUploadService.restore(file);

		String items_img = fileUploadService.items_img_name(file);
		
		System.out.println("items_img:" + items_img);
		
		int result;
		result = shoppingItemsService.shopping_items_write(items_img, items_title, items_price, items_numb, items_status, items_name, items_email, items_member_idx);
		
		
		System.out.println("url:" + url);
		model.addAttribute("url", url);
		return "파일업로드 성공 - 경로:"+url;

	}
}
