package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"com.example.demo","board.*"})
@EntityScan("board.*") //entity 클래스를 가진 패키지를 등록
@EnableJpaRepositories("board.data")
//JpaRepository에 대한 설정정보를 자동적으로 로딩하고 그정보를 토대로repository빈을 
//자동으로 등록하는 역할을 한다 dao,dto페키지이름


public class SpringBootJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootJpaApplication.class, args);
	}

}
