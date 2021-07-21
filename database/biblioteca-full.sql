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
INSERT INTO `cliente` VALUES (1,'Mateus','Vital','2006-01-09','m','934.109.238-40',1,'mateus@email.com','98989-8998','71973100','QS 8',4,'DF','Areal (Águas Claras)','Brasília',''),(2,'Luciano','Ribeiro','1996-06-06','m','218.742.189-74',1,'luciano@email.com','89798-7989','71973100','QS 8',4,'DF','Areal (Águas Claras)','Brasília','Ponto de Onibus'),(3,'Carlos','Daniel','1996-03-06','m','821.374.981-72',1,'carlos@email.com.br','32453-4534','76310000','Joaquim M',20,'GO','Centro','Rialma',''),(4,'Maria','Fernanda','2004-02-26','m','982.412.984-37',1,'mariaf@gmail.com','89989-8989','76305000','Oriente',11,'GO','Novo Oriente','Nova Glória','Municipio de Nova Gloria'),(5,'Alynne','Elaynne','1996-07-04','f','821.374.981-72',1,'alynne@email.com','88888-8888','71973100','QS 8',4,'DF','Areal (Águas Claras)','Brasília',''),(6,'Juan','Matias','2000-06-28','m','712.834.781-23',2,'juan@email.com','83242-3748','72631227','Quadra 406 Conjunto Z1',6,'DF','Recanto das Emas','Brasília',''),(7,'Denis','Carlos','1995-07-03','m','798.008.988-07',1,'deniscarlos@email.com','98989-8989','72631227','Quadra 406 Conjunto Z1',3,'DF','Recanto das Emas','Brasília',''),(8,'Jacira','Alves','1999-04-22','f','988.998.898-99',1,'jacira@email.com','88898-9898','70760516','SCLRN 712 Bloco F',10,'DF','Asa Norte','Brasília',''),(9,'Lizandra','Alves','2000-04-30','f','987.789.987-97',1,'lizandra@email.com','99999-9999','70070120','SBS Quadra 2',15,'DF','Asa Sul','Brasília',''),(10,'Lucas','Souza','2002-01-23','m','121.212.121-21',1,'lucas@email.com','98989-8989','71020180','QI 1 Conjunto R',4,'DF','Guará I','Brasília',''),(11,'Luiz','Eduardo','2001-06-12','m','899.878.987-99',1,'luizovioleiro@email.com','98779-8798','72500120','Quadra AC 300',31,'DF','Santa Maria','Brasília','');
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
INSERT INTO `emprestimo` VALUES (8,'2021-05-24','2021-05-25',1,1,1,'',0,1,3),(10,'2021-06-01','2021-06-03',2,2,1,'',0,1,3),(12,'2021-05-17','2021-05-31',3,1,11,'Devolução atrasada',10,1,3),(13,'2021-05-17','2021-05-28',5,1,15,NULL,0,0,3),(14,'2021-05-31','2021-06-11',4,3,22,'Devolução atrasada',10,1,3),(27,'2021-07-05','2021-07-09',2,1,27,NULL,0,0,1),(28,'2021-07-05','2021-07-16',10,1,21,NULL,0,0,3),(29,'2021-07-05','2021-07-16',9,5,20,'Pagina rasgada',5,1,3),(30,'2021-07-07','2021-07-16',11,5,33,'',0,1,3);
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
INSERT INTO `livro` VALUES (1,'1984','Publicado em 1949, o texto de Orwell nasceu destinado à polêmica. Traduzido em mais de sessenta países, virou minissérie, filmes, quadrinhos, mangás e até uma ópera. Ganhou holofotes em 1999, quando uma produtora holandesa batizou seu reality show de Big Brother. 1984 foi responsável pela popularização de muitos termos e conceitos, como Grande Irmão, duplopensar, novidioma, buraco da memória e 2 2 5. O trabalho de Winston, o herói de 1984, é reescrever artigos de jornais do passado, de modo que o registro histórico sempre apoie a ideologia do Partido. Grande parte do Ministério também destrói os documentos que não foram revisados, dessa forma não há como provar que o governo esteja mentindo. Winston é um trabalhador diligente e habilidoso, mas odeia secretamente o Partido e sonha com a rebelião contra o Grande Irmão.','George Orwell','Principis','Ciência Política',336,1945,'6555522267','Portugues',1,'teste.png'),(9,'O homem mais rico da Babilônia ','Com mais de dois milhões de exemplares vendidos no mundo todo, O homem mais rico da Babilônia é um clássico sobre como multiplicar riqueza e solucionar problemas financeiros. Baseando-se nos segredos de sucesso dos antigos babilônicos ― os habitantes da cidade mais rica e próspera de seu tempo ―, George S. Clason mostra soluções ao mesmo tempo sábias e muito atuais para evitar a falta de dinheiro, como não desperdiçar recursos durante tempos de opulência, buscar conhecimento e informação em vez de apenas lucro, assegurar uma renda para o futuro, manter a pontualidade no pagamento de dívidas e, sobretudo, cultivar as próprias aptidões, tornando-se cada vez mais habilidoso e consciente.','George S Clason','HarperCollins ','Auto ajuda',160,2017,' 8595081530 ','Portugues',1,'homemricobabiblonia.jpg'),(10,'Do Mil ao Milhão. Sem Cortar o Cafezinho','Em seu primeiro livro, Thiago Nigro, criador da plataforma O Primo Rico, ensina aos leitores os três pilares para atingir a independência financeira: gastar bem, investir melhor e ganhar mais. Por meio de dados e de sua própria experiência como investidor e assessor, Nigro mostra que a riqueza é possível para todos – basta estar disposto a aprender e se dedicar.','Thiago Nigro','HarperCollins','Outros Assuntos',192,2018,'8595083274','Portugues',1,'milaomilhao.jpg'),(11,'O poder da ação','Acorde para os objetivos que quer conquistar. Já aconteceu a você de se olhar no espelho e não gostar daqueles quilos a mais? De observar seu momento profissional somente com frustração? De se sentir desconectado dos seus familiares, dos seus amigos? Se você acha que essas são situações normais, pense de novo! Só porque isso acontece com várias pessoas não quer dizer que a vida deva ser assim. Só porque algo se torna comum, não significa que seja normal! Neste livro, Paulo Vieira lhe convida a quebrar o ciclo vicioso e iniciar um caminho de realização. Para isso, ele apresenta o método responsável por impactar 250 mil pessoas ao longo de sua carreira - e que pode ser a chave para o que você tanto procura. No decorrer destas páginas, o autor lhe entrega uma bússola. E para conseguir se guiar por ela você terá de assumir um compromisso com a mudança. Preparado? Aproveite todas as provocações e os desafios propostos nesta obra para conseguir, de fato, fazer o check-up completo sobre si mesmo. Acorde, creia, comunique, tenha foco, AJA! Pare de adiar sua vida e seja quem quer ser a partir de agora. Não existe outra opção. E está em suas mãos reescrever seu futuro.','Paulo Vieira','Gente','Auto ajuda',256,2015,'854520034X','Portugues',1,'poderAcao.jpg'),(12,'A psicologia das cores','Este livro aborda a relação das cores com os nossos sentimentos e mostra como as duas coisas não se combinam por acaso, já que as relações entre ambas não são apenas questões de gosto, mas sim experiências universais profundamente enraizadas na nossa linguagem e no nosso pensamento. Organizada em treze capítulos, correspondentes a treze cores diferentes, a obra oferece um rico painel de informações sobre as cores: de ditados e saberes populares até sua utilização na área de design de produto, os diversos testes baseados em cores, as terapias cromáticas, a manipulação de pessoas, os nomes e sobrenomes relacionados com as cores etc. A diversidade desta abordagem faz do trabalho de Eva Heller uma ferramenta indispensável para todos os que trabalham com cores: artistas, terapeutas, designers gráficos e industriais, decoradores, arquitetos, designers de moda, publicitários, entre outros.','Eva Heller','Olhares','Artesanato',311,2021,'658828005X','Portugues',1,'psicologiaCores.jpg'),(13,'A lei: por que a esquerda não funciona','Este livro traz uma reflexão prática sobre ideias de filósofos e outros pensadores acerca da politica e da vida em sociedade, dentre eles  John Locke e Adam Smith, e trata de temas como liberdade, direitos à propriedade, espoliação, igualdade, livre iniciativa, impostos, democracia, sufrágio universal, autoritarismo e tantos outros que, passados quase dois  séculos, ainda provocam debates acalorados. Nesta edição estão incluídos comentários e análises que  relacionam o tema à legislação e à história política do Brasil contemporâneo.','Frederic Bastiat','Faro Editorial','Ciência Política',144,2016,'8562409715','Portugues',1,'aLei.jpg'),(14,'Fahrenheit 451','Guy Montag é um bombeiro. Sua profissão é atear fogo nos livros. Em um mundo onde as pessoas vivem em função das telas e a literatura está ameaçada de extinção, os livros são objetos proibidos, e seus portadores são considerados criminosos. Montag nunca questionou seu trabalho; vive uma vida comum, cumpre o expediente e retorna ao final do dia para sua esposa e para a rotina do lar. Até que conhece Clarisse, uma jovem de comportamento suspeito, cheia de imaginação e boas histórias. Quando sua esposa entra em colapso mental e Clarisse desaparece, a vida de Montag não poderá mais ser a mesma.\r\n\r\nUm clássico da ficção científica e da literatura distópica, Fahrenheit 451 foi escrito originalmente como um conto: \"O bombeiro\", contido no volume Prazer em Queimar: histórias de Fahrenheit 451. Incentivado pelo seu editor, transformou a ideia inicial em um romance, que se tornou um dos livros mais influentes de sua geração – e também um dos mais censurados e banidos de todos os tempos. Foi adaptado para o cinema duas vezes, a primeira pelas mãos do lendário cineasta francês François Truffaut, e depois para diversos formatos.\r\n\r\nEscrito durante a era do macartismo – a sistemática censura à arte promovida pelo governo americano nos anos 1950 – Bradbury costumava dizer que a proibição a livros não foi o motivo central que o levou a compor a obra, e sim a percepção de que as pessoas passavam a se interessar cada vez menos pela literatura com o surgimento de novas mídias, como a televisão. Com o passar do tempo, Fahrenheit 451 ganhou muitas camadas de interpretação: a história de um burocrata que questiona a vileza do seu trabalho, o poder libertador da palavra, a estupidez da censura às artes.\r\n\r\nEmbora soubesse estar testemunhando uma transformação social única, Bradbury afirmava não acreditar que o cenário que imaginou se tornaria realidade tão rápido. Lançado em 1953, Fahrenheit 451 é hoje uma obra de leitura indispensável junto com 1984, de George Orwell, e Admirável Mundo Novo, de Aldous Huxley.','Ray Bradbury & Cid Knipel ','Biblioteca Azul','Linguística',216,2012,'8525052248','Portugues',1,'Fahrenheit.jpg'),(15,'Laranja Mecânica','Uma das mais brilhantes sátiras distópicas já escritas, Laranja Mecânica ganhou fama ao ser adaptado em uma obra magistral do cinema pelas mãos de Stanley Kubrick. O livro, entretanto, também é um clássico moderno da ficção inglesa e um marco na cultura pop, que ao lado de 1984, de George Orwell, Admirável Mundo Novo, de Aldous Huxley, e Fahrenheit 451, de Ray Bradbury, representa um dos ícones literários da alienação pós-industrial.\r\n\r\nAlex é o jovem líder de uma gangue de adolescentes cuja diversão é cometer perversidades e atos de violência pelas ruas de uma cidade futurista governada por um Estado repressivo e totalitário. Depois de cometer um crime que termina em um assassinato, ele acaba preso pelo governo e submetido a um método experimental de recondicionamento de mentes criminosas, que se utiliza de terapia de aversão brutal.\r\n\r\nBrilhante, transgressivo e influente, o livro traz uma visão assombrosa do futuro contada em seu próprio léxico inventivo chamado “nadsat”, que mescla gírias de gangues inglesas e palavras russas. O filme homônimo de Stanley Kubrick teve como base as primeiras edições americanas deste livro, que por conta da insistência dos editores americanos, tiveram o capítulo final suprimido, acreditando que um final sem redenção para Alex seria mais realista. Esta edição, entretanto, mantém o capítulo final original.\r\n\r\nA nova edição ganha uma capa de Giovanna Cianelli inspirada em uma cena marcante do filme e que transmite toda a influência pop que ele representa, homenageando-o como clássico que é.\r\n\r\n+ Esta nova edição ganha capa da designer e ilustradora Giovanna Cianelli, que se inspirou em uma cena marcante do filme transmitindo toda a influência pop que ele representa.\r\n\r\n+ Laranja Mecânica, obra de Anthony Burgess, é um dos livros mais importantes do gênero distopia. O clássico está ao lado de títulos como Fahrenheit 451, Admirável Mundo Novo e 1984.\r\n\r\n+ Em 1971 a obra ganhou adaptação para o cinema nas mãos de Stanley Kubrick, que criou uma estética inovadora para filme. Apesar de nunca ter ganhado o Oscar, a produção é considerada por muitos a obra-prima do cineasta.\r\n\r\n+ Em sua terceira edição, o livro já vendeu mais de 150 mil exemplares.\r\n\r\n+ Contém os extras (que também estavam presentes nas outras edições): Nota do tradutor e glossário “nadsat”, vocabulário de gírias usadas pelos personagens no livro.','Anthony Burgess ','Editora Aleph','Contos',288,2019,' 8576574462 ','Portugues',1,'laranjaMecanica.jpg'),(16,'O Hobbit','Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos.\r\nEsta jornada fará Bilbo, Gandalf e 13 anãos atravessarem a Terra-média, passando por inúmeros perigos, sejam eles, os imensos trols, as Montanhas Nevoentas infestadas de gobelins ou a muito antiga e misteriosa Trevamata, até chegarem (se conseguirem) na Montanha Solitária. Lá está um incalculável tesouro, mas há um porém. Deitado em cima dele está Smaug, o Dourado, um dragão malicioso que... bem, você terá que ler e descobrir.\r\nLançado em 1937, O Hobbit é um divisor de águas na literatura fantástica mundial. Mais de 80 anos após a sua publicação, o livro que antecede os ocorridos em O Senhor dos Anéis continua arrebatando fãs de todas as idades, talvez pelo seu tom brincalhão com uma pitada de magia élfica, ou talvez porque J.R.R. Tolkien tenha escrito o melhor livro infanto-juvenil de todos os tempos.','J.R.R. Tolkien','HarperCollins','Contos',336,2019,'8595084742','Portugues',2,'oHobbit.jpg'),(17,'O poder da China','Com este livro, você aprenderá: As ferramentas básicas para decodificar a China; Qual é a relação China vs. mundo e como as empresas chinesas se internacionalizam; Por que e como a China tem crescido tão rapidamente; Como fazer negócios com o mercado chinês; Os detalhes dos principais protagonistas da nova economia digital da China; O que é a Nova Rota da Seda, em que o governo chinês promete investir US$ 1 trilhão no exterior; Quem são Shenzhen, Hangzhou e diversos outros unicórnios chineses; Por que é um consenso que a China ultrapassará a economia dos EUA.','Ricardo Geromel','Gente','Ciência Política',288,2019,'854520339X','Portugues',1,'poderChina.jpg'),(18,'Java®: Como Programar','Milhões de alunos e profissionais aprenderam programação e desenvolvimento de software com os livros Deitel®. Java: como programar, 10ª edição, fornece uma introdução clara, simples, envolvente e divertida à programação Java com ênfase inicial em objetos. Destaques incluem: rica cobertura dos fundamentos com exemplos reais; apresentação com ênfase inicial em classes e objetos; uso com Java™ SE 7, Java™ SE 8 ou ambos; Java™ SE 8 abordado em seções modulares opcionais; lambdas, fluxos e interfaces funcionais usando métodos padrão e estáticos do Java SE 8; Swing e GUI do JavaFX: elementos gráficos e multimídia; conjunto de exercícios \"\"Fazendo a diferença\"\"; tratamento de exceções integrado; arquivos, fluxos e serialização de objetos; concorrência para melhor desempenho com multiprocessamento; o livro contém o conteúdo principal para cursos introdutórios; outros tópicos: recursão, pesquisa, classificação, coleções genéricas, estruturas de dados, multithreading, banco de dados (JDBC ™ e JPA).',' Paul Deitel & Harvey Deitel','Pearson Universidades','Informática',968,2016,'8543004799','Portugues',1,'javaComoProgramar.jpg'),(19,'Mindset: A nova psicologia do sucesso','Carol S. Dweck, ph.D., professora de psicologia na Universidade Stanford e especialista internacional em sucesso e motivação, desenvolveu, ao longo de décadas de pesquisa, um conceito fundamental: a atitude mental com que encaramos a vida, que ela chama de “mindset”, é crucial para o sucesso. Dweck revela de forma brilhante como o sucesso pode ser alcançado pela maneira como lidamos com nossos objetivos. O mindset não é um mero traço de personalidade, é a explicação de por que somos otimistas ou pessimistas, bem-sucedidos ou não. Ele define nossa relação com o trabalho e com as pessoas e a maneira como educamos nossos filhos. É um fator decisivo para que todo o nosso potencial seja explorado.','Carol S. Dweck','Objetiva','Psicologia',312,2017,'8547000240','Portugues',1,'mindset.jpg'),(20,'Programação Funcional','O desenvolvimento de software atualmente está encampando a programação funcional (FP - Functional Programming), seja para escrever programas concorrentes, seja para gerenciar grandes volumes de dados. Onde isso deixa os desenvolvedores Java? Este livro conciso oferece uma introdução pragmática e acessível a FP para desenvolvedores Java ou qualquer pessoa que use uma linguagem orientada a objetos.\r\n\r\nDean Wampler, especialista em Java e autor de Programming Scala (O\'Reilly), mostra a você como aplicar princípios de FP como imutabilidade, evitar efeitos colaterais e funções de ordem mais alta no seu código em Java.\r\nCada capítulo fornece exercícios para auxiliá-lo a praticar o que aprendeu. Assim que você entender os benefícios da programação funcional, descobrirá que ela melhora todo o código que você escreve.\r\n- Aprenda os princípios básicos da FP e aplique-os à programação orientada a objetos\r\n- Descubra como a FP é mais concisa e modular que a OOP\r\n- Aprenda lições úteis de FP para o seu projeto de tipos em Java – como, por exemplo, evitar nulos\r\n- Projete estruturas de dados e algoritmos usando princípios de programação funcional\r\n- Escreva programas concorrentes usando o modelo Actor e software transactional memory\r\n- Use bibliotecas funcionais e frameworks para Java – e aprenda aonde ir a seguir para aprofundar seu conhecimento em programação funcional','Dean Wampler','Novatec','Informática',112,2012,'857522316X','Portugues',1,'programFuncional.jpg'),(21,'Ponto de inflexão','Um livro que vai te ajudar a fazer seu próprio caminho. “Vou dispensar o aprofundamento nas equações que geram um Ponto de Inflexão, mas vou apenas me apropriar deste conceito para descrever momentos de nossa vida em que nossas decisões vão determinar para que direção seguiremos e que bônus ou ônus assumiremos. Em outras palavras, tomamos milhares de decisões diariamente. Porém, algumas delas não são decisões corriqueiras. São decisões especiais. Decisões que têm o poder de mudar o rumo do roteiro de nossa vida. A elas eu dou o nome de Ponto de Inflexão. É um conceito da matemática, mas que usaremos para ilustrar perfeitamente os momentos de nossa vida que podem tomar direções opostas a depender de nossas escolhas.”','Flavio Augusto','Buzz Editora','Administração',208,2019,'8593156835','Portugues',1,'pontoInflexao.jpg'),(22,'UML 2 - Uma Abordagem Prática','A UML - Unified Modeling Language ou Linguagem de Modelagem Unificada - é uma linguagem utilizada para modelar softwares baseados no paradigma de orientação a objetos, aplicada principalmente durante as fases de análise de requisitos e projeto de software. Essa linguagem consagrou-se como a linguagem-padrão de modelagem adotada internacionalmente pela indústria de Engenharia de Software, havendo um amplo mercado para profissionais que a dominem. Este livro procura ensinar ao leitor, por meio de exemplos práticos, como modelar softwares por meio da UML. A linguagem é ensinada mediante a apresentação de seus muitos diagramas, detalhando o propósito e a aplicação de cada um deles, bem como os elementos que os compõem, suas funções e como podem ser aplicados. A obra enfatiza ainda a importância da UML para a Engenharia de Software, além de abordar o paradigma de orientação a objetos, um conceito imprescindível para a compreensão correta da linguagem. Além disso, o livro demonstra também como mapear classes em tabelas de banco de dados relacionais, enfocando a questão de persistência. A obra contém diversos estudos de caso modelados como exemplos ao longo dos capítulos, além de um estudo de caso maior no final do livro, em que um sistema é analisado e modelado, com a ilustração completa de todos os diagramas referentes ao software.','Gilleanes T. A. Guedes','Novatec','Informática',496,2018,'8575226460','Portugues',1,'UML2.jpg'),(23,'Mãos à obra: aprendizado de máquina ','CONCEITOS, FERRAMENTAS E TÉCNICAS PARA A CONSTRUÇÃO DE SISTEMAS INTELIGENTES. Com uma série de recentes avanços, o aprendizado profundo impulsionou todo o campo do aprendizado de máquina. Agora, mesmo os programadores que pouco sabem sobre esta tecnologia podem utilizar ferramentas simples e eficientes para implementar programas capazes de aprender com dados. Este livro prático mostra como fazê-lo.Utilizando exemplos concretos, uma teoria mínima e duas estruturas Python prontas para produção - Scikit-Learn e TensorFlow - o autor Aurélien Géron ajuda você a adquirir uma compreensão intuitiva dos conceitos e ferramentas para a construção de sistemas inteligentes. Você aprenderá uma variedade de técnicas, começando com uma regressão linear simples e progredindo para redes neurais profundas. Com exercícios em cada capítulo para ajudá-lo a aplicar o que aprendeu, você só precisa ter experiência em programação para começar. - Explore o cenário do aprendizado de máquina, especialmente as redes neurais- Utilize o Scikit-Learn para acompanhar um exemplo de projeto de aprendizado de máquina de ponta a ponta- Examine vários modelos de treinamento, incluindo máquinas de vetor de suporte, árvores de decisão, florestas aleatórias emétodos de ensemble- Use a biblioteca TensorFlow para construir e treinar redes neurais- Mergulhe em arquiteturas de rede neural, incluindo redes convolutivas, redes recorrentes e aprendizado por reforço profundo- Aprenda técnicas para treinamento e dimensionamento de redes neurais profundas- Aplique exemplos práticos de código sem recorrer a teorias excessivas ou detalhes de algoritmo do aprendizado de máquinas','Aurélien Géron','Alta Books','Informática',576,2019,'8550803812','Portugues',1,'maosAObra.jpg'),(24,'Think Java: How to Think Like a Computer Scientist','Currently used at many colleges, universities, and high schools, this hands-on introduction to computer science is ideal for people with little or no programming experience. The goal of this concise book is not just to teach you Java, but to help you think like a computer scientist. You’ll learn how to program—a useful skill by itself—but you’ll also discover how to use programming as a means to an end.\r\n\r\nAuthors Allen Downey and Chris Mayfield start with the most basic concepts and gradually move into topics that are more complex, such as recursion and object-oriented programming. Each brief chapter covers the material for one week of a college course and includes exercises to help you practice what you’ve learned.\r\n\r\n    Learn one concept at a time: tackle complex topics in a series of small steps with examples\r\n    Understand how to formulate problems, think creatively about solutions, and write programs clearly and accurately\r\n    Determine which development techniques work best for you, and practice the important skill of debugging\r\n    Learn relationships among input and output, decisions and loops, classes and methods, strings and arrays\r\n    Work on exercises involving word games, graphics, puzzles, and playing cards\r\n\r\nThe updated second edition of Think Java also features new chapters on polymorphism and data processing, as well as content covering changes through Java 12.',' Allen B. Downey & Chris Mayfield ','O\'Reilly Media','Informática',328,2019,'978-1492072508','Ingles',1,'thinkJava.jpg'),(25,'Os segredos da mente milionária','Aprenda a enriquecer mudando seus conceitos sobre o dinheiro e adotando os hábitos das pessoas bem-sucedidas\r\n\r\n\"T. Harv Eker desmistifica o motivo pelo qual algumas pessoas estão destinadas à riqueza e outras a uma vida de dureza. Se você quer conhecer as causas fundamentais do sucesso, leia este livro.\" – Robert G. Allen, autor de O milionário em um minuto\r\n\r\n\"Há anos eu acompanho e admiro o trabalho de Harv Eker. Recomendo este livro a todas as pessoas que querem aumentar a sua riqueza financeira, mental e emocional.\" – Jack Canfield, co-autor da série Histórias para aquecer o coração\r\n\r\nSe as suas finanças andam na corda bamba, talvez esteja na hora de você refletir sobre o que T. Harv Eker chama de \"o seu modelo de dinheiro\" – um conjunto de crenças que cada um de nós alimenta desde a infância e que molda o nosso destino financeiro, quase sempre nos levando para uma situação difícil.\r\n\r\nNeste livro, Eker mostra como substituir uma mentalidade destrutiva – que você talvez nem perceba que tem – pelos \"arquivos de riqueza\", 17 modos de pensar e agir que distinguem os ricos das demais pessoas. Alguns desses princípios fundamentais são:\r\n\r\n• Ou você controla o seu dinheiro ou ele controlará você.\r\n\r\n• O hábito de administrar as finanças é mais importante do que a quantidade de dinheiro que você tem.\r\n\r\n• A sua motivação para enriquecer é crucial: se ela possui uma raiz negativa, como o medo, a raiva ou a necessidade de provar algo a si mesmo, o dinheiro nunca lhe trará felicidade.\r\n\r\n• O segredo do sucesso não é tentar evitar os problemas nem se livrar deles, mas crescer pessoalmente para se tornar maior do que qualquer adversidade.\r\n\r\n• Os gastos excessivos têm pouco a ver com o que você está comprando e tudo a ver com a falta de satisfação na sua vida.\r\n\r\nO autor também ensina um método eficiente de administrar o dinheiro. Você aprenderá a estabelecer sua remuneração pelos resultados que apresenta e não pelas horas que trabalha. Além disso, saberá como aumentar o seu patrimônio líquido – a verdadeira medida da riqueza.\r\n\r\nA Ideia é fazer o seu dinheiro trabalhar para você tanto quanto você trabalha para ele. Para isso, é necessário poupar e investir em vez de gastar. \"Enriquecer não diz respeito somente a ficar rico em termos financeiros\", diz Eker. \"É mais do que isso: trata-se da pessoa que você se torna para alcançar esse objetivo.\" ','T. Harv Eker','Editora Sextante','Administração',176,1992,'8575422391','Portugues',1,'menteMilionario.jpg'),(26,'Como convencer alguém em 90 segundos: Crie uma primeira impressão vendedora','Como convencer alguém em 90 segundos é a garantia de uma comunicação de sucesso, transformando as conexões instantâneas em duradouras e produtivas relações de negócios.\r\n\r\nNeste livro, o especialista Nicholas Boothman ensina como usar o rosto, o corpo, a atitude e a voz para causar uma primeira impressão marcante, estabelecendo confiança imediata e criando fortes vínculos de credibilidade.','Nicholas Boothman','Universo dos Livros ','Auto ajuda',264,2012,'8579303192','Portugues',1,'convercer90.jpg'),(27,'Pai rico, pai pobre','Celebrando 20 anos como o livro n° 1 em finanças pessoais.A escola prepara as crianças para o mundo real? Essa é a primeira pergunta com a qual o leitor se depara neste livro. O recado é ousado e direto: boa formação e notas altas não bastam para assegurar o sucesso de alguém. O mundo mudou; a maioria dos jovens tem cartão de crédito, antes mesmo de concluir os estudos, e nunca teve aula sobre dinheiro, investimentos, juros etc. Ou seja, eles vão para a escola, mas continuam financeiramente improficientes, despreparados para enfrentar um mundo que valoriza mais as despesas do que a poupança.Para o autor, o conselho mais perigoso que se pode dar a um jovem nos dias de hoje é: “Vá para a escola, tire notas altas e depois procure um trabalho seguro.” O fato é que agora as regras são outras, e não existe mais emprego garantido para ninguém. Pai Rico, Pai Pobre demonstra que a questão não é ser empregado ou empregador, mas ter o controle do próprio destino ou delegá-lo a alguém. É essa a tese de Robert Kiyosaki neste livro substancial e visionário. Para ele, a formação proporcionada pelo sistema educacional não prepara os jovens para o mundo que encontrarão depois de formados.E como os pais podem ensinar aos filhos o que a escola relega? Essa é outra das muitas perguntas que o leitor encontra em Pai Rico, Pai Pobre. Nesse sentido, a proposta do autor é facilitar a tarefa dos pais. Quem entende de contabilidade deve esquecer seus conhecimentos acadêmicos, pois muitas das teorias expostas por Robert Kiyosaki contrariam os princípios contábeis comumente aceitos, e apresentam uma valiosa e moderna percepção do modo como se realizam os investimentos.A sociedade sofre mudanças radicais e, talvez, de proporções maiores do que as ocorridas em séculos passados. Não existe bola de cristal, mas algo é certo: a perspectiva global de transformações transcende nossa realidade imediata. Aconteça o que acontecer,só existem duas alternativas: segurança ou independência financeira. E o objetivo de Pai Rico, Pai Pobre é instruir o leitor e despertar sua inteligência financeira e a de seus filhos.“A principal razão pela qual as pessoas têm problemas financeiros é que passaram anos na escola, mas não aprenderam nada sobre dinheiro. O resultado é que elas aprendem a trabalhar por dinheiro… mas nunca a fazê-lo trabalhar para elas.” - Robert Kiyosaki.','Kiyosaki Robert T','Alta Books','Administração',336,2017,'8550801488','Portugues',2,'paiRicoPaiPobre.jpg'),(28,'Manual de DevOps: como obter agilidade, confiabilidade e segurança em organizações ','A convergência de vários movimentos importantes em gestão e tecnologia prepararam o terreno para o movimento DevOps, que resulta da aplicação dos princípios mais confiáveis da manufatura física e da liderança no fluxo de valor de TI.Em Manual de Devops você verá que as organizações que adotam os princípios e práticas Lean melhoram significativamente a produtividade da fábrica, os tempos de execução para o cliente, a qualidade do produto e a satisfação do cliente, permitindo que vençam no mercado.Entenda melhor o potencial da revolução DevOps e como as organizações de alto desempenho ampliam as chances de exceder metas de lucratividade, participação de mercado e produtividade.Para tanto, são apresentados os princípios da Manufatura Enxuta e das Três Maneiras: Fluxo, Feedback e Aprendizado Contínuo, a partir dos quais todos os comportamentos de DevOps observados podem ser derivados.“Quem precisa se envolver? Como proteger, organizar e capacitar as equipes? Como maximizar as chances de sucesso?” São apenas algumas das questões que esta obra se propõe a esclarecer. Saiba como dar início a esta transformação nas empresas, e mais importante, sem causar caos e perturbações no ambiente de produção e nos clientes.','Gene Kim','Alta Books','Informática',464,2018,'8550802697','Portugues',1,'manualDevOps.jpg'),(29,'Estruturas de Dados e Algoritmos com JavaScript: Escreva um Código JavaScript Complexo e Eficaz Usando a Mais Recente ECMAScript','Uma estrutura de dados é uma maneira particular de organizar dados em um computador com o intuito de usar os recursos de modo eficaz. As estruturas de dados e os algoritmos são a base de todas as soluções para qualquer problema de programação. Com este livro, você aprenderá a escrever códigos complexos e eficazes usando os recursos mais recentes da ES 2017.\r\nO livro \"Estruturas de dados e algoritmos com JavaScript\" começa abordando o básico sobre JavaScript e apresenta a ECMAScript 2017, antes de passar gradualmente para as estruturas de dados mais importantes, como arrays, filas, pilhas e listas ligadas. Você adquirirá um conhecimento profundo sobre como as tabelas hash e as estruturas de dados para conjuntos funcionam, assim como de que modo as árvores e os mapas hash podem ser usados para buscar arquivos em um disco rígido ou para representar um banco de dados. Este livro serve como um caminho para você mergulhar mais fundo no JavaScript. Você também terá uma melhor compreensão de como e por que os grafos – uma das estruturas de dados mais complexas que há – são amplamente usados em sistemas de navegação por GPS e em redes sociais.','Loiane Groner','Novatec','Informática',408,2019,'8575226932','Portugues',1,'estruturaDadosJS.jpg'),(30,'Refatoração: Aperfeiçoando o Design de Códigos Existentes','Por mais de vinte anos, programadores experientes no mundo inteiro contaram com o livro Refatoração de Martin Fowler para aperfeiçoar o design de códigos existentes e melhorar a manutenibilidade do software, assim como para deixar o código existente mais fácil de entender. Essa nova edição ansiosamente esperada foi atualizada por completo para refletir mudanças vitais no domínio da programação. Refatoração 2ª edição contém um catálogo atualizado das refatorações e inclui exemplos de código JavaScript bem como novos exemplos funcionais que demonstram a refatoração sem classes. Assim como na edição original, este livro explica o que é refatoração, por que você deve refatorar, como reorganizar um código que precise de refatoração e como fazer isso de forma bem-sucedida, independentemente da linguagem usada. • Entenda o processo e os princípios básicos da refatoração. • Aplique rapidamente refatorações convenientes para deixar um programa mais fácil de entender e de alterar. • Reconheça “maus cheiros” no código que sinalizam oportunidades para refatorar. • Explore as refatorações, cada uma com suas explicações, a motivação, o mecanismo e exemplos simples. • Escreva testes robustos para suas refatorações. • Reconheça as contrapartidas e os obstáculos para a refatoração.','Martin Fowler','Novatec','Informática',456,2020,'8575227246','Portugues',1,'refatoracao.jpg'),(33,'Use a cabeça!: Java','Use a Cabeça! Java é uma experiência completa de aprendizado em programação orientada a objetos (OO) e Java.\r\n                Projetado de acordo com princípios de aprendizado simples, este livro mostrará de aspectos básicos da linguagem a tópicos avançados que incluem segmentos, soquetes de rede e programação distribuída. O mais importante é que você aprenderá a pensar como um desenvolvedor orientado a objetos. E não irá apenas ler: você vai participar de jogos, resolver quebra-cabeças, refletir sobre mistérios e interagir com Java de formas nunca imaginadas. No decorrer da leitura, você escreverá muitos códigos Java reais.','Kathy Sierra','Alta Books','Informática',496,2007,'8576081733','Portugues',1,'PENSEJAVA.jpg');
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
INSERT INTO `usuario` VALUES (1,'Luan','Mateus','2002-02-06','m','111.111.111-11','1111111','luanmateuz','$2a$11$hc3SRmun1j5LCGuf5jDdbu4TGD869nSOs3Pgc4MAqYkJ1x3A.M3vq',1,'luan@gmail.com','11111-1111','71805417','QN 5 Conjunto 17',22,'DF','Riacho Fundo I','Brasília','ABCDE',1),(2,'Joao','Lucas','1991-07-09','m','000.000.000-00','0000000','joao','$2a$11$B6Uu1FvQ1vLfrcVvgTbDq.Zbxno/WUQ8YM3QacebL13QQ4hDob2Sq',2,'joao@email.com','11111-1111','71805411','QN 5 Conjunto 11',5,'DF','Riacho Fundo I','Brasília','',2),(3,'Ryan','Rodrigues','2019-05-09','m','123.131.313-13','1231313','ryan','$2a$11$Hj.DVvsgMIHhMb/NwwAafuzcuqoGgZEEa13BojumSeNE3uBBRfbjO',1,'ryan@email.com','12312-3132','71540130','SMLN ML Trecho 13',11,'DF','Setor de Mansões do Lago Norte','Brasília','',3),(5,'Rafael','Fabiano','2000-07-02','m','123.456.789-10','1234567','rafael','$2a$11$RgJ/1eCjJR3Fh6OKV8yE5eF3Z06G8QZ5qh5QePBKbQgfMqp/i8jmm',1,'prof.rafaelfabiano@gmail.com','98985-4457','72130396','Área Especial 12',3,'DF','Taguatinga Norte (Taguatinga)','Brasília','',2);
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
