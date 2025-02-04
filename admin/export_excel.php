<?php
require '../vendor/autoload.php';
require_once 'includes/config.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if(isset($_GET['class'])) {
    $selectedClass = $_GET['class'];
    
    // Fetch data
    $sql = "SELECT ts.FullName, ts.StudentId, ts.Class, ts.MobileNumber, 
            COUNT(DISTINCT ibd.BookId) as BooksIssued,
            GROUP_CONCAT(DISTINCT b.BookName SEPARATOR ', ') as BookNames
            FROM tblstudents ts
            LEFT JOIN tblissuedbookdetails ibd ON ts.StudentId = ibd.StudentId
            LEFT JOIN tblbooks b ON ibd.BookId = b.id
            WHERE ts.Class = :class
            GROUP BY ts.StudentId
            ORDER BY ts.FullName";
    
    $query = $dbh -> prepare($sql);
    $query->bindParam(':class', $selectedClass, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    // Create new Spreadsheet object
    $spreadsheet = new Spreadsheet();
    $sheet = $spreadsheet->getActiveSheet();

    // Set document properties
    $spreadsheet->getProperties()
        ->setCreator('Library Management System')
        ->setLastModifiedBy('Library Management System')
        ->setTitle('Class Report - ' . $selectedClass)
        ->setSubject('Class Report')
        ->setDescription('Class wise report for ' . $selectedClass);

    // Add header row
    $sheet->setCellValue('A1', 'Sr No');
    $sheet->setCellValue('B1', 'Student Name');
    $sheet->setCellValue('C1', 'Student ID');
    $sheet->setCellValue('D1', 'Mobile Number');
    $sheet->setCellValue('E1', 'Books Issued');
    $sheet->setCellValue('F1', 'Book Names');

    // Style the header row
    $sheet->getStyle('A1:F1')->getFont()->setBold(true);
    
    // Add data rows
    $row = 2;
    foreach($results as $index => $result) {
        $sheet->setCellValue('A' . $row, $index + 1);
        $sheet->setCellValue('B' . $row, $result->FullName);
        $sheet->setCellValue('C' . $row, $result->StudentId);
        $sheet->setCellValue('D' . $row, $result->MobileNumber);
        $sheet->setCellValue('E' . $row, $result->BooksIssued);
        $sheet->setCellValue('F' . $row, $result->BookNames ? $result->BookNames : 'No books issued');
        $row++;
    }

    // Auto-size columns
    foreach(range('A','F') as $col) {
        $sheet->getColumnDimension($col)->setAutoSize(true);
    }

    // Create Excel file
    $writer = new Xlsx($spreadsheet);
    
    // Set headers for download
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header('Content-Disposition: attachment;filename="Class_Report_' . $selectedClass . '_' . date('Y-m-d') . '.xlsx"');
    header('Cache-Control: max-age=0');

    // Save file to PHP output
    $writer->save('php://output');
    exit;
}
