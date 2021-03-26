package com.company.temp;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.temp.service.impl.EmpMapper;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

@Controller
public class ExcelPDFController {
	@Autowired
	EmpMapper empMapper;
	@Autowired
	DataSource datasource;

	// Excel
	@RequestMapping("/Excel/empList")
	public String getEmpExcel(Model model) {
		List<Map<String, Object>> list = empMapper.getEmpList();
		System.out.println(list.get(0));
		model.addAttribute("filename", "empList");
		model.addAttribute("headers", new String[] { "firstName", "lastName", "salary", "e-mail" });
		model.addAttribute("datas", list);
		return "commonExcelView";
	}

	@RequestMapping("/PDF/empList")
	public String getEmpPDF(Model model) {
		model.addAttribute("filename", "/reports/empList.jasper");
		return "commonPDFView";
	}

	@RequestMapping("/PDF/empList2")
	public String getEmpPDF2(Model model, @RequestParam String dept) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("P_DEPARTMENT_ID", dept);

		model.addAttribute("param", map);
		model.addAttribute("filename", "/reports/empList2.jasper");
		return "commonPDFView";
	}

	@RequestMapping("/PDF/empList3")
	public void getEmpPDF3(HttpServletResponse response) throws Exception {
		Connection conn = datasource.getConnection();
		// 소스파일 컴파일하여 저장 : compileReportToFile
		String jrxmlFile = getClass().getResource("/reports/empList3.jrxml").getFile();
		String jasperFile = JasperCompileManager.compileReportToFile(jrxmlFile);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperFile, null, conn);
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	}

}
