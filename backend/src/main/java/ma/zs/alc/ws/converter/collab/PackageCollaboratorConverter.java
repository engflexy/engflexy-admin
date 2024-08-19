package  ma.zs.alc.ws.converter.collab;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




import ma.zs.alc.zynerator.util.StringUtil;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.ws.dto.collab.PackageCollaboratorDto;

@Component
public class PackageCollaboratorConverter extends AbstractConverter<PackageCollaborator, PackageCollaboratorDto> {


    public  PackageCollaboratorConverter() {
        super(PackageCollaborator.class, PackageCollaboratorDto.class);
    }

    @Override
    public PackageCollaborator toItem(PackageCollaboratorDto dto) {
        if (dto == null) {
            return null;
        } else {
        PackageCollaborator item = new PackageCollaborator();
            if(StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if(StringUtil.isNotEmpty(dto.getSchool()))
                item.setSchool(dto.getSchool());

            if(StringUtil.isNotEmpty(dto.getLibelle()))
                item.setLibelle(dto.getLibelle());
            if(StringUtil.isNotEmpty(dto.getNbrStudentBase()))
                item.setNbrStudentBase(dto.getNbrStudentBase());
            if(StringUtil.isNotEmpty(dto.getPriceBase()))
                item.setPriceBase(dto.getPriceBase());
            if(StringUtil.isNotEmpty(dto.getPriceBaseOld()))
                item.setPriceBaseOld(dto.getPriceBaseOld());
            if(StringUtil.isNotEmpty(dto.getPriceLogo()))
                item.setPriceLogo(dto.getPriceLogo());
            if(StringUtil.isNotEmpty(dto.getPriceLogoOld()))
                item.setPriceLogoOld(dto.getPriceLogoOld());
            if(StringUtil.isNotEmpty(dto.getPriceColor()))
                item.setPriceColor(dto.getPriceColor());
            if(StringUtil.isNotEmpty(dto.getPriceColorOld()))
                item.setPriceColorOld(dto.getPriceColorOld());
            if(StringUtil.isNotEmpty(dto.getPriceBannerAd()))
                item.setPriceBannerAd(dto.getPriceBannerAd());
            if(StringUtil.isNotEmpty(dto.getPriceBannerAdOld()))
                item.setPriceBannerAdOld(dto.getPriceBannerAdOld());



        return item;
        }
    }

    @Override
    public PackageCollaboratorDto toDto(PackageCollaborator item) {
        if (item == null) {
            return null;
        } else {
            PackageCollaboratorDto dto = new PackageCollaboratorDto();
            if(StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if(StringUtil.isNotEmpty(item.getSchool()))
                dto.setSchool(item.getSchool());

            if(StringUtil.isNotEmpty(item.getLibelle()))
                dto.setLibelle(item.getLibelle());
            if(StringUtil.isNotEmpty(item.getNbrStudentBase()))
                dto.setNbrStudentBase(item.getNbrStudentBase());
            if(StringUtil.isNotEmpty(item.getPriceBase()))
                dto.setPriceBase(item.getPriceBase());
            if(StringUtil.isNotEmpty(item.getPriceBaseOld()))
                dto.setPriceBaseOld(item.getPriceBaseOld());
            if(StringUtil.isNotEmpty(item.getPriceLogo()))
                dto.setPriceLogo(item.getPriceLogo());
            if(StringUtil.isNotEmpty(item.getPriceLogoOld()))
                dto.setPriceLogoOld(item.getPriceLogoOld());
            if(StringUtil.isNotEmpty(item.getPriceColor()))
                dto.setPriceColor(item.getPriceColor());
            if(StringUtil.isNotEmpty(item.getPriceColorOld()))
                dto.setPriceColorOld(item.getPriceColorOld());
            if(StringUtil.isNotEmpty(item.getPriceBannerAd()))
                dto.setPriceBannerAd(item.getPriceBannerAd());
            if(StringUtil.isNotEmpty(item.getPriceBannerAdOld()))
                dto.setPriceBannerAdOld(item.getPriceBannerAdOld());


        return dto;
        }
    }




    public void initObject(boolean value) {
    }


}
