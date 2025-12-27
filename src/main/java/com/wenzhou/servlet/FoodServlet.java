package com.wenzhou.servlet;

import com.wenzhou.dao.FoodDAO;
import com.wenzhou.model.Food;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 美食模块Servlet (Food Servlet)
 */
@WebServlet("/food")
public class FoodServlet extends BaseServlet {

    private FoodDAO foodDAO = new FoodDAO();

    /**
     * 显示列表
     */
    public String list(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        List<Food> list;
        if (keyword != null && !keyword.isEmpty()) {
            list = foodDAO.findByName(keyword);
        } else {
            list = foodDAO.findAll();
        }
        req.setAttribute("list", list);
        return "/food/list.jsp";
    }

    /**
     * 添加或更新处理
     */
    public String save(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String history = req.getParameter("history");
        String taste = req.getParameter("taste");
        String imagePath = req.getParameter("imagePath");
        String recommendPlace = req.getParameter("recommendPlace");

        Food food = new Food();
        food.setName(name);
        food.setDescription(description);
        food.setHistory(history);
        food.setTaste(taste);
        food.setImagePath(imagePath);
        food.setRecommendPlace(recommendPlace);

        if (idStr != null && !idStr.isEmpty()) {
            // Update
            food.setId(Integer.parseInt(idStr));
            foodDAO.updateFood(food);
        } else {
            // Add
            foodDAO.add(food);
        }
        return "redirect:/food?method=list";
    }

    /**
     * 删除处理
     */
    public String delete(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            foodDAO.delete(Integer.parseInt(idStr));
        }
        return "redirect:/food?method=list";
    }

    /**
     * 编辑页面
     */
    public String edit(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            Food food = foodDAO.findById(Integer.parseInt(idStr));
            req.setAttribute("food", food);
        }
        return "/food/edit.jsp"; // Assuming creating an edit/add form jsp
    }
}
