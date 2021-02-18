package diplom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication()
@EntityScan("diplom.model")
@EnableJpaRepositories("diplom.reposit")
public class TroshkoApplication {

    public static void main(String[] args) {
        SpringApplication.run(TroshkoApplication.class, args);
    }

}
