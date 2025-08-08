<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $nome = trim($_POST["nome"]);
    $nota1 = (float)$_POST["nota1"];
    $nota2 = (float)$_POST["nota2"];
    $presenca = (int)$_POST["presenca"];

    $media = ($nota1 + $nota2) / 2;

    echo "<p><strong>Aluno:</strong> $nome</p>";
    echo "<p><strong>Nota 1:</strong> $nota1</p>";
    echo "<p><strong>Nota 2:</strong> $nota2</p>";
    echo "<p><strong>Presença:</strong> $presenca%</p>";
    echo "<p><strong>Média:</strong> " . number_format($media, 2, ',', '.') . "</p>";

    if (strtolower($nome) === "enzo enrico") {
        echo "<p class='aprovado'>Aprovado (caso especial)!</p>";
    } elseif ($media >= 7 && $presenca >= 75) {
        echo "<p class='aprovado'>Aprovado!</p>";
    } else {
        echo "<p class='reprovado'>Reprovado!</p>";
    }
}
?>
</body>
</html>
