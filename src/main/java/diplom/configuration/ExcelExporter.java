package diplom.configuration;

import diplom.model.Product;
import diplom.model.Residual;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ExcelExporter {

    private XSSFWorkbook workbook;
    private XSSFSheet sheet;

    private List<Residual> residuals;
    private List<Product> products;

    public ExcelExporter(List<Residual> residuals, List<Product> products) {
        this.residuals = residuals;
        this.products = products;
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet("Residuals");
    }

    private void writeHeaderRow() {
        Row row = sheet.createRow(0);

        Cell cellNameProduct = row.createCell(0);
        cellNameProduct.setCellValue("Название продукта");
        row.getCell(0).getSheet().autoSizeColumn(0);

        Cell cellCountResidual = row.createCell(1);
        cellCountResidual.setCellValue("Количество остатка");
        row.getCell(1).getSheet().autoSizeColumn(1);

        Cell cellPriceResidual = row.createCell(2);
        cellPriceResidual.setCellValue("Общая стоимость остатка");
        row.getCell(2).getSheet().autoSizeColumn(2);

        Cell cellStockAvailability = row.createCell(3);
        cellStockAvailability.setCellValue("Примечания по продукту");
        row.getCell(3).getSheet().autoSizeColumn(3);
    }

    private void writeDataToRows() {
        XSSFCellStyle cellStyle = null;
        int i = 1;
        for (Product product : products) {
            for (Residual residual : residuals) {
                if (product.getModel().equals(residual.getName())) {
                    if (residual.getCount() > 500) {
                        cellStyle = workbook.createCellStyle();
                        cellStyle.setFillForegroundColor(IndexedColors.RED.getIndex());
                        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                    } else if (residual.getCount() <= 500 && residual.getCount() >= 200) {
                        cellStyle = workbook.createCellStyle();
                        cellStyle.setFillForegroundColor(IndexedColors.ORANGE.getIndex());
                        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                    } else if (residual.getCount() < 200 && residual.getCount() >= 1) {
                        cellStyle = workbook.createCellStyle();
                        cellStyle.setFillForegroundColor(IndexedColors.GREEN.getIndex());
                        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                    } else if (residual.getCount() == 0) {
                        cellStyle = workbook.createCellStyle();
                        cellStyle.setFillForegroundColor(IndexedColors.WHITE.getIndex());
                        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
                    }

                    Row row = sheet.createRow(i);
                    Cell cellNameProduct = row.createCell(0);
                    cellNameProduct.setCellValue(residual.getName());
                    row.getCell(0).setCellStyle(cellStyle);

                    Cell cellCountProduct = row.createCell(1);
                    cellCountProduct.setCellValue(residual.getCount());
                    row.getCell(1).setCellStyle(cellStyle);

                    Cell cellPriceResidual = row.createCell(2);
                    int price = residual.getCount() * product.getPrice();
                    cellPriceResidual.setCellValue(price);
                    row.getCell(2).setCellStyle(cellStyle);

                    if (residual.getCount() == 0) {
                        Cell cellCountNull = row.createCell(3);
                        cellCountNull.setCellValue("Нет на складе");
                    }
                }
            }
            i++;
        }
    }

    public void export(HttpServletResponse response) throws IOException {
        writeHeaderRow();
        writeDataToRows();

        ServletOutputStream servletOutputStream = response.getOutputStream();
        workbook.write(servletOutputStream);
        workbook.close();
        servletOutputStream.close();
    }
}
