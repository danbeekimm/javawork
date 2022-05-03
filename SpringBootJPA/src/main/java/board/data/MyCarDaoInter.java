package board.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

//2개의 인터페이스가 있다 둘중하나 아무거나 사용가능
//public interface MyCarDaoInter extends CrudRepository<MyCarDto, Long>{
//
//}

//이거더많이씀
//sql문으로 실행되도록
	//기능구현 미리한 메소드임JpaRepository

public interface MyCarDaoInter extends JpaRepository<MyCarDto, Long>{ 
}