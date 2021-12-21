package com.haungo.repository;

import com.haungo.pojos.Category;

import java.util.List;

public interface CategoryRepository {
    List<Category> getCategories();
    Category getCategoryById(int cateId);
    boolean addCategory(Category category);
}
