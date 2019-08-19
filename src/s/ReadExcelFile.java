package s;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ReadExcelFile {
		
		    public static ArrayList readRollList(String path)throws Exception
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
		                    
		                    if( cell.getColumnIndex()==0)
		                    {
		                      rollList.add(cell.getStringCellValue());             
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
		    public static ArrayList readNameList(String path)throws Exception
		    {
		        ArrayList nameList=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==1)
		                    {
		                    	  nameList.add(cell.getStringCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return nameList;
		    }


		}

