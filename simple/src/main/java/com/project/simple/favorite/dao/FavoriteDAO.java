package com.project.simple.favorite.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.project.simple.favorite.vo.FavoriteVO;
import com.project.simple.product.vo.ProductVO;

public interface FavoriteDAO {

	public List<FavoriteVO> selectFavoriteList(FavoriteVO favoriteVO) throws DataAccessException;
	
	public List<ProductVO> selectProductList(List<FavoriteVO> favoriteList) throws DataAccessException;

	public boolean selectCountInFavorite(FavoriteVO favoriteVO) throws DataAccessException;

	public void insertProductInFavorite(FavoriteVO favoriteVO) throws DataAccessException;

	public void deleteFavoriteProduct(String productNum)throws DataAccessException;



}
