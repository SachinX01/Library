<?php
require '../vendor/autoload.php';
require_once 'includes/config.php';

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

    // Create new PDF document
    $pdf = new TCPDF(PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

    // Set document information
    $pdf->SetCreator('Library Management System');
    $pdf->SetAuthor('Library Management System');
    $pdf->SetTitle('Class Report - ' . $selectedClass);

    // Set default header data
    $pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, 'Class Report - ' . $selectedClass, 'Generated on: ' . date('Y-m-d H:i:s'));

    // Set header and footer fonts
    $pdf->setHeaderFont(Array(PDF_FONT_NAME_MAIN, '', PDF_FONT_SIZE_MAIN));
    $pdf->setFooterFont(Array(PDF_FONT_NAME_DATA, '', PDF_FONT_SIZE_DATA));

    // Set default monospaced font
    $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

    // Set margins
    $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);
    $pdf->SetHeaderMargin(PDF_MARGIN_HEADER);
    $pdf->SetFooterMargin(PDF_MARGIN_FOOTER);

    // Set auto page breaks
    $pdf->SetAutoPageBreak(TRUE, PDF_MARGIN_BOTTOM);

    // Add a page
    $pdf->AddPage();

    // Create the table content
    $html = '<table border="1" cellpadding="4">
        <tr style="background-color: #f0f0f0; font-weight: bold;">
            <th>Sr No</th>
            <th>Student Name</th>
            <th>Student ID</th>
            <th>Mobile Number</th>
            <th>Books Issued</th>
            <th>Book Names</th>
        </tr>';

    $cnt = 1;
    foreach($results as $result) {
        $html .= '<tr>
            <td>' . $cnt . '</td>
            <td>' . htmlspecialchars($result->FullName) . '</td>
            <td>' . htmlspecialchars($result->StudentId) . '</td>
            <td>' . htmlspecialchars($result->MobileNumber) . '</td>
            <td>' . $result->BooksIssued . '</td>
            <td>' . htmlspecialchars($result->BookNames ? $result->BookNames : 'No books issued') . '</td>
        </tr>';
        $cnt++;
    }
    $html .= '</table>';

    // Print the table
    $pdf->writeHTML($html, true, false, true, false, '');

    // Close and output PDF document
    $pdf->Output('Class_Report_' . $selectedClass . '_' . date('Y-m-d') . '.pdf', 'D');
    exit;
}
