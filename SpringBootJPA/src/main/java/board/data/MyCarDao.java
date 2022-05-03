package board.data;

import java.util.List;

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
	
	//list
	public List<MyCarDto> getAllCars()
	{
		List<MyCarDto> list=daoInter.findAll();
		return list;
	}

	//수정폼에서 필요한것
	public MyCarDto getmyCar(Long num)  
	{
		return daoInter.getById(num);
	}
	//수정
	public void updateCar(MyCarDto dto)
	{
		daoInter.save(dto); //num있으면 update 없으면 insert됨
	}
	//삭제
	public void deleteCar(Long num)
	{
		daoInter.deleteById(num);
	}
}
