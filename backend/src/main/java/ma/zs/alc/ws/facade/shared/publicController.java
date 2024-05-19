package ma.zs.alc.ws.facade.shared;

import ma.zs.alc.util.ImageUtil;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static ma.zs.alc.util.UtilConstant.FORWARD_SLASH;
import static ma.zs.alc.util.UtilConstant.IMAGE_FOLDER;
import static org.springframework.http.MediaType.IMAGE_JPEG_VALUE;


@RestController
@RequestMapping("/app/images")
public class publicController {

    @PostMapping(value = "/generate-image-url/{fileName}",
            consumes = {"multipart/form-data", MediaType.APPLICATION_JSON_VALUE})
    public String generate_img_url(@PathVariable String fileName,
                                   @RequestParam(value = "img") MultipartFile img) throws IOException {
        return ImageUtil.generate_img_url(fileName, img);
    }

    @GetMapping(path = "{entity}/{imageName}", produces = IMAGE_JPEG_VALUE)
    public byte[] getProfileImage(@PathVariable("entity") String entity,
                                  @PathVariable("imageName") String image) throws IOException {
        return Files.readAllBytes(Paths.get(IMAGE_FOLDER + entity + FORWARD_SLASH + image));
    }

}
