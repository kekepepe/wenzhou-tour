package com.wenzhou.servlet;

import com.wenzhou.dao.CultureDAO;
import com.wenzhou.model.Culture;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文化模块Servlet (Culture Servlet)
 */
@WebServlet("/culture")
public class CultureServlet extends BaseServlet {

    private CultureDAO cultureDAO = new CultureDAO();

    public String list(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        List<Culture> list;
        if (keyword != null && !keyword.isEmpty()) {
            list = cultureDAO.findByName(keyword);
        } else {
            list = cultureDAO.findAll();
        }
        req.setAttribute("list", list);
        return "/culture/list.jsp";
    }

    public String save(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        String description = req.getParameter("description");
        String history = req.getParameter("history");
        String imagePath = req.getParameter("imagePath");
        String status = req.getParameter("status");

        Culture culture = new Culture();
        culture.setName(name);
        culture.setType(type);
        culture.setDescription(description);
        culture.setHistory(history);
        culture.setImagePath(imagePath);
        culture.setStatus(status);

        if (idStr != null && !idStr.isEmpty()) {
            culture.setId(Integer.parseInt(idStr));
            cultureDAO.update(culture);
        } else {
            cultureDAO.add(culture);
        }
        return "redirect:/culture?method=list";
    }

    public String delete(HttpServletRequest req, HttpServletResponse resp) {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            cultureDAO.delete(Integer.parseInt(idStr));
        }
        return "redirect:/culture?method=list";
    }
}
