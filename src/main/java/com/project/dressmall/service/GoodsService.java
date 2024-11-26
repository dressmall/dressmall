package com.project.dressmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.dressmall.mapper.GoodsCategoryMapper;
import com.project.dressmall.mapper.GoodsMapper;
import com.project.dressmall.util.TeamColor;
import com.project.dressmall.vo.Goods;
import com.project.dressmall.vo.GoodsCategory;
import com.project.dressmall.vo.GoodsFile;
import com.project.dressmall.vo.GoodsForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class GoodsService {
	@Autowired GoodsMapper goodsMapper;
	@Autowired GoodsCategoryMapper goodsCategoryMapper;
	
	// /on/staff/addGoods : 상품등록
	public void addGoods(GoodsForm goodsForm, String path) {
		// goodsForm -> goods
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
		
		// goods insert
		int row1 = goodsMapper.insertGoods(goods);
		int goodsNo = goods.getGoodsNo();	// insert시 자동 생성되는 goodsNo 값 받아옴
		
		log.debug(TeamColor.KIM +"goodsNo: " + goodsNo + TeamColor.RESET);
		log.debug(TeamColor.KIM +"categoryNo: " + goodsForm.getCategoryNo() + TeamColor.RESET);
		
		// goodsForm -> goodsCategory
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goodsNo);
		goodsCategory.setCategoryNo(goodsForm.getCategoryNo());

		// goods_category insert
		int row2 = goodsCategoryMapper.insertGoodsCategory(goodsCategory);
		
		// insert goods, goods_category 성공하고 file이 있으면
		if(row1 == 1 && row2 == 1 && goodsForm.getGoodsFile() != null) {
			MultipartFile mf = goodsForm.getGoodsFile();
			
			GoodsFile goodsFile = new GoodsFile();
			goodsFile.setGoodsNo(goodsNo);
			
			
		}
		
		
		
	}
}
