<?php


// Interface Veiculo
interface Veiculo {
    public function Mover();
}

// Subclasse Carro
class Carro implements Veiculo {
    public function Mover() {
        echo "O carro está se movendo pela estrada.\n";
    }
}

// Subclasse Avião
class Aviao implements Veiculo {
    public function Mover() {
        echo "O avião está voando pelos céus.\n";
    }
}

// Subclasse Barco
class Barco implements Veiculo {
    public function Mover() {
        echo "O barco está navegando pelo mar.\n";
    }
}

// Subclasse Elevador
class Elevador implements Veiculo {
    public function Mover() {
        echo "O elevador está subindo ou descendo dentro do prédio.\n";
    }
}

// ===== Criando objetos de teste =====
$carro = new Carro();
$aviao = new Aviao();
$barco = new Barco();
$elevador = new Elevador();

// Testando individualmente
echo "=== Testando objetos individualmente ===\n";
$carro->Mover();
$aviao->Mover();
$barco->Mover();
$elevador->Mover();
?>
