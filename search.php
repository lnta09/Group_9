<?php
include 'header.php';
?>
<?php
$conn = new mysqli('localhost', 'root', '', 'ecommerce');

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$products = [];
if (isset($_GET['query'])) {
    $query = $_GET['query'];

    $stmt = $conn->prepare("SELECT * FROM products WHERE product_title LIKE ?");
    if (!$stmt) {
        die("SQL Error: " . $conn->error);
    }

    $search = "%" . $query . "%";
    $stmt->bind_param("s", $search);
    $stmt->execute();
    $result = $stmt->get_result();

    while ($row = $result->fetch_assoc()) {
        $products[] = $row;
    }

    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        #product-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
        }
        .product-card:hover {
            transform: scale(1.05);
        }
        .product-card img {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-card h2 {
            font-size: 18px;
            color: #333;
            margin: 10px 0;
        }
        .product-card p {
            font-size: 16px;
            color: #555;
        }
        .product-card .price {
            font-size: 20px;
            color: #e74c3c;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h1>Search Results</h1>

    <?php if (isset($_GET['query'])): ?>
        <p style="text-align: center;">Showing results for: <strong><?php echo htmlspecialchars($_GET['query']); ?></strong></p>
    <?php endif; ?>

    <?php if (count($products) > 0): ?>
        <div id="product-list">
            <?php foreach ($products as $product): ?>
                <div class="product-card">
                <a href="product.php?p=<?php echo htmlspecialchars($product['product_id']); ?>">
                    <div class="product">
                        <img src="<?php echo '/Group_9/product_images/' . htmlspecialchars(basename($product['product_image'])); ?>" 
                            alt="<?php echo htmlspecialchars($product['product_title']); ?>">
                        <h2><?php echo htmlspecialchars($product['product_title']); ?></h2>
                        <p class="price">$<?php echo htmlspecialchars($product['product_price']); ?></p>
                    </div>
                </a>
                </div>
            <?php endforeach; ?>
        </div>
    <?php else: ?>
        <p style="text-align: center; color: #888;">No products found.</p>
    <?php endif; ?>
</body>
</html>
<?php
include "newslettter.php";
include "footer.php";
?>