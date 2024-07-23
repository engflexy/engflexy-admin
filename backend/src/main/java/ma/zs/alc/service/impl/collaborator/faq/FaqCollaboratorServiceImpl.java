package ma.zs.alc.service.impl.collaborator.faq;


import ma.zs.alc.bean.core.faq.Faq;
import ma.zs.alc.dao.criteria.core.faq.FaqCriteria;
import ma.zs.alc.dao.facade.core.faq.FaqDao;
import ma.zs.alc.dao.specification.core.faq.FaqSpecification;
import ma.zs.alc.service.facade.collaborator.faq.FaqCollaboratorService;
import ma.zs.alc.ws.converter.faq.FaqTypeConverter;
import ma.zs.alc.ws.dto.faq.FaqDto;
import ma.zs.alc.ws.dto.faq.FaqTypeDto;
import ma.zs.alc.zynerator.service.AbstractServiceImpl;
import ma.zs.alc.zynerator.util.ListUtil;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;

import ma.zs.alc.service.facade.collaborator.faq.FaqTypeCollaboratorService;
import ma.zs.alc.bean.core.faq.FaqType;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FaqCollaboratorServiceImpl extends AbstractServiceImpl<Faq, FaqCriteria, FaqDao> implements FaqCollaboratorService {


    @Autowired
    private FaqTypeConverter faqTypeConverter;


    @Override
    public Faq update(Faq faq) {
        if (faq.getId() != null) {
            Faq saved = findById(faq.getId());
            saved.setAnswer(faq.getAnswer());
            saved.setQuestion(faq.getQuestion());
            saved.setFaqType(faqTypeService.findById(faq.getFaqType().getId()));
            return dao.saveAndFlush(saved);
        }
        return null;
    }

    public void findOrSaveAssociatedObject(Faq t) {
        if (t != null) {
            t.setFaqType(faqTypeService.findOrSave(t.getFaqType()));
        }
    }

    public List<Faq> findByFaqTypeId(Long id) {
        return dao.findByFaqTypeId(id);
    }

    public int deleteByFaqTypeId(Long id) {
        return dao.deleteByFaqTypeId(id);
    }

    public long countByFaqTypeId(Long id) {
        return dao.countByFaqTypeId(id);
    }

    public List<Faq> findAllOptimized() {
        return dao.findAllOptimized();
    }


    public void configure() {
        super.configure(Faq.class, FaqSpecification.class);
    }


    @Autowired
    private FaqTypeCollaboratorService faqTypeService;

    public FaqCollaboratorServiceImpl(FaqDao dao) {
        super(dao);
    }

    //liste des faq
    public List<Faq> findAll() {
        return dao.findAll();
    }

}
