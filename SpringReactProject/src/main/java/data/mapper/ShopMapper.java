package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ShopDto;

@Mapper
public interface ShopMapper {
   public void insertShop(ShopDto dto); //dto로 받음
   public List<ShopDto> getShopDatas();
   public ShopDto getData(int num);
   public void deleteShop(int num);
}