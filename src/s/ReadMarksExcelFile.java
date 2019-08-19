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

public class ReadMarksExcelFile {
		
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
		    public static ArrayList readS1List(String path)throws Exception
		    {
		        ArrayList s1List=new ArrayList();
		        
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
		                    	  s1List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s1List;
		    }
		    public static ArrayList readS2List(String path)throws Exception
		    {
		        ArrayList s2List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==2)
		                    {
		                    	  s2List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s2List;
		    }
		    public static ArrayList readS3List(String path)throws Exception
		    {
		        ArrayList s3List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==3)
		                    {
		                    	  s3List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s3List;
		    }
		    public static ArrayList readS4List(String path)throws Exception
		    {
		        ArrayList s4List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==4)
		                    {
		                    	  s4List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s4List;
		    }
		    public static ArrayList readS5List(String path)throws Exception
		    {
		        ArrayList s5List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==5)
		                    {
		                    	  s5List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s5List;
		    }
		    public static ArrayList readS6List(String path)throws Exception
		    {
		        ArrayList s6List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==6)
		                    {
		                    	  s6List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s6List;
		    }
		    public static ArrayList readS7List(String path)throws Exception
		    {
		        ArrayList s7List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==7)
		                    {
		                    	  s7List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s7List;
		    }
		    public static ArrayList readS8List(String path)throws Exception
		    {
		        ArrayList s8List=new ArrayList();
		        
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
		                    
		                    if(cell.getColumnIndex()==8)
		                    {
		                    	  s8List.add(cell.getNumericCellValue());             
		                    }
		                    
		              }
		         }     
		            file.close();
		        }
		        catch (Exception e)
		        {
		            e.printStackTrace();
		        }
		        return s8List;
		    }

		}

