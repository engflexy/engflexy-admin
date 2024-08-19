package ma.zs.alc.ws.converter.inscriptionref;

import org.springframework.stereotype.Component;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.bean.core.inscriptionref.Langue;
import ma.zs.alc.ws.dto.inscriptionref.LangueDto;

@Component
public class LangueConverter extends AbstractConverter<Langue, LangueDto> {

    public LangueConverter() {
        super(Langue.class, LangueDto.class);
    }

    @Override
    public Langue toItem(LangueDto dto) {
        if (dto == null) {
            return null;
        }
        Langue item = new Langue();
        if (dto.getId() != null) {
            item.setId(dto.getId());
        }
        if (StringUtil.isNotEmpty(dto.getRef())) {
            item.setRef(dto.getRef());
        }
        if (StringUtil.isNotEmpty(dto.getLibelle())) {
            item.setLibelle(dto.getLibelle());
        }
        return item;
    }

    @Override
    public LangueDto toDto(Langue item) {
        if (item == null) {
            return null;
        }
        LangueDto dto = new LangueDto();
        if (item.getId() != null) {
            dto.setId(item.getId());
        }
        if (StringUtil.isNotEmpty(item.getRef())) {
            dto.setRef(item.getRef());
        }
        if (StringUtil.isNotEmpty(item.getLibelle())) {
            dto.setLibelle(item.getLibelle());
        }
        return dto;
    }

    public void initObject(boolean value) {
        // Implement initialization logic if needed
    }
}
