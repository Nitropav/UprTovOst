package diplom.service;

import diplom.model.Residual;
import diplom.reposit.ResidualReposit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class ResidualService {

    @Autowired
    private ResidualReposit residualReposit;

    @Transactional
    public List<Residual> loadResidualByName(String name) {
        return residualReposit.findByName(name);
    }

    @Transactional
    public Iterable<Residual> loadAllResiduals() {
        return residualReposit.findAll();
    }

    @Transactional
    public void deleteResidual(Residual residual) {
        residualReposit.delete(residual);
    }
}
