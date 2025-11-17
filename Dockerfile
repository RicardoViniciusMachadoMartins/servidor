# Usar imagem base do OpenJDK (por exemplo Java 17)
FROM openjdk:17-jdk-slim

# Diretório de trabalho dentro do container
WORKDIR /minecraft

# Copiar todos os arquivos do repositório para dentro do container
COPY . /minecraft

# Expor a porta padrão do Minecraft
EXPOSE 25565

# Variáveis de ambiente padrão (podem ser sobrescritas no docker-compose)
ENV EULA=TRUE \
    MAX_HEAP=2G \
    MIN_HEAP=1G

# Comando de inicialização — ajuste conforme o nome do seu arquivo .jar
CMD ["sh", "-c", "java -Xms${MIN_HEAP} -Xmx${MAX_HEAP} -jar servidor.jar nogui"]
