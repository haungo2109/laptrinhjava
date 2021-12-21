package com.haungo.service;

import com.haungo.pojos.Category;

import java.util.List;

public interface CategoryService {
    List<Category> getCategories();
    Category getCategoryById(int cateId);
}
