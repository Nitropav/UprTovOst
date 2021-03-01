package diplom.model;

import java.io.Serializable;

public class LabelRepository implements Serializable {
    private String date;
    private String name;

    public LabelRepository(String date, String name) {
        this.date = date;
        this.name = name;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
