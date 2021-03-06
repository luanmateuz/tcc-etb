-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.25-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Schema biblioteca
--

DROP SCHEMA IF EXISTS `biblioteca` ;

--
-- Schema biblioteca
--

CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `dataNascimento` date NOT NULL,
  `sexo` enum('f','m') NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `email` varchar(100) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` int DEFAULT NULL,
  `uf` varchar(2) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Mateus','Vital','2006-01-09','m','934.109.238-40',1,'mateus@email.com','98989-8998','71973100','QS 8',4,'DF','Areal (??guas Claras)','Bras??lia',''),(2,'Luciano','Ribeiro','1996-06-06','m','218.742.189-74',1,'luciano@email.com','89798-7989','71973100','QS 8',4,'DF','Areal (??guas Claras)','Bras??lia','Ponto de Onibus'),(3,'Carlos','Daniel','1996-03-06','m','821.374.981-72',1,'carlos@email.com.br','32453-4534','76310000','Joaquim M',20,'GO','Centro','Rialma',''),(4,'Maria','Fernanda','2004-02-26','m','982.412.984-37',1,'mariaf@gmail.com','89989-8989','76305000','Oriente',11,'GO','Novo Oriente','Nova Gl??ria','Municipio de Nova Gloria'),(5,'Alynne','Elaynne','1996-07-04','f','821.374.981-72',1,'alynne@email.com','88888-8888','71973100','QS 8',4,'DF','Areal (??guas Claras)','Bras??lia',''),(6,'Juan','Matias','2000-06-28','m','712.834.781-23',2,'juan@email.com','83242-3748','72631227','Quadra 406 Conjunto Z1',6,'DF','Recanto das Emas','Bras??lia',''),(7,'Denis','Carlos','1995-07-03','m','798.008.988-07',1,'deniscarlos@email.com','98989-8989','72631227','Quadra 406 Conjunto Z1',3,'DF','Recanto das Emas','Bras??lia',''),(8,'Jacira','Alves','1999-04-22','f','988.998.898-99',1,'jacira@email.com','88898-9898','70760516','SCLRN 712 Bloco F',10,'DF','Asa Norte','Bras??lia',''),(9,'Lizandra','Alves','2000-04-30','f','987.789.987-97',1,'lizandra@email.com','99999-9999','70070120','SBS Quadra 2',15,'DF','Asa Sul','Bras??lia',''),(10,'Lucas','Souza','2002-01-23','m','121.212.121-21',1,'lucas@email.com','98989-8989','71020180','QI 1 Conjunto R',4,'DF','Guar?? I','Bras??lia',''),(11,'Luiz','Eduardo','2001-06-12','m','899.878.987-99',1,'luizovioleiro@email.com','98779-8798','72500120','Quadra AC 300',31,'DF','Santa Maria','Bras??lia','');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `idEmprestimo` int NOT NULL AUTO_INCREMENT,
  `dataEntrega` date NOT NULL,
  `dataDevolucao` date NOT NULL,
  `idCliente` int NOT NULL,
  `idUsuario` int NOT NULL,
  `idLivro` int NOT NULL,
  `multaMotivo` varchar(45) DEFAULT NULL,
  `multaValor` double DEFAULT NULL,
  `multaPaga` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`idEmprestimo`),
  KEY `fk_emprestimo_cliente1_idx` (`idCliente`),
  KEY `fk_emprestimo_usuario1_idx` (`idUsuario`),
  KEY `fk_emprestimo_livro1_idx` (`idLivro`),
  CONSTRAINT `fk_emprestimo_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_emprestimo_livro1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`idLivro`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_emprestimo_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (8,'2021-05-24','2021-05-25',1,1,1,'',0,1,3),(10,'2021-06-01','2021-06-03',2,2,1,'',0,1,3),(12,'2021-05-17','2021-05-31',3,1,11,'Devolu????o atrasada',10,1,3),(13,'2021-05-17','2021-05-28',5,1,15,NULL,0,0,3),(14,'2021-05-31','2021-06-11',4,3,22,'Devolu????o atrasada',10,1,3),(27,'2021-07-05','2021-07-09',2,1,27,NULL,0,0,1),(28,'2021-07-05','2021-07-16',10,1,21,NULL,0,0,3),(29,'2021-07-05','2021-07-16',9,5,20,'Pagina rasgada',5,1,3),(30,'2021-07-07','2021-07-16',11,5,33,'',0,1,3);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `idLivro` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(180) DEFAULT NULL,
  `descricao` text NOT NULL,
  `autor` varchar(45) NOT NULL,
  `editora` varchar(45) DEFAULT NULL,
  `categoria` varchar(95) NOT NULL,
  `paginas` int DEFAULT NULL,
  `ano` year DEFAULT NULL,
  `isbn` varchar(45) NOT NULL,
  `idioma` varchar(45) NOT NULL,
  `disponivel` int NOT NULL DEFAULT '1',
  `imagem` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLivro`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'1984','Publicado em 1949, o texto de Orwell nasceu destinado ?? pol??mica. Traduzido em mais de sessenta pa??ses, virou miniss??rie, filmes, quadrinhos, mang??s e at?? uma ??pera. Ganhou holofotes em 1999, quando uma produtora holandesa batizou seu reality show de Big Brother. 1984 foi respons??vel pela populariza????o de muitos termos e conceitos, como Grande Irm??o, duplopensar, novidioma, buraco da mem??ria e 2 2 5. O trabalho de Winston, o her??i de 1984, ?? reescrever artigos de jornais do passado, de modo que o registro hist??rico sempre apoie a ideologia do Partido. Grande parte do Minist??rio tamb??m destr??i os documentos que n??o foram revisados, dessa forma n??o h?? como provar que o governo esteja mentindo. Winston ?? um trabalhador diligente e habilidoso, mas odeia secretamente o Partido e sonha com a rebeli??o contra o Grande Irm??o.','George Orwell','Principis','Ci??ncia Pol??tica',336,1945,'6555522267','Portugues',1,'teste.png'),(9,'O homem mais rico da Babil??nia ','Com mais de dois milh??es de exemplares vendidos no mundo todo, O homem mais rico da Babil??nia ?? um cl??ssico sobre como multiplicar riqueza e solucionar problemas financeiros. Baseando-se nos segredos de sucesso dos antigos babil??nicos ??? os habitantes da cidade mais rica e pr??spera de seu tempo ???, George S. Clason mostra solu????es ao mesmo tempo s??bias e muito atuais para evitar a falta de dinheiro, como n??o desperdi??ar recursos durante tempos de opul??ncia, buscar conhecimento e informa????o em vez de apenas lucro, assegurar uma renda para o futuro, manter a pontualidade no pagamento de d??vidas e, sobretudo, cultivar as pr??prias aptid??es, tornando-se cada vez mais habilidoso e consciente.','George S Clason','HarperCollins ','Auto ajuda',160,2017,' 8595081530 ','Portugues',1,'homemricobabiblonia.jpg'),(10,'Do Mil ao Milh??o. Sem Cortar o Cafezinho','Em seu primeiro livro, Thiago Nigro, criador da plataforma O Primo Rico, ensina aos leitores os tr??s pilares para atingir a independ??ncia financeira: gastar bem, investir melhor e ganhar mais. Por meio de dados e de sua pr??pria experi??ncia como investidor e assessor, Nigro mostra que a riqueza ?? poss??vel para todos ??? basta estar disposto a aprender e se dedicar.','Thiago Nigro','HarperCollins','Outros Assuntos',192,2018,'8595083274','Portugues',1,'milaomilhao.jpg'),(11,'O poder da a????o','Acorde para os objetivos que quer conquistar. J?? aconteceu a voc?? de se olhar no espelho e n??o gostar daqueles quilos a mais? De observar seu momento profissional somente com frustra????o? De se sentir desconectado dos seus familiares, dos seus amigos? Se voc?? acha que essas s??o situa????es normais, pense de novo! S?? porque isso acontece com v??rias pessoas n??o quer dizer que a vida deva ser assim. S?? porque algo se torna comum, n??o significa que seja normal! Neste livro, Paulo Vieira lhe convida a quebrar o ciclo vicioso e iniciar um caminho de realiza????o. Para isso, ele apresenta o m??todo respons??vel por impactar 250 mil pessoas ao longo de sua carreira - e que pode ser a chave para o que voc?? tanto procura. No decorrer destas p??ginas, o autor lhe entrega uma b??ssola. E para conseguir se guiar por ela voc?? ter?? de assumir um compromisso com a mudan??a. Preparado? Aproveite todas as provoca????es e os desafios propostos nesta obra para conseguir, de fato, fazer o check-up completo sobre si mesmo. Acorde, creia, comunique, tenha foco, AJA! Pare de adiar sua vida e seja quem quer ser a partir de agora. N??o existe outra op????o. E est?? em suas m??os reescrever seu futuro.','Paulo Vieira','Gente','Auto ajuda',256,2015,'854520034X','Portugues',1,'poderAcao.jpg'),(12,'A psicologia das cores','Este livro aborda a rela????o das cores com os nossos sentimentos e mostra como as duas coisas n??o se combinam por acaso, j?? que as rela????es entre ambas n??o s??o apenas quest??es de gosto, mas sim experi??ncias universais profundamente enraizadas na nossa linguagem e no nosso pensamento. Organizada em treze cap??tulos, correspondentes a treze cores diferentes, a obra oferece um rico painel de informa????es sobre as cores: de ditados e saberes populares at?? sua utiliza????o na ??rea de design de produto, os diversos testes baseados em cores, as terapias crom??ticas, a manipula????o de pessoas, os nomes e sobrenomes relacionados com as cores etc. A diversidade desta abordagem faz do trabalho de Eva Heller uma ferramenta indispens??vel para todos os que trabalham com cores: artistas, terapeutas, designers gr??ficos e industriais, decoradores, arquitetos, designers de moda, publicit??rios, entre outros.','Eva Heller','Olhares','Artesanato',311,2021,'658828005X','Portugues',1,'psicologiaCores.jpg'),(13,'A lei: por que a esquerda n??o funciona','Este livro traz uma reflex??o pr??tica sobre ideias de fil??sofos e outros pensadores acerca da politica e da vida em sociedade, dentre eles  John Locke e Adam Smith, e trata de temas como liberdade, direitos ?? propriedade, espolia????o, igualdade, livre iniciativa, impostos, democracia, sufr??gio universal, autoritarismo e tantos outros que, passados quase dois  s??culos, ainda provocam debates acalorados. Nesta edi????o est??o inclu??dos coment??rios e an??lises que  relacionam o tema ?? legisla????o e ?? hist??ria pol??tica do Brasil contempor??neo.','Frederic Bastiat','Faro Editorial','Ci??ncia Pol??tica',144,2016,'8562409715','Portugues',1,'aLei.jpg'),(14,'Fahrenheit 451','Guy Montag ?? um bombeiro. Sua profiss??o ?? atear fogo nos livros. Em um mundo onde as pessoas vivem em fun????o das telas e a literatura est?? amea??ada de extin????o, os livros s??o objetos proibidos, e seus portadores s??o considerados criminosos. Montag nunca questionou seu trabalho; vive uma vida comum, cumpre o expediente e retorna ao final do dia para sua esposa e para a rotina do lar. At?? que conhece Clarisse, uma jovem de comportamento suspeito, cheia de imagina????o e boas hist??rias. Quando sua esposa entra em colapso mental e Clarisse desaparece, a vida de Montag n??o poder?? mais ser a mesma.\r\n\r\nUm cl??ssico da fic????o cient??fica e da literatura dist??pica, Fahrenheit 451 foi escrito originalmente como um conto: \"O bombeiro\", contido no volume Prazer em Queimar: hist??rias de Fahrenheit 451. Incentivado pelo seu editor, transformou a ideia inicial em um romance, que se tornou um dos livros mais influentes de sua gera????o ??? e tamb??m um dos mais censurados e banidos de todos os tempos. Foi adaptado para o cinema duas vezes, a primeira pelas m??os do lend??rio cineasta franc??s Fran??ois Truffaut, e depois para diversos formatos.\r\n\r\nEscrito durante a era do macartismo ??? a sistem??tica censura ?? arte promovida pelo governo americano nos anos 1950 ??? Bradbury costumava dizer que a proibi????o a livros n??o foi o motivo central que o levou a compor a obra, e sim a percep????o de que as pessoas passavam a se interessar cada vez menos pela literatura com o surgimento de novas m??dias, como a televis??o. Com o passar do tempo, Fahrenheit 451 ganhou muitas camadas de interpreta????o: a hist??ria de um burocrata que questiona a vileza do seu trabalho, o poder libertador da palavra, a estupidez da censura ??s artes.\r\n\r\nEmbora soubesse estar testemunhando uma transforma????o social ??nica, Bradbury afirmava n??o acreditar que o cen??rio que imaginou se tornaria realidade t??o r??pido. Lan??ado em 1953, Fahrenheit 451 ?? hoje uma obra de leitura indispens??vel junto com 1984, de George Orwell, e Admir??vel Mundo Novo, de Aldous Huxley.','Ray Bradbury & Cid Knipel ','Biblioteca Azul','Lingu??stica',216,2012,'8525052248','Portugues',1,'Fahrenheit.jpg'),(15,'Laranja Mec??nica','Uma das mais brilhantes s??tiras dist??picas j?? escritas, Laranja Mec??nica ganhou fama ao ser adaptado em uma obra magistral do cinema pelas m??os de Stanley Kubrick. O livro, entretanto, tamb??m ?? um cl??ssico moderno da fic????o inglesa e um marco na cultura pop, que ao lado de 1984, de George Orwell, Admir??vel Mundo Novo, de Aldous Huxley, e Fahrenheit 451, de Ray Bradbury, representa um dos ??cones liter??rios da aliena????o p??s-industrial.\r\n\r\nAlex ?? o jovem l??der de uma gangue de adolescentes cuja divers??o ?? cometer perversidades e atos de viol??ncia pelas ruas de uma cidade futurista governada por um Estado repressivo e totalit??rio. Depois de cometer um crime que termina em um assassinato, ele acaba preso pelo governo e submetido a um m??todo experimental de recondicionamento de mentes criminosas, que se utiliza de terapia de avers??o brutal.\r\n\r\nBrilhante, transgressivo e influente, o livro traz uma vis??o assombrosa do futuro contada em seu pr??prio l??xico inventivo chamado ???nadsat???, que mescla g??rias de gangues inglesas e palavras russas. O filme hom??nimo de Stanley Kubrick teve como base as primeiras edi????es americanas deste livro, que por conta da insist??ncia dos editores americanos, tiveram o cap??tulo final suprimido, acreditando que um final sem reden????o para Alex seria mais realista. Esta edi????o, entretanto, mant??m o cap??tulo final original.\r\n\r\nA nova edi????o ganha uma capa de Giovanna Cianelli inspirada em uma cena marcante do filme e que transmite toda a influ??ncia pop que ele representa, homenageando-o como cl??ssico que ??.\r\n\r\n+ Esta nova edi????o ganha capa da designer e ilustradora Giovanna Cianelli, que se inspirou em uma cena marcante do filme transmitindo toda a influ??ncia pop que ele representa.\r\n\r\n+ Laranja Mec??nica, obra de Anthony Burgess, ?? um dos livros mais importantes do g??nero distopia. O cl??ssico est?? ao lado de t??tulos como Fahrenheit 451, Admir??vel Mundo Novo e 1984.\r\n\r\n+ Em 1971 a obra ganhou adapta????o para o cinema nas m??os de Stanley Kubrick, que criou uma est??tica inovadora para filme. Apesar de nunca ter ganhado o Oscar, a produ????o ?? considerada por muitos a obra-prima do cineasta.\r\n\r\n+ Em sua terceira edi????o, o livro j?? vendeu mais de 150 mil exemplares.\r\n\r\n+ Cont??m os extras (que tamb??m estavam presentes nas outras edi????es): Nota do tradutor e gloss??rio ???nadsat???, vocabul??rio de g??rias usadas pelos personagens no livro.','Anthony Burgess ','Editora Aleph','Contos',288,2019,' 8576574462 ','Portugues',1,'laranjaMecanica.jpg'),(16,'O Hobbit','Bilbo Bolseiro era um dos mais respeit??veis hobbits de todo o Condado at?? que, um dia, o mago Gandalf bate ?? sua porta. A partir de ent??o, toda sua vida pacata e campestre soprando an??is de fuma??a com seu belo cachimbo come??a a mudar. Ele ?? convocado a participar de uma aventura por ningu??m menos do que Thorin Escudo-de-Carvalho, um pr??ncipe do poderoso povo dos An??os.\r\nEsta jornada far?? Bilbo, Gandalf e 13 an??os atravessarem a Terra-m??dia, passando por in??meros perigos, sejam eles, os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, at?? chegarem (se conseguirem) na Montanha Solit??ria. L?? est?? um incalcul??vel tesouro, mas h?? um por??m. Deitado em cima dele est?? Smaug, o Dourado, um drag??o malicioso que... bem, voc?? ter?? que ler e descobrir.\r\nLan??ado em 1937, O Hobbit ?? um divisor de ??guas na literatura fant??stica mundial. Mais de 80 anos ap??s a sua publica????o, o livro que antecede os ocorridos em O Senhor dos An??is continua arrebatando f??s de todas as idades, talvez pelo seu tom brincalh??o com uma pitada de magia ??lfica, ou talvez porque J.R.R. Tolkien tenha escrito o melhor livro infanto-juvenil de todos os tempos.','J.R.R. Tolkien','HarperCollins','Contos',336,2019,'8595084742','Portugues',2,'oHobbit.jpg'),(17,'O poder da China','Com este livro, voc?? aprender??: As ferramentas b??sicas para decodificar a China; Qual ?? a rela????o China vs. mundo e como as empresas chinesas se internacionalizam; Por que e como a China tem crescido t??o rapidamente; Como fazer neg??cios com o mercado chin??s; Os detalhes dos principais protagonistas da nova economia digital da China; O que ?? a Nova Rota da Seda, em que o governo chin??s promete investir US$ 1 trilh??o no exterior; Quem s??o Shenzhen, Hangzhou e diversos outros unic??rnios chineses; Por que ?? um consenso que a China ultrapassar?? a economia dos EUA.','Ricardo Geromel','Gente','Ci??ncia Pol??tica',288,2019,'854520339X','Portugues',1,'poderChina.jpg'),(18,'Java??: Como Programar','Milh??es de alunos e profissionais aprenderam programa????o e desenvolvimento de software com os livros Deitel??. Java: como programar, 10?? edi????o, fornece uma introdu????o clara, simples, envolvente e divertida ?? programa????o Java com ??nfase inicial em objetos. Destaques incluem: rica cobertura dos fundamentos com exemplos reais; apresenta????o com ??nfase inicial em classes e objetos; uso com Java??? SE 7, Java??? SE 8 ou ambos; Java??? SE 8 abordado em se????es modulares opcionais; lambdas, fluxos e interfaces funcionais usando m??todos padr??o e est??ticos do Java SE 8; Swing e GUI do JavaFX: elementos gr??ficos e multim??dia; conjunto de exerc??cios \"\"Fazendo a diferen??a\"\"; tratamento de exce????es integrado; arquivos, fluxos e serializa????o de objetos; concorr??ncia para melhor desempenho com multiprocessamento; o livro cont??m o conte??do principal para cursos introdut??rios; outros t??picos: recurs??o, pesquisa, classifica????o, cole????es gen??ricas, estruturas de dados, multithreading, banco de dados (JDBC ??? e JPA).',' Paul Deitel & Harvey Deitel','Pearson Universidades','Inform??tica',968,2016,'8543004799','Portugues',1,'javaComoProgramar.jpg'),(19,'Mindset: A nova psicologia do sucesso','Carol S. Dweck, ph.D., professora de psicologia na Universidade Stanford e especialista internacional em sucesso e motiva????o, desenvolveu, ao longo de d??cadas de pesquisa, um conceito fundamental: a atitude mental com que encaramos a vida, que ela chama de ???mindset???, ?? crucial para o sucesso. Dweck revela de forma brilhante como o sucesso pode ser alcan??ado pela maneira como lidamos com nossos objetivos. O mindset n??o ?? um mero tra??o de personalidade, ?? a explica????o de por que somos otimistas ou pessimistas, bem-sucedidos ou n??o. Ele define nossa rela????o com o trabalho e com as pessoas e a maneira como educamos nossos filhos. ?? um fator decisivo para que todo o nosso potencial seja explorado.','Carol S. Dweck','Objetiva','Psicologia',312,2017,'8547000240','Portugues',1,'mindset.jpg'),(20,'Programa????o Funcional','O desenvolvimento de software atualmente est?? encampando a programa????o funcional (FP - Functional Programming), seja para escrever programas concorrentes, seja para gerenciar grandes volumes de dados. Onde isso deixa os desenvolvedores Java? Este livro conciso oferece uma introdu????o pragm??tica e acess??vel a FP para desenvolvedores Java ou qualquer pessoa que use uma linguagem orientada a objetos.\r\n\r\nDean Wampler, especialista em Java e autor de Programming Scala (O\'Reilly), mostra a voc?? como aplicar princ??pios de FP como imutabilidade, evitar efeitos colaterais e fun????es de ordem mais alta no seu c??digo em Java.\r\nCada cap??tulo fornece exerc??cios para auxili??-lo a praticar o que aprendeu. Assim que voc?? entender os benef??cios da programa????o funcional, descobrir?? que ela melhora todo o c??digo que voc?? escreve.\r\n- Aprenda os princ??pios b??sicos da FP e aplique-os ?? programa????o orientada a objetos\r\n- Descubra como a FP ?? mais concisa e modular que a OOP\r\n- Aprenda li????es ??teis de FP para o seu projeto de tipos em Java ??? como, por exemplo, evitar nulos\r\n- Projete estruturas de dados e algoritmos usando princ??pios de programa????o funcional\r\n- Escreva programas concorrentes usando o modelo Actor e software transactional memory\r\n- Use bibliotecas funcionais e frameworks para Java ??? e aprenda aonde ir a seguir para aprofundar seu conhecimento em programa????o funcional','Dean Wampler','Novatec','Inform??tica',112,2012,'857522316X','Portugues',1,'programFuncional.jpg'),(21,'Ponto de inflex??o','Um livro que vai te ajudar a fazer seu pr??prio caminho. ???Vou dispensar o aprofundamento nas equa????es que geram um Ponto de Inflex??o, mas vou apenas me apropriar deste conceito para descrever momentos de nossa vida em que nossas decis??es v??o determinar para que dire????o seguiremos e que b??nus ou ??nus assumiremos. Em outras palavras, tomamos milhares de decis??es diariamente. Por??m, algumas delas n??o s??o decis??es corriqueiras. S??o decis??es especiais. Decis??es que t??m o poder de mudar o rumo do roteiro de nossa vida. A elas eu dou o nome de Ponto de Inflex??o. ?? um conceito da matem??tica, mas que usaremos para ilustrar perfeitamente os momentos de nossa vida que podem tomar dire????es opostas a depender de nossas escolhas.???','Flavio Augusto','Buzz Editora','Administra????o',208,2019,'8593156835','Portugues',1,'pontoInflexao.jpg'),(22,'UML 2 - Uma Abordagem Pr??tica','A UML - Unified Modeling Language ou Linguagem de Modelagem Unificada - ?? uma linguagem utilizada para modelar softwares baseados no paradigma de orienta????o a objetos, aplicada principalmente durante as fases de an??lise de requisitos e projeto de software. Essa linguagem consagrou-se como a linguagem-padr??o de modelagem adotada internacionalmente pela ind??stria de Engenharia de Software, havendo um amplo mercado para profissionais que a dominem. Este livro procura ensinar ao leitor, por meio de exemplos pr??ticos, como modelar softwares por meio da UML. A linguagem ?? ensinada mediante a apresenta????o de seus muitos diagramas, detalhando o prop??sito e a aplica????o de cada um deles, bem como os elementos que os comp??em, suas fun????es e como podem ser aplicados. A obra enfatiza ainda a import??ncia da UML para a Engenharia de Software, al??m de abordar o paradigma de orienta????o a objetos, um conceito imprescind??vel para a compreens??o correta da linguagem. Al??m disso, o livro demonstra tamb??m como mapear classes em tabelas de banco de dados relacionais, enfocando a quest??o de persist??ncia. A obra cont??m diversos estudos de caso modelados como exemplos ao longo dos cap??tulos, al??m de um estudo de caso maior no final do livro, em que um sistema ?? analisado e modelado, com a ilustra????o completa de todos os diagramas referentes ao software.','Gilleanes T. A. Guedes','Novatec','Inform??tica',496,2018,'8575226460','Portugues',1,'UML2.jpg'),(23,'M??os ?? obra: aprendizado de m??quina ','CONCEITOS, FERRAMENTAS E T??CNICAS PARA A CONSTRU????O DE SISTEMAS INTELIGENTES. Com uma s??rie de recentes avan??os, o aprendizado profundo impulsionou todo o campo do aprendizado de m??quina. Agora, mesmo os programadores que pouco sabem sobre esta tecnologia podem utilizar ferramentas simples e eficientes para implementar programas capazes de aprender com dados. Este livro pr??tico mostra como faz??-lo.Utilizando exemplos concretos, uma teoria m??nima e duas estruturas Python prontas para produ????o - Scikit-Learn e TensorFlow - o autor Aur??lien G??ron ajuda voc?? a adquirir uma compreens??o intuitiva dos conceitos e ferramentas para a constru????o de sistemas inteligentes. Voc?? aprender?? uma variedade de t??cnicas, come??ando com uma regress??o linear simples e progredindo para redes neurais profundas. Com exerc??cios em cada cap??tulo para ajud??-lo a aplicar o que aprendeu, voc?? s?? precisa ter experi??ncia em programa????o para come??ar. - Explore o cen??rio do aprendizado de m??quina, especialmente as redes neurais- Utilize o Scikit-Learn para acompanhar um exemplo de projeto de aprendizado de m??quina de ponta a ponta- Examine v??rios modelos de treinamento, incluindo m??quinas de vetor de suporte, ??rvores de decis??o, florestas aleat??rias em??todos de ensemble- Use a biblioteca TensorFlow para construir e treinar redes neurais- Mergulhe em arquiteturas de rede neural, incluindo redes convolutivas, redes recorrentes e aprendizado por refor??o profundo- Aprenda t??cnicas para treinamento e dimensionamento de redes neurais profundas- Aplique exemplos pr??ticos de c??digo sem recorrer a teorias excessivas ou detalhes de algoritmo do aprendizado de m??quinas','Aur??lien G??ron','Alta Books','Inform??tica',576,2019,'8550803812','Portugues',1,'maosAObra.jpg'),(24,'Think Java: How to Think Like a Computer Scientist','Currently used at many colleges, universities, and high schools, this hands-on introduction to computer science is ideal for people with little or no programming experience. The goal of this concise book is not just to teach you Java, but to help you think like a computer scientist. You???ll learn how to program???a useful skill by itself???but you???ll also discover how to use programming as a means to an end.\r\n\r\nAuthors Allen Downey and Chris Mayfield start with the most basic concepts and gradually move into topics that are more complex, such as recursion and object-oriented programming. Each brief chapter covers the material for one week of a college course and includes exercises to help you practice what you???ve learned.\r\n\r\n    Learn one concept at a time: tackle complex topics in a series of small steps with examples\r\n    Understand how to formulate problems, think creatively about solutions, and write programs clearly and accurately\r\n    Determine which development techniques work best for you, and practice the important skill of debugging\r\n    Learn relationships among input and output, decisions and loops, classes and methods, strings and arrays\r\n    Work on exercises involving word games, graphics, puzzles, and playing cards\r\n\r\nThe updated second edition of Think Java also features new chapters on polymorphism and data processing, as well as content covering changes through Java 12.',' Allen B. Downey & Chris Mayfield ','O\'Reilly Media','Inform??tica',328,2019,'978-1492072508','Ingles',1,'thinkJava.jpg'),(25,'Os segredos da mente milion??ria','Aprenda a enriquecer mudando seus conceitos sobre o dinheiro e adotando os h??bitos das pessoas bem-sucedidas\r\n\r\n\"T. Harv Eker desmistifica o motivo pelo qual algumas pessoas est??o destinadas ?? riqueza e outras a uma vida de dureza. Se voc?? quer conhecer as causas fundamentais do sucesso, leia este livro.\"?????? Robert G. Allen, autor de O milion??rio em um minuto\r\n\r\n\"H?? anos eu acompanho e admiro o trabalho de Harv Eker. Recomendo este livro a todas as pessoas que querem aumentar a sua riqueza financeira, mental e emocional.\" ??? Jack Canfield, co-autor da s??rie Hist??rias para aquecer o cora????o\r\n\r\nSe as suas finan??as andam na corda bamba, talvez esteja na hora de voc?? refletir sobre o que T. Harv Eker chama de \"o seu modelo de dinheiro\" ??? um conjunto de cren??as que cada um de n??s alimenta desde a inf??ncia e que molda o nosso destino financeiro, quase sempre nos levando para uma situa????o dif??cil.\r\n\r\nNeste livro, Eker mostra como substituir uma mentalidade destrutiva ??? que voc?? talvez nem perceba que tem ??? pelos \"arquivos de riqueza\", 17 modos de pensar e agir que distinguem os ricos das demais pessoas. Alguns desses princ??pios fundamentais s??o:\r\n\r\n??? Ou voc?? controla o seu dinheiro ou ele controlar?? voc??.\r\n\r\n??? O h??bito de administrar as finan??as ?? mais importante do que a quantidade de dinheiro que voc?? tem.\r\n\r\n??? A sua motiva????o para enriquecer ?? crucial: se ela possui uma raiz negativa, como o medo, a raiva ou a necessidade de provar algo a si mesmo, o dinheiro nunca lhe trar?? felicidade.\r\n\r\n??? O segredo do sucesso n??o ?? tentar evitar os problemas nem se livrar deles, mas crescer pessoalmente para se tornar maior do que qualquer adversidade.\r\n\r\n??? Os gastos excessivos t??m pouco a ver com o que voc?? est?? comprando e tudo a ver com a falta de satisfa????o na sua vida.\r\n\r\nO autor tamb??m ensina um m??todo eficiente de administrar o dinheiro. Voc?? aprender?? a estabelecer sua remunera????o pelos resultados que apresenta e n??o pelas horas que trabalha. Al??m disso, saber?? como aumentar o seu patrim??nio l??quido ??? a verdadeira medida da riqueza.\r\n\r\nA Ideia ?? fazer o seu dinheiro trabalhar para voc?? tanto quanto voc?? trabalha para ele. Para isso, ?? necess??rio poupar e investir em vez de gastar. \"Enriquecer n??o diz respeito somente a ficar rico em termos financeiros\", diz Eker. \"?? mais do que isso: trata-se da pessoa que voc?? se torna para alcan??ar esse objetivo.\" ','T. Harv Eker','Editora Sextante','Administra????o',176,1992,'8575422391','Portugues',1,'menteMilionario.jpg'),(26,'Como convencer algu??m em 90 segundos: Crie uma primeira impress??o vendedora','Como convencer algu??m em 90 segundos ?? a garantia de uma comunica????o de sucesso, transformando as conex??es instant??neas em duradouras e produtivas rela????es de neg??cios.\r\n\r\nNeste livro, o especialista Nicholas Boothman ensina como usar o rosto, o corpo, a atitude e a voz para causar uma primeira impress??o marcante, estabelecendo confian??a imediata e criando fortes v??nculos de credibilidade.','Nicholas Boothman','Universo dos Livros ','Auto ajuda',264,2012,'8579303192','Portugues',1,'convercer90.jpg'),(27,'Pai rico, pai pobre','Celebrando 20 anos como o livro n?? 1 em finan??as pessoais.A escola prepara as crian??as para o mundo real? Essa ?? a primeira pergunta com a qual o leitor se depara neste livro. O recado ?? ousado e direto: boa forma????o e notas altas n??o bastam para assegurar o sucesso de algu??m. O mundo mudou; a maioria dos jovens tem cart??o de cr??dito, antes mesmo de concluir os estudos, e nunca teve aula sobre dinheiro, investimentos, juros etc. Ou seja, eles v??o para a escola, mas continuam financeiramente improficientes, despreparados para enfrentar um mundo que valoriza mais as despesas do que a poupan??a.Para o autor, o conselho mais perigoso que se pode dar a um jovem nos dias de hoje ??: ???V?? para a escola, tire notas altas e depois procure um trabalho seguro.??? O fato ?? que agora as regras s??o outras, e n??o existe mais emprego garantido para ningu??m. Pai Rico, Pai Pobre demonstra que a quest??o n??o ?? ser empregado ou empregador, mas ter o controle do pr??prio destino ou deleg??-lo a algu??m. ?? essa a tese de Robert Kiyosaki neste livro substancial e vision??rio. Para ele, a forma????o proporcionada pelo sistema educacional n??o prepara os jovens para o mundo que encontrar??o depois de formados.E como os pais podem ensinar aos filhos o que a escola relega? Essa ?? outra das muitas perguntas que o leitor encontra em Pai Rico, Pai Pobre. Nesse sentido, a proposta do autor ?? facilitar a tarefa dos pais. Quem entende de contabilidade deve esquecer seus conhecimentos acad??micos, pois muitas das teorias expostas por Robert Kiyosaki contrariam os princ??pios cont??beis comumente aceitos, e apresentam uma valiosa e moderna percep????o do modo como se realizam os investimentos.A sociedade sofre mudan??as radicais e, talvez, de propor????es maiores do que as ocorridas em s??culos passados. N??o existe bola de cristal, mas algo ?? certo: a perspectiva global de transforma????es transcende nossa realidade imediata. Aconte??a o que acontecer,s?? existem duas alternativas: seguran??a ou independ??ncia financeira. E o objetivo de Pai Rico, Pai Pobre ?? instruir o leitor e despertar sua intelig??ncia financeira e a de seus filhos.???A principal raz??o pela qual as pessoas t??m problemas financeiros ?? que passaram anos na escola, mas n??o aprenderam nada sobre dinheiro. O resultado ?? que elas aprendem a trabalhar por dinheiro??? mas nunca a faz??-lo trabalhar para elas.??? - Robert Kiyosaki.','Kiyosaki Robert T','Alta Books','Administra????o',336,2017,'8550801488','Portugues',2,'paiRicoPaiPobre.jpg'),(28,'Manual de DevOps: como obter agilidade, confiabilidade e seguran??a em organiza????es ','A converg??ncia de v??rios movimentos importantes em gest??o e tecnologia prepararam o terreno para o movimento DevOps, que resulta da aplica????o dos princ??pios mais confi??veis da manufatura f??sica e da lideran??a no fluxo de valor de TI.Em Manual de Devops voc?? ver?? que as organiza????es que adotam os princ??pios e pr??ticas Lean melhoram significativamente a produtividade da f??brica, os tempos de execu????o para o cliente, a qualidade do produto e a satisfa????o do cliente, permitindo que ven??am no mercado.Entenda melhor o potencial da revolu????o DevOps e como as organiza????es de alto desempenho ampliam as chances de exceder metas de lucratividade, participa????o de mercado e produtividade.Para tanto, s??o apresentados os princ??pios da Manufatura Enxuta e das Tr??s Maneiras: Fluxo, Feedback e Aprendizado Cont??nuo, a partir dos quais todos os comportamentos de DevOps observados podem ser derivados.???Quem precisa se envolver? Como proteger, organizar e capacitar as equipes? Como maximizar as chances de sucesso???? S??o apenas algumas das quest??es que esta obra se prop??e a esclarecer. Saiba como dar in??cio a esta transforma????o nas empresas, e mais importante, sem causar caos e perturba????es no ambiente de produ????o e nos clientes.','Gene Kim','Alta Books','Inform??tica',464,2018,'8550802697','Portugues',1,'manualDevOps.jpg'),(29,'Estruturas de Dados e Algoritmos com JavaScript: Escreva um C??digo JavaScript Complexo e Eficaz Usando a Mais Recente ECMAScript','Uma estrutura de dados ?? uma maneira particular de organizar dados em um computador com o intuito de usar os recursos de modo eficaz. As estruturas de dados e os algoritmos s??o a base de todas as solu????es para qualquer problema de programa????o. Com este livro, voc?? aprender?? a escrever c??digos complexos e eficazes usando os recursos mais recentes da ES 2017.\r\nO livro \"Estruturas de dados e algoritmos com JavaScript\" come??a abordando o b??sico sobre JavaScript e apresenta a ECMAScript 2017, antes de passar gradualmente para as estruturas de dados mais importantes, como arrays, filas, pilhas e listas ligadas. Voc?? adquirir?? um conhecimento profundo sobre como as tabelas hash e as estruturas de dados para conjuntos funcionam, assim como de que modo as ??rvores e os mapas hash podem ser usados para buscar arquivos em um disco r??gido ou para representar um banco de dados. Este livro serve como um caminho para voc?? mergulhar mais fundo no JavaScript. Voc?? tamb??m ter?? uma melhor compreens??o de como e por que os grafos ??? uma das estruturas de dados mais complexas que h?? ??? s??o amplamente usados em sistemas de navega????o por GPS e em redes sociais.','Loiane Groner','Novatec','Inform??tica',408,2019,'8575226932','Portugues',1,'estruturaDadosJS.jpg'),(30,'Refatora????o: Aperfei??oando o Design de C??digos Existentes','Por mais de vinte anos, programadores experientes no mundo inteiro contaram com o livro Refatora????o de Martin Fowler para aperfei??oar o design de c??digos existentes e melhorar a manutenibilidade do software, assim como para deixar o c??digo existente mais f??cil de entender. Essa nova edi????o ansiosamente esperada foi atualizada por completo para refletir mudan??as vitais no dom??nio da programa????o. Refatora????o 2?? edi????o cont??m um cat??logo atualizado das refatora????es e inclui exemplos de c??digo JavaScript bem como novos exemplos funcionais que demonstram a refatora????o sem classes. Assim como na edi????o original, este livro explica o que ?? refatora????o, por que voc?? deve refatorar, como reorganizar um c??digo que precise de refatora????o e como fazer isso de forma bem-sucedida, independentemente da linguagem usada. ??? Entenda o processo e os princ??pios b??sicos da refatora????o. ??? Aplique rapidamente refatora????es convenientes para deixar um programa mais f??cil de entender e de alterar. ??? Reconhe??a ???maus cheiros??? no c??digo que sinalizam oportunidades para refatorar. ??? Explore as refatora????es, cada uma com suas explica????es, a motiva????o, o mecanismo e exemplos simples. ??? Escreva testes robustos para suas refatora????es. ??? Reconhe??a as contrapartidas e os obst??culos para a refatora????o.','Martin Fowler','Novatec','Inform??tica',456,2020,'8575227246','Portugues',1,'refatoracao.jpg'),(33,'Use a cabe??a!: Java','Use a Cabe??a! Java ?? uma experi??ncia completa de aprendizado em programa????o orientada a objetos (OO) e Java.\r\n                Projetado de acordo com princ??pios de aprendizado simples, este livro mostrar?? de aspectos b??sicos da linguagem a t??picos avan??ados que incluem segmentos, soquetes de rede e programa????o distribu??da. O mais importante ?? que voc?? aprender?? a pensar como um desenvolvedor orientado a objetos. E n??o ir?? apenas ler: voc?? vai participar de jogos, resolver quebra-cabe??as, refletir sobre mist??rios e interagir com Java de formas nunca imaginadas. No decorrer da leitura, voc?? escrever?? muitos c??digos Java reais.','Kathy Sierra','Alta Books','Inform??tica',496,2007,'8576081733','Portugues',1,'PENSEJAVA.jpg');
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `idMenu` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `exibir` int NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Livros','index.jsp',1),(3,'Perfis','listar_perfil.jsp',1),(4,'Alterar Perfil','gerenciar_perfil.do?acao=alterar',2),(5,'Deletar Perfil','gerenciar_perfil.do?acao=deletar',2),(6,'Gerenciar Perfil Menu','gerenciar_menu_perfil.do?acao=gerenciar',2),(7,'Menus','listar_menu.jsp',1),(8,'Cadastrar Menu','form_menu.jsp',2),(9,'Cadastrar Perfil','form_perfil',2),(10,'Alterar Menu','gerenciar_menu.do?acao=alterar',2),(11,'Deletar Menu','gerenciar_menu.do?acao=deletar',2),(12,'Formulario Perfil  Menu','form_menu_perfil.jsp',2),(13,'Usuarios','listar_usuario.jsp',1),(14,'Cadastrar Usuario','form_usuario.jsp',2),(15,'Alterar Usuario','gerenciar_usuario.do?acao=alterar',2),(16,'Deletar Usuario','gerenciar_usuario.do?acao=deletar',2),(17,'Clientes','listar_cliente.jsp',1),(18,'Cadastrar Cliente','form_cliente.jsp',2),(19,'Alterar Cliente','gerenciar_cliente.do?acao=alterar',2),(20,'Deletar Cliente','gerenciar_cliente.do?acao=deletar',2),(21,'Exibir Livro','gerenciar_livro.do?acao=exibir',2),(22,'Exibir Livro Form','exibir_livro.jsp',2),(23,'Alterar Livro Form','form_livro.jsp',2),(24,'Alterar Livro','gerenciar_livro.do?acao=alterar',2),(25,'Livro Gerenciar','gerenciar_livro.do',2),(26,'Form Emprestimo','form_emprestimo.jsp',2),(27,'Emprestimos','listar_emprestimo.jsp',1),(28,'Registrar Emprestimo','gerenciar_emprestimo.do',2),(29,'Alterar Emprestimo','gerenciar_emprestimo.do?acao=alterar',2),(30,'Deletar Emprestimo','gerenciar_emprestimo.do?acao=deletar',2),(32,'Menu Perfil Desvincular','gerenciar_menu_perfil.do?acao=desvincular',2),(33,'Deletar Livro','gerenciar_livro.do?acao=deletar',2);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_perfil`
--

