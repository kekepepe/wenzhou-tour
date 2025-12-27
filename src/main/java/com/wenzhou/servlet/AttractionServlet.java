package com.wenzhou.servlet;

import com.wenzhou.dao.AttractionDAO;
import com.wenzhou.model.Attraction;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.util.List;

/**
 * 景点模块Servlet (Attraction Servlet)
 */
@WebServlet("/attraction")
public class AttractionServlet extends BaseServlet {

    private AttractionDAO attractionDAO = new AttractionDAO();

    public String list(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        List<Attraction> list;
        if (keyword != null && !keyword.isEmpty()) {
            list = attractionDAO.findByName(keyword);
        } else {
            list = attractionDAO.findAll();
        }
        req.setAttribute("list", list);
        return "/attraction/list.jsp";
    }

    public String save(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String location = req.getParameter("location");
        String description = req.getParameter("description");
        String priceStr = req.getParameter("price");
        String imagePath = req.getParameter("imagePath");
        String openTime = req.getParameter("openTime");

        Attraction attraction = new Attraction();
        attraction.setName(name);
        attraction.setLocation(location);
        attraction.setDescription(description);
        attraction.setTicketPrice(new BigDecimal(priceStr));
        attraction.setImagePath(imagePath);
        attraction.setOpenTime(openTime);

        if (idStr != null && !idStr.isEmpty()) {
            attraction.setId(Integer.parseInt(idStr));
            attractionDAO.update(attraction);
        } else {
            attractionDAO.add(attraction);
        }
        return "redirect:/attraction?method=list";
    }

    public String delete(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            attractionDAO.delete(Integer.parseInt(idStr));
        }
        return "redirect:/attraction?method=list";
    }
}
