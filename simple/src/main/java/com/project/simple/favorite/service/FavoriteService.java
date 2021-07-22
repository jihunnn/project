package com.project.simple.favorite.service;

import java.util.List;
import java.util.Map;

import com.project.simple.favorite.vo.FavoriteVO;


public interface FavoriteService {
	
	public Map<String ,List> myFavoriteList(FavoriteVO favoriteVO) throws Exception;

	public boolean findFavoriteProduct(FavoriteVO favoriteVO) throws Exception;

	public void addProductInFavorite(FavoriteVO favoriteVO) throws Exception;

	public void removeFavoriteProduct(String productNum)throws Exception;

}
