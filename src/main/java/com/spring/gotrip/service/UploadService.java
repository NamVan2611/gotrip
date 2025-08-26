package com.spring.gotrip.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile multipartFile, String targetFolder){
        if(multipartFile.isEmpty()){
            return null;
        }
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String finalName = null;
        try {
            byte[] bytes = multipartFile.getBytes();
            File dir = new File(rootPath + File.separator + targetFolder);
            if(!dir.exists()){
                dir.mkdirs();
            }
            finalName = System.currentTimeMillis() + "-" + multipartFile.getOriginalFilename();
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(serverFile));
            bufferedOutputStream.write(bytes);
            bufferedOutputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return finalName;
    }
}
