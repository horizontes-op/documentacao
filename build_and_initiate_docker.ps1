cd ..
cd .\account
mvn clean install
cd ..
cd .\account-resource
mvn clean install
cd ..
cd .\aluno
mvn clean install
cd ..
cd .\aluno-resource
mvn clean install
cd ..
cd .\auth
mvn clean install
cd ..
cd .\auth-resource
mvn clean install
cd ..
cd .\discovery
mvn clean install
cd ..
cd .\gateway
mvn clean install
cd ..
cd .\instituicao
mvn clean install
cd ..
cd .\instituicao-resource
mvn clean install
cd ..
cd .\recomendacao
mvn clean install
cd ..
cd .\recomendacao-resource
mvn clean package
cd ..
cd .\docker-compose
docker-compose down 
docker-compose up -d --build