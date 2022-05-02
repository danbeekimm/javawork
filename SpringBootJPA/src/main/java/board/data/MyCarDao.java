package board.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository //자동으로 bean으로 등록
public class MyCarDao {

	@Autowired //자동주입
	MyCarDaoInter daoInter;
	
	//insert
	public void insertCar(MyCarDto dto)
	{
		daoInter.save(dto);
	}
}
