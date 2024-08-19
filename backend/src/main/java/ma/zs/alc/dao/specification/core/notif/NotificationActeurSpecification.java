package ma.zs.alc.dao.specification.core.notif;


import ma.zs.alc.bean.core.notif.NotificationActeur;
import ma.zs.alc.dao.criteria.core.notif.NotificationActeurCriteria;
import ma.zs.alc.zynerator.specification.AbstractSpecification;

public class NotificationActeurSpecification extends AbstractSpecification<NotificationActeurCriteria, NotificationActeur> {

    @Override
    public void constructPredicates() {
        addPredicateId("id", criteria);
        addPredicate("icon", criteria.getIcon(),criteria.getIconLike());
        addPredicate("title", criteria.getTitle(),criteria.getTitleLike());
        addPredicate("description", criteria.getDescription(),criteria.getDescriptionLike());
        addPredicate("time", criteria.getTime(), criteria.getTimeFrom(), criteria.getTimeTo());
        addPredicateBool("read", criteria.getRead());
        addPredicate("link", criteria.getLink(),criteria.getLinkLike());
        addPredicateBool("useRouter", criteria.getUseRouter());
        addPredicateBool("communicationEnabled", criteria.getCommunicationEnabled());
        addPredicateBool("securityEnabled", criteria.getSecurityEnabled());
        addPredicateBool("lessonReminderEnabled", criteria.getLessonReminderEnabled());
        addPredicateBool("classroomEnabled", criteria.getClassroomEnabled());
        addPredicateBool("passwordChangedNotificationEnabled", criteria.getPasswordChangedNotificationEnabled());
        addPredicateBool("contactNotificationEnabled", criteria.getContactNotificationEnabled());
    }

    public NotificationActeurSpecification(NotificationActeurCriteria criteria) {
        super(criteria);
    }

    public NotificationActeurSpecification(NotificationActeurCriteria criteria, boolean distinct) {
        super(criteria, distinct);
    }

}
