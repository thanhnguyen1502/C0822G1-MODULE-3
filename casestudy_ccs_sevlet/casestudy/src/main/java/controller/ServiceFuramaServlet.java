package controller;

import model.RentType;
import model.facility.Facility;
import model.facility.FacilityType;
import service.IFacitityService;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceFuramaServlet", value = "/ServiceFurama")
public class ServiceFuramaServlet extends HttpServlet {

    private IFacitityService facilityService = new FacilityService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }

        switch (action){
            case "addNewService":
                showAddNewServiceForm(request,response);
                break;
            case "editFacility":
                showEditFacilityForm(request,response);
                break;
            case "deleteFacility":
                deleteFacility(request,response);
            default:
                showServiceListPage(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }

        switch (action){
            case "addNewFacility":
                addNewFacility(request,response);
                break;
            case "deleteFacility":
                deleteFacility(request,response);
                break;
            case "searchFacility":
                searchFacility(request,response);
                break;

        }
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) {
        String keySearch = request.getParameter("keySearch");

        List<Facility> facilityList = this.facilityService.searchFacility(keySearch);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/list.jsp");
        request.setAttribute("facilityList",facilityList);

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditFacilityForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        List<FacilityType> facilityTypeList = this.facilityService.facilityTypeList();
        List<RentType> rentTypeList = this.facilityService.rentTypeList();
        Facility facility = this.facilityService.findFacilityById(id);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/edit.jsp");
        request.setAttribute("facilityTypeList",facilityTypeList);
        request.setAttribute("rentTypeList",rentTypeList);
        request.setAttribute("facility",facility);

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));

        this.facilityService.deleteFacility(id);
        List<Facility> facilityList = this.facilityService.selectAllService();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/list.jsp");
        request.setAttribute("facilityList",facilityList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewFacility(HttpServletRequest request, HttpServletResponse response) {

        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("people"));
        String rentTyp = request.getParameter("rentType");
        String facilityType = request.getParameter("facilityType");
        String standard = request.getParameter("standard");
        String convenience = request.getParameter("convenience");
        int floors = Integer.parseInt(request.getParameter("floors"));
        String facilityFree = request.getParameter("free");
        double poolArea = Double.parseDouble(request.getParameter("Pool"));

        Facility facility = new Facility(name,area,cost,maxPeople,rentTyp,facilityType,standard,convenience,poolArea,floors,facilityFree);

        this.facilityService.addNewFacility(facility);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/create.jsp");
        request.setAttribute("message","successfully added new");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewServiceForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/facility/create.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showServiceListPage(HttpServletRequest request, HttpServletResponse response) {
        List<Facility> facilityList =  facilityService.selectAllService();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        request.setAttribute("facilityList",facilityList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
