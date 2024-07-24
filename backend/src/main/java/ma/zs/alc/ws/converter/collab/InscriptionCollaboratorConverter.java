package ma.zs.alc.ws.converter.collab;

import ma.zs.alc.bean.core.collab.InscriptionCollaborator;
import ma.zs.alc.bean.core.collab.InscriptionCollaboratorState;
import ma.zs.alc.bean.core.collab.PackageCollaborator;
import ma.zs.alc.bean.core.common.Collaborator;
import ma.zs.alc.ws.converter.vocab.CollaboratorConverter;
import ma.zs.alc.ws.dto.collab.InscriptionCollaboratorDto;
import ma.zs.alc.zynerator.converter.AbstractConverter;
import ma.zs.alc.zynerator.util.DateUtil;
import ma.zs.alc.zynerator.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class InscriptionCollaboratorConverter extends AbstractConverter<InscriptionCollaborator, InscriptionCollaboratorDto> {

    @Autowired
    private CollaboratorConverter collaboratorConverter;
    @Autowired
    private InscriptionCollaboratorStateConverter inscriptionCollaboratorStateConverter;
    @Autowired
    private PackageCollaboratorConverter packageCollaboratorConverter;
    private boolean packageCollaborator;
    private boolean collaborator;
    private boolean inscriptionCollaboratorState;

    public InscriptionCollaboratorConverter() {
        super(InscriptionCollaborator.class, InscriptionCollaboratorDto.class);
        init(true);
    }

    @Override
    public InscriptionCollaborator toItem(InscriptionCollaboratorDto dto) {
        if (dto == null) {
            return null;
        } else {
            InscriptionCollaborator item = new InscriptionCollaborator();
            if (StringUtil.isNotEmpty(dto.getId()))
                item.setId(dto.getId());
            if (StringUtil.isNotEmpty(dto.getPrice()))
                item.setPrice(dto.getPrice());
            if (StringUtil.isNotEmpty(dto.getNbrStudent()))
                item.setNbrStudent(dto.getNbrStudent());
            if (dto.getLogo() != null)
                item.setLogo(dto.getLogo());
            if (dto.getColor() != null)
                item.setColor(dto.getColor());
            if (dto.getBannerAd() != null)
                item.setBannerAd(dto.getBannerAd());
            if (StringUtil.isNotEmpty(dto.getStartDate()))
                item.setStartDate(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_STANDARD,dto.getStartDate()));
            if (StringUtil.isNotEmpty(dto.getEndDate()))
                item.setEndDate(DateUtil.stringEnToDate(DateUtil.DATE_FORMAT_STANDARD,dto.getEndDate()));
            if (this.packageCollaborator && dto.getPackageCollaborator() != null)
                item.setPackageCollaborator(packageCollaboratorConverter.toItem(dto.getPackageCollaborator()));

            if (dto.getCollaborator() != null && dto.getCollaborator().getId() != null) {
                item.setCollaborator(new Collaborator());
                item.getCollaborator().setId(dto.getCollaborator().getId());
                item.getCollaborator().setId(dto.getCollaborator().getId());
            }

            if (this.inscriptionCollaboratorState && dto.getInscriptionCollaboratorState() != null)
                item.setInscriptionCollaboratorState(inscriptionCollaboratorStateConverter.toItem(dto.getInscriptionCollaboratorState()));


            return item;
        }
    }

    @Override
    public InscriptionCollaboratorDto toDto(InscriptionCollaborator item) {
        if (item == null) {
            return null;
        } else {
            InscriptionCollaboratorDto dto = new InscriptionCollaboratorDto();
            if (StringUtil.isNotEmpty(item.getId()))
                dto.setId(item.getId());
            if (StringUtil.isNotEmpty(item.getPrice()))
                dto.setPrice(item.getPrice());
            if (StringUtil.isNotEmpty(item.getNbrStudent()))
                dto.setNbrStudent(item.getNbrStudent());
            dto.setLogo(item.getLogo());
            dto.setColor(item.getColor());
            dto.setBannerAd(item.getBannerAd());
            if (item.getStartDate() != null)
                dto.setStartDate(DateUtil.dateTimeToString(item.getStartDate()));
            if (item.getEndDate() != null)
                dto.setEndDate(DateUtil.dateTimeToString(item.getEndDate()));
            if (this.packageCollaborator && item.getPackageCollaborator() != null) {
                dto.setPackageCollaborator(packageCollaboratorConverter.toDto(item.getPackageCollaborator()));

            }
            if (this.collaborator && item.getCollaborator() != null) {
                dto.setCollaborator(collaboratorConverter.toDto(item.getCollaborator()));

            }
            if (this.inscriptionCollaboratorState && item.getInscriptionCollaboratorState() != null) {
                dto.setInscriptionCollaboratorState(inscriptionCollaboratorStateConverter.toDto(item.getInscriptionCollaboratorState()));

            }


            return dto;
        }
    }

    public void copy(InscriptionCollaboratorDto dto, InscriptionCollaborator t) {
        super.copy(dto, t);
        if (t.getPackageCollaborator() == null && dto.getPackageCollaborator() != null) {
            t.setPackageCollaborator(new PackageCollaborator());
        }
        if (t.getCollaborator() == null && dto.getCollaborator() != null) {
            t.setCollaborator(new Collaborator());
        }
        if (t.getInscriptionCollaboratorState() == null && dto.getInscriptionCollaboratorState() != null) {
            t.setInscriptionCollaboratorState(new InscriptionCollaboratorState());
        }
        if (dto.getPackageCollaborator() != null)
            packageCollaboratorConverter.copy(dto.getPackageCollaborator(), t.getPackageCollaborator());
        if (dto.getCollaborator() != null)
            collaboratorConverter.copy(dto.getCollaborator(), t.getCollaborator());
        if (dto.getInscriptionCollaboratorState() != null)
            inscriptionCollaboratorStateConverter.copy(dto.getInscriptionCollaboratorState(), t.getInscriptionCollaboratorState());
    }


    public void initObject(boolean value) {
        this.packageCollaborator = value;
        this.collaborator = value;
        this.inscriptionCollaboratorState = value;
    }


    public CollaboratorConverter getCollaboratorConverter() {
        return this.collaboratorConverter;
    }

    public void setCollaboratorConverter(CollaboratorConverter collaboratorConverter) {
        this.collaboratorConverter = collaboratorConverter;
    }

    public InscriptionCollaboratorStateConverter getInscriptionCollaboratorStateConverter() {
        return this.inscriptionCollaboratorStateConverter;
    }

    public void setInscriptionCollaboratorStateConverter(InscriptionCollaboratorStateConverter inscriptionCollaboratorStateConverter) {
        this.inscriptionCollaboratorStateConverter = inscriptionCollaboratorStateConverter;
    }

    public PackageCollaboratorConverter getPackageCollaboratorConverter() {
        return this.packageCollaboratorConverter;
    }

    public void setPackageCollaboratorConverter(PackageCollaboratorConverter packageCollaboratorConverter) {
        this.packageCollaboratorConverter = packageCollaboratorConverter;
    }

    public boolean isPackageCollaborator() {
        return this.packageCollaborator;
    }

    public void setPackageCollaborator(boolean packageCollaborator) {
        this.packageCollaborator = packageCollaborator;
    }

    public boolean isCollaborator() {
        return this.collaborator;
    }

    public void setCollaborator(boolean collaborator) {
        this.collaborator = collaborator;
    }

    public boolean isInscriptionCollaboratorState() {
        return this.inscriptionCollaboratorState;
    }

    public void setInscriptionCollaboratorState(boolean inscriptionCollaboratorState) {
        this.inscriptionCollaboratorState = inscriptionCollaboratorState;
    }
}
