<?php 
require_once 'includes/config.php';

// Get unique classes for the dropdown
$sql_classes = "SELECT DISTINCT Class from tblstudents ORDER BY Class";
$query_classes = $dbh -> prepare($sql_classes);
$query_classes->execute();
$classes = $query_classes->fetchAll(PDO::FETCH_COLUMN);

// Initialize variables
$selectedClass = isset($_POST['class']) ? $_POST['class'] : '';
$results = array();

// If a class is selected, get the report data
if($selectedClass) {
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
}
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <title>Online Library Management System | Class-Wise Report</title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONT AWESOME STYLE  -->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLE  -->
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <?php include('includes/header.php');?>
    <div class="content-wrapper">
        <div class="container">
            <div class="row pad-botm">
                <div class="col-md-12">
                    <h4 class="header-line">Class-Wise Report</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Select Class
                        </div>
                        <div class="panel-body">
                            <form method="post">
                                <div class="form-group">
                                    <select name="class" class="form-control" onchange="this.form.submit()">
                                        <option value="">Select Class</option>
                                        <?php foreach($classes as $class): ?>
                                            <option value="<?php echo htmlspecialchars($class); ?>" 
                                                    <?php if($selectedClass === $class) echo 'selected'; ?>>
                                                <?php echo htmlspecialchars($class); ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <?php if($selectedClass): ?>
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Report for Class: <?php echo htmlspecialchars($selectedClass); ?>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Sr No</th>
                                            <th>Student Name</th>
                                            <th>Student ID</th>
                                            <th>Mobile Number</th>
                                            <th>Books Issued</th>
                                            <th>Book Names</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php 
                                        $cnt = 1;
                                        foreach($results as $result): ?>
                                        <tr>
                                            <td><?php echo $cnt; ?></td>
                                            <td><?php echo htmlspecialchars($result->FullName); ?></td>
                                            <td><?php echo htmlspecialchars($result->StudentId); ?></td>
                                            <td><?php echo htmlspecialchars($result->MobileNumber); ?></td>
                                            <td><?php echo $result->BooksIssued; ?></td>
                                            <td><?php echo htmlspecialchars($result->BookNames ? $result->BookNames : 'No books issued'); ?></td>
                                        </tr>
                                        <?php 
                                        $cnt++;
                                        endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                            <div class="text-right">
                                <button onclick="window.print()" class="btn btn-primary"><i class="fa fa-print"></i> Print Report</button>
                                <a href="export_excel.php?class=<?php echo urlencode($selectedClass); ?>" class="btn btn-success"><i class="fa fa-file-excel-o"></i> Export to Excel</a>
                                <a href="export_pdf.php?class=<?php echo urlencode($selectedClass); ?>" class="btn btn-danger"><i class="fa fa-file-pdf-o"></i> Export to PDF</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>
    <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
    <!-- CORE JQUERY  -->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
</body>
</html>