DROP TABLE IF EXISTS `menu_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_perfil` (
  `idMenu` int NOT NULL,
  `idPerfil` int NOT NULL,
  PRIMARY KEY (`idMenu`,`idPerfil`),
  KEY `fk_menu_has_perfil_perfil1_idx` (`idPerfil`),
  KEY `fk_menu_has_perfil_menu1_idx` (`idMenu`),
  CONSTRAINT `fk_menu_has_perfil_menu1` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_perfil`
--

LOCK TABLES `menu_perfil` WRITE;
/*!40000 ALTER TABLE `menu_perfil` DISABLE KEYS */;
INSERT INTO `menu_perfil` VALUES (1,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(32,1),(33,1),(1,2),(3,2),(4,2),(5,2),(6,2),(9,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(32,2),(33,2),(1,3),(17,3),(18,3),(19,3),(21,3),(22,3),(23,3),(24,3),(25,3),(26,3),(27,3),(28,3),(29,3);
/*!40000 ALTER TABLE `menu_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `idPerfil` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
INSERT INTO `perfil` VALUES (1,'Administrador'),(2,'Bibliotecario'),(3,'Funcionario');
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `dataNascimento` date NOT NULL,
  `sexo` enum('f','m') NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(60) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `email` varchar(100) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `numero` int DEFAULT NULL,
  `uf` varchar(2) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `idPerfil` int NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_perfil_idx` (`idPerfil`),
  CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Luan','Mateus','2002-02-06','m','111.111.111-11','1111111','luanmateuz','$2a$11$hc3SRmun1j5LCGuf5jDdbu4TGD869nSOs3Pgc4MAqYkJ1x3A.M3vq',1,'luan@gmail.com','11111-1111','71805417','QN 5 Conjunto 17',22,'DF','Riacho Fundo I','Bras??lia','ABCDE',1),(2,'Joao','Lucas','1991-07-09','m','000.000.000-00','0000000','joao','$2a$11$B6Uu1FvQ1vLfrcVvgTbDq.Zbxno/WUQ8YM3QacebL13QQ4hDob2Sq',2,'joao@email.com','11111-1111','71805411','QN 5 Conjunto 11',5,'DF','Riacho Fundo I','Bras??lia','',2),(3,'Ryan','Rodrigues','2019-05-09','m','123.131.313-13','1231313','ryan','$2a$11$Hj.DVvsgMIHhMb/NwwAafuzcuqoGgZEEa13BojumSeNE3uBBRfbjO',1,'ryan@email.com','12312-3132','71540130','SMLN ML Trecho 13',11,'DF','Setor de Mans??es do Lago Norte','Bras??lia','',3),(5,'Rafael','Fabiano','2000-07-02','m','123.456.789-10','1234567','rafael','$2a$11$RgJ/1eCjJR3Fh6OKV8yE5eF3Z06G8QZ5qh5QePBKbQgfMqp/i8jmm',1,'prof.rafaelfabiano@gmail.com','98985-4457','72130396','??rea Especial 12',3,'DF','Taguatinga Norte (Taguatinga)','Bras??lia','',2);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-21 16:16:28
