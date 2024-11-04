# Variáveis
CC = gcc
CFLAGS = -Icli-lib/include -Wall -Wextra
SRC_DIR = cli-lib/src
OBJ_DIR = build
BIN = clint_vs_zombies

# Listar arquivos fonte
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

# Regras
all: $(BIN)

# Compilação do binário
$(BIN): $(OBJS)
	$(CC) $(OBJS) -o $@

# Compilar arquivos objeto
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Diretório de objetos
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

# Limpeza
clean:
	rm -rf $(OBJ_DIR) $(BIN)

# Limpeza total
dist-clean: clean
	rm -rf $(BIN)
