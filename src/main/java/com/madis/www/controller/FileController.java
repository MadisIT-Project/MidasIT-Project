package com.madis.www.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.madis.www.model.dao.impl.MypageDaoImpl;
import com.madis.www.model.dto.ImageInfo;
import com.madis.www.services.FileService;

@Controller
@RequestMapping("/file")
public class FileController {

	private String fileDir = "c:\\\\file\\\\profile\\\\";

	@Autowired
	private FileService fileService;

	@RequestMapping(value = "/menu/{fname:.+}", method = RequestMethod.GET)
	public void imageDown(@PathVariable String fname, HttpServletResponse response) {

		String fileDir = "c:\\\\file\\\\menu\\\\";
		System.out.println(fileDir);
		System.out.println(fname);
		
		File file = null;
		file = new File(fileDir + fname + ".jpg");

		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			String fileName = URLEncoder.encode(fname, "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
			byte[] b = new byte[1024];
			while (fis.read(b) != -1) {
				os.write(b);
			}
			os.flush();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e) {
				}
		}
	}

	@RequestMapping(value = "/download/{fname:.+}", method = RequestMethod.GET)
	public void download(@PathVariable String fname, HttpServletResponse response) {

		System.out.println(fileDir);
		System.out.println(fname);
		File file = null;
		if (fileService.isImageFile(fname)) {
			System.out.println("true");
			file = new File(fileDir + fname);
		} else {
			System.out.println("false");
			file = new File(fileDir + "default.png");
		}

		FileInputStream fis = null;

		try {
			fis = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			String fileName = URLEncoder.encode(fname, "utf-8");
			response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
			byte[] b = new byte[1024];
			while (fis.read(b) != -1) {
				os.write(b);
			}
			os.flush();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (fis != null)
				try {
					fis.close();
				} catch (IOException e) {
				}
		}
	}

	@RequestMapping(value = "/menuImageUpload", method = RequestMethod.POST)
	public String menuImageUpload(ImageInfo imageInfo, @RequestParam("imageName") String fname) throws IOException {
		System.out.println("enter image upload");
		System.out.println("fname: " + fname);
		fileService.uploadImageFile(imageInfo, fname);

		return "/admin/menu/menuManage";
	}
}
