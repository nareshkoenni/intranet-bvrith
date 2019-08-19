package s;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class TestRead {
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			ArrayList mobileList=readColumnA("C:\\Users\\Administrator\\Downloads\\email\\view-source_https___www.sakshi.com.xls");
		//	ArrayList smsList=readColumnB("/Users/nareshk/Desktop/Workbook4.xls");
			System.out.println(mobileList);
		//	System.out.println(smsList);
			String strMobileList=mobileList.toString().replace("[", "").replace("]", "").replace(", ", ",");
		    System.out.println(strMobileList);
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  
		
		
		//System.out.println(s.next());

	}
    public static ArrayList readColumnA(String path)throws Exception
    {
        ArrayList rollList=new ArrayList();
        
    	try
        {
            FileInputStream file = new FileInputStream(new File(path));
 
            //Create Workbook instance holding reference to .xlsx file
         /*   XSSFWorkbook workbook = new XSSFWorkbook(file);
            
            //Get first/desired sheet from the workbook
            XSSFSheet sheet = workbook.getSheetAt(0);  */
            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(path)));

            HSSFSheet sheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.iterator(); // Traversing over each row of XLSX file
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next(); // For each row, iterate through each columns
                Iterator<Cell> cellIterator = row.cellIterator();
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                   // System.out.println("column index"+cell.getColumnIndex());//You will have your columns fixed in Excel file
                    DataFormatter d=new DataFormatter();
                    if( cell.getColumnIndex()==0)
                    {
                      rollList.add(d.formatCellValue(cell));
	                    
                    }
                    
              }
         }     
            file.close();
            
	           
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return rollList;
    }
            
    public static ArrayList readColumnB(String path)throws Exception
    {
        ArrayList rollList=new ArrayList();
        
    	try
        {
            FileInputStream file = new FileInputStream(new File(path));
 
            //Create Workbook instance holding reference to .xlsx file
            XSSFWorkbook workbook = new XSSFWorkbook(file);
            
            //Get first/desired sheet from the workbook
            XSSFSheet sheet = workbook.getSheetAt(0);  
            Iterator<Row> rowIterator = sheet.iterator(); // Traversing over each row of XLSX file
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next(); // For each row, iterate through each columns
                Iterator<Cell> cellIterator = row.cellIterator();
                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                   // System.out.println("column index"+cell.getColumnIndex());//You will have your columns fixed in Excel file
                    DataFormatter d=new DataFormatter();
                    if( cell.getColumnIndex()==1)
                    {
                      rollList.add(d.formatCellValue(cell));
	                    
                    }
                    
              }
         }     
            file.close();

        }catch (Exception e){
        	e.printStackTrace();
        }
    	return rollList;
    }

}
