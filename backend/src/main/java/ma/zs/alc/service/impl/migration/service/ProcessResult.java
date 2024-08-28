package ma.zs.alc.service.impl.migration.service;

import java.util.ArrayList;
import java.util.List;

public class ProcessResult {
    int count;
    List<String> infos= new ArrayList<>();
    int infoSize;
    List<String> errors= new ArrayList<>();

    public int getInfoSize() {
        return infoSize;
    }

    public void setInfoSize(int infoSize) {
        this.infoSize = infoSize;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<String> getInfos() {
        return infos;
    }

    public void setInfos(List<String> infos) {
        this.infos = infos;
    }

    public List<String> getErrors() {
        return errors;
    }

    public void setErrors(List<String> errors) {
        this.errors = errors;
    }
}
