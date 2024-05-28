package ma.zs.alc.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;

import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;
import static ma.zs.alc.util.RandomStringGenerator.generateRandomString;
import static ma.zs.alc.util.UtilConstant.*;
import static org.springframework.http.MediaType.*;

public abstract class ImageUtil {


    public static String generate_img_url(String file_name, MultipartFile img) throws IOException {
        String url = "";
        if (img != null) {
            System.out.println("img = " + img.getSize());
            System.out.println("img = " + img.getContentType());
            if (!Arrays.asList(IMAGE_JPEG_VALUE, "image/webp", IMAGE_PNG_VALUE, IMAGE_GIF_VALUE).contains(img.getContentType())) {
                throw new RuntimeException(img.getOriginalFilename() + NOT_AN_IMAGE_FILE);
            }
            Path userFolder;
            do {
                userFolder = Paths.get(IMAGE_FOLDER + file_name).toAbsolutePath().normalize();
                if (!Files.exists(userFolder)) {
                    Files.createDirectories(userFolder);
                } else {
                    file_name = generateRandomString();
                    userFolder = null;
                }
            } while (userFolder == null);

            Files.copy(img.getInputStream(), userFolder.resolve(file_name + DOT + JPG_EXTENSION), REPLACE_EXISTING);
            url = setProfileImageUrl(file_name);
            System.out.println("url = " + url);
        }
        return url;
    }

    private static String setProfileImageUrl(String fileName) {
//        String url = "https://api.engflexy.com/superadmin";
        String url = "http://localhost:8036";
        String imageUrl = url + IMAGE_PATH + fileName + FORWARD_SLASH + fileName + DOT + JPG_EXTENSION;
        System.out.println("url = " + imageUrl);
        return imageUrl;
    }

}
