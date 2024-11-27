package com.project.dressmall.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.dressmall.mapper.GoodsCategoryMapper;
import com.project.dressmall.mapper.GoodsFileMapper;
import com.project.dressmall.mapper.GoodsMapper;
import com.project.dressmall.util.InputFile;
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
	@Autowired GoodsFileMapper goodsFileMapper;
	@Autowired GoodsCategoryMapper goodsCategoryMapper;
	
	
	// /on/staff/removeGoods : 관리자페이지에서 상품 삭제. (김혜린)
	public void removeGoods(Integer goodsNo, String path) {
		// 1) goods_category 삭제
		goodsCategoryMapper.deleteGoodsCategoryByGoods(goodsNo);
		// 2) goods_file 삭제
		Map<String, Object> file = goodsMapper.selectGoodsOne(goodsNo); // 삭제할 goodsFile 물리적 파일이름 정보.
		Integer row1 = goodsFileMapper.deleteGoodsFile((Integer)file.get("goodsFileNo"));
		// 3) goods 삭제
		Integer row2 = goodsMapper.deleteGoods(goodsNo);
		// 4) 물리적 파일 삭제
		if (row1 == 1 && row2 == 1) { // 데이터베이스에서 goods_file 정보가 삭제되었다면 물리적 파일 삭제.
			String fullname = path + (String)file.get("goodsFileName") + "." + (String)file.get("goodsFileExt");
			File f = new File(fullname); 
			f.delete();
		}
	}
	
	// /on/staff/goodsOne : 상품 상세페이지 출력. (김혜린)
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 조회.(진수우)
	public Map<String, Object> getGoodsOne(Integer goodsNo) {
		return goodsMapper.selectGoodsOne(goodsNo);
	}
	
	// /on/staff/modifyGoods : 상품수정페이지에서 상품정보 수정.(진수우)
	public void modifiyGoods(GoodsForm goodsForm, String path, Integer goodsNo) {
		// goodsForm -> goods
		Goods goods = new Goods();
		goods.setGoodsNo(goodsNo);
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
		// goods 테이블 데이터 수정.
		Integer goodsRow = goodsMapper.updateGoods(goods);
		log.debug(TeamColor.JIN+"goodsNo: " + goodsForm.getGoodsNo() + TeamColor.RESET);
		log.debug(TeamColor.JIN +"categoryNo: " + goodsForm.getCategoryNo() + TeamColor.RESET);
		
		// goodsForm -> goodsCategory
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goodsNo);
		goodsCategory.setCategoryNo(goodsForm.getCategoryNo());

		// goods_category 테이블에 데이터 삽입.
		Integer goodsCategoryRow = goodsCategoryMapper.updateCategoryByGoods(goodsCategory);
		
		// goods 테이블, goods_category 테이블에 데이터 삽입이 성공했고 폼에 파일이 있으면,
		if(goodsRow == 1 && goodsCategoryRow == 1 && goodsForm.getGoodsFile() != null && !goodsForm.getGoodsFile().isEmpty()) {
			// 기존 파일 삭제.
			// 데이터베이스에서 삭제되기 전에 물리적인 파일이름을 먼저 가져옴.
			Map<String, Object> file = goodsMapper.selectGoodsOne(goodsNo); // 삭제할 goodsFile 물리적 파일이름 정보.
			Integer row = goodsFileMapper.deleteGoodsFile((Integer)file.get("goodsFileNo"));
			if (row == 1) { // 데이터베이스에서 goods_file 정보가 삭제되었다면 물리적 파일 삭제.
				String fullname = path + (String)file.get("goodsFileName") + "." + (String)file.get("goodsFileExt");
				File f = new File(fullname);
				f.delete();
			}
			
			// 파일이름 추출 관련.
			MultipartFile mf = goodsForm.getGoodsFile();
			log.debug(TeamColor.JIN + "폼에 입력된 파일명 : " + mf.getOriginalFilename() + TeamColor.RESET);
			InputFile inputFile = new InputFile();
			inputFile.setOriginFileName(mf.getOriginalFilename());
			
			// goods_file 테이블에 데이터를 삽입하기 위한 setter.
			GoodsFile goodsFile = new GoodsFile();
			goodsFile.setGoodsNo(goodsNo);
			goodsFile.setGoodsFileName(inputFile.getUUID());
			goodsFile.setGoodsFileOrigin(inputFile.getFileName());
			goodsFile.setGoodsFileExt(inputFile.getFileExt());
			goodsFile.setGoodsFileSize(mf.getSize());
			goodsFile.setGoodsFileType(mf.getContentType());
			
			// goods_file 테이블에 데이터 삽입 수행.
			Integer goodsFileRow = goodsFileMapper.insertGoodsFile(goodsFile);
			
			// 만약 goods_file 테이블에 데이터 삽입이 성공적으로 이루어졌다면,
			if (goodsFileRow == 1) {
				// 물리적으로 파일 저장.
				try {
					mf.transferTo(new File(path + goodsFile.getGoodsFileName() +"."+ goodsFile.getGoodsFileExt()));
				} catch (Exception e) {
					e.printStackTrace();
					// 예외가 발생할 때 예외처리를 생략해야 @Transactional가 작동하기때문에 RuntimeException을 인위적으로 발생.
					throw new RuntimeException();
				}
			}
		}
	}
	
	// /on/staff/addGoods : 관리자페이지에서 상품등록.(김혜린, 진수우)
	public void addGoods(GoodsForm goodsForm, String path) {
		// goodsForm -> goods
		Goods goods = new Goods();
		goods.setGoodsTitle(goodsForm.getGoodsTitle());
		goods.setGoodsMemo(goodsForm.getGoodsMemo());
		goods.setGoodsPrice(goodsForm.getGoodsPrice());
		goods.setGoodsState(goodsForm.getGoodsState());
		
		// goods 테이블에 데이터 삽입.
		Integer goodsRow = goodsMapper.insertGoods(goods);
		Integer goodsNo = goods.getGoodsNo(); // goods 테이블에 데이터 삽입 시 자동으로 생성되는 goodsNo 값 받아옴.
		log.debug(TeamColor.KIM +"goodsNo: " + goodsNo + TeamColor.RESET);
		log.debug(TeamColor.KIM +"categoryNo: " + goodsForm.getCategoryNo() + TeamColor.RESET);
		
		// goodsForm -> goodsCategory
		GoodsCategory goodsCategory = new GoodsCategory();
		goodsCategory.setGoodsNo(goodsNo);
		goodsCategory.setCategoryNo(goodsForm.getCategoryNo());

		// goods_category 테이블에 데이터 삽입.
		Integer goodsCategoryRow = goodsCategoryMapper.insertGoodsCategoryByGoods(goodsCategory);
		
		// goods 테이블, goods_category 테이블에 데이터 삽입이 성공했고 폼에 파일이 있으면,
		if(goodsRow == 1 && goodsCategoryRow == 1 && goodsForm.getGoodsFile() != null && !goodsForm.getGoodsFile().isEmpty()) {
			// 파일이름 추출 관련.
			MultipartFile mf = goodsForm.getGoodsFile();
			log.debug(TeamColor.JIN + "폼에 입력된 파일명 : " + mf.getOriginalFilename() + TeamColor.RESET);
			InputFile inputFile = new InputFile();
			inputFile.setOriginFileName(mf.getOriginalFilename());
			
			// goods_file 테이블에 데이터를 삽입하기 위한 setter.
			GoodsFile goodsFile = new GoodsFile();
			goodsFile.setGoodsNo(goodsNo);
			goodsFile.setGoodsFileName(inputFile.getUUID());
			goodsFile.setGoodsFileOrigin(inputFile.getFileName());
			goodsFile.setGoodsFileExt(inputFile.getFileExt());
			goodsFile.setGoodsFileSize(mf.getSize());
			goodsFile.setGoodsFileType(mf.getContentType());
			
			// goods_file 테이블에 데이터 삽입 수행.
			Integer goodsFileRow = goodsFileMapper.insertGoodsFile(goodsFile);
			
			// 만약 goods_file 테이블에 데이터 삽입이 성공적으로 이루어졌다면,
			if (goodsFileRow == 1) {
				// 물리적으로 파일 저장.
				try {
					mf.transferTo(new File(path + goodsFile.getGoodsFileName() +"."+ goodsFile.getGoodsFileExt()));
				} catch (Exception e) {
					e.printStackTrace();
					// 예외가 발생할 때 예외처리를 생략해야 @Transactional가 작동하기때문에 RuntimeException을 인위적으로 발생.
					throw new RuntimeException();
				}
			}
		}
	}
	
	// /on/staff/goodsList : 관리자페이지에서 상품 리스트 출력.(진수우)
	public List<Map<String, Object>> getGoodsList(Integer beginRow, Integer rowPerPage) {
		// 페이징에 필요한 정보를 Map에 저장.
		Map<String, Object> param = new HashMap<>();
		param.put("beginRow", beginRow);
		param.put("rowPerPage", rowPerPage);
		return goodsMapper.selectGoodsList(param);
	}
	
	// /on/staff/goodsList : 관리자페이지에서 상품리스트 카운트.(진수우)
	public Integer countGoodsList() {
		return goodsMapper.countGoodsList();
	}
	
}
