package ma.zs.alc.service.impl.collaborator.grpe;

public class StatisticEtudiantDto {


    private Long totalCourses ;
    private Long nreCoursesComing ;
    private Long nreCoursesCompleted ;
    private Long nreCourses ;


    public Long getNreCoursesComing() {
        return nreCoursesComing;
    }
    public Long getTotalCourses() {
        return totalCourses;
    }

    public void setTotalCourses(Long totalCourses) {
        this.totalCourses = totalCourses;
    }
    public void setNreCoursesComing(Long nreCoursesComing) {
        this.nreCoursesComing = nreCoursesComing;
    }

    public Long getNreCoursesCompleted() {
        return nreCoursesCompleted;
    }

    public void setNreCoursesCompleted(Long nreCoursesCompleted) {
        this.nreCoursesCompleted = nreCoursesCompleted;
    }

    public Long getNreCourses() {
        return nreCourses;
    }

    public void setNreCourses(Long nreCourses) {
        this.nreCourses = nreCourses;
    }
}
