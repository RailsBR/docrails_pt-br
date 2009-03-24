diff --git a/railties/guides/output/pt-BR/index.html b/railties/guides/output/pt-BR/index.html
index abcad1b..e16fb49 100644
--- a/railties/guides/output/pt-BR/index.html
+++ b/railties/guides/output/pt-BR/index.html
@@ -91,7 +91,7 @@
 
 <h3>Comece aqui</h3>
 <dl>
-<dt><a href="getting_started.html">Começando com Rails</a></dt><dd>
+  <dt><a href="getting_started.html">Começando com Rails</a></dt><dd class="ticket"><a href="http://railsguides-pt_br.lighthouseapp.com/projects/19768/tickets/21">Ticket no Lighthouse para a revisão</a></dd><dd>
 Tudo que você precisa saber para instalar o Rails e criar sua primeira aplicação.
 </dd>
 </dl>
@@ -100,13 +100,13 @@ Tudo que você precisa saber para instalar o Rails e criar sua primeira aplicaç
 <dt><a href="migrations.html">Migrations para bancos de dados no Rails</a></dt><dd>
 Este guia cobre como você pode usar as migrações do Active Record para alterar seu banco de dados de uma forma organizada e estruturada.
 </dd>
-<dt><a href="activerecord_validations_callbacks.html">Validações e Callbacks do Active Record</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/26">Lighthouse Ticket</a></dd><dd>
+<dt><a href="activerecord_validations_callbacks.html">Validações e Callbacks do Active Record</a></dt><dd>
 Este guia explica como você pode utilizar as validações e callbacks do Active Record.
 </dd>
 <dt><a href="association_basics.html">Associações do Active Record</a></dt><dd>
 Este guia cobre todas as associações fornecidas pelo Active Record.
 </dd>
-<dt><a href="active_record_querying.html">Interface para Queries do Active Record</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/16">Lighthouse Ticket</a></dd><dd>
+<dt><a href="active_record_querying.html">Interface para Queries do Active Record</a></dt><dd>
 Este guia cobre como o Active Record trabalha com querys no banco de dados.
 </dd>
 </dl>
@@ -130,7 +130,7 @@ Este guia explica como os controllers trabalham e como eles se encaixam no ciclo
 </dl>
 <h3>Aprofundando-se</h3>
 <dl>
-	<dt><a href="i18n.html">Rails Internationalization <span class="caps">API</span></a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/23">Lighthouse Ticket</a></dd><dd>
+	<dt><a href="i18n.html"><span class="caps">API</span> de Internacionalização do Rails</a></dt><dd>
 <p>Este guia cobre como adicionar internacionalização em sua aplicação. Sua aplicação irá ser capaz de traduzir conteúdo para diferentes idiomas, alterar regras de pluralização, usar formatação correta de datas para cada país e muito mais.</p>
 </dd>
 	<dt><a href="action_mailer_basics.html">Action Mailer Basics</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/25">Lighthouse Ticket</a></dd><dd>
@@ -154,7 +154,7 @@ Este guia explica como os controllers trabalham e como eles se encaixam no ciclo
 	<dt><a href="configuring.html">Configuring Rails Applications</a></dt><dd>
 <p>Este guia cobre as opções básicas de configuração para uma aplicação Rails.</p>
 </dd>
-	<dt><a href="rails_on_rack.html">Rails on Rack</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/58">Lighthouse Ticket</a></dd><dd>
+	<dt><a href="rails_on_rack.html">Rails on Rack</a></dt><dd>
 Este guia cobre a integração do Rails com Rack e sua interface com componentes Rack.
 </dd>
 	<dt><a href="command_line.html">Rails Command Line Tools and Rake tasks</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/29">Lighthouse Ticket</a></dd><dd>
@@ -163,7 +163,7 @@ Este guia cobre a integração do Rails com Rack e sua interface com componentes
 	<dt><a href="caching_with_rails.html">Caching with Rails</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/10">Lighthouse Ticket</a></dd><dd>
 <p>Varia técnicas de caching disponibilizadas pelo Rails.</p>
 </dd>
-	<dt><a href="contributing.html">Contributing to Rails</a></dt><dd class="ticket"><a href="http://rails.lighthouseapp.com/projects/16213/tickets/64">Lighthouse Ticket</a></dd><dd>
+	<dt><a href="contributing.html">Contributing to Rails</a></dt><dd>
 <p>Rails não é um &#8220;framework de outra pessoa&#8221;. Este guia cobre as várias formas que você possui para se involver no contínuo processo de desenvolvimento do Rails.</p>
 </dd>
 </dl>
diff --git a/railties/guides/output/pt-BR/migrations.html b/railties/guides/output/pt-BR/migrations.html
index 403458c..549ffb7 100644
--- a/railties/guides/output/pt-BR/migrations.html
+++ b/railties/guides/output/pt-BR/migrations.html
@@ -89,7 +89,7 @@
             <div id="subCol">
         <h3 class="chapter"><img src="images/chapters_icon.gif" alt="" />Chapters</h3>
         <ol class="chapters">
-<li><a href="#anatomia-de-uma-migration">Anatomia de uma Migration</a><ul><li><a href="#migrations-so-classes">Migrations são classes</a></li><li><a href="#o-que-h-em-um-nome">O que há em um Nome</a></li><li><a href="#alterando-migrations">Alterando Migrations</a></li></ul></li><li><a href="#criando-uma-migration">Criando uma Migration</a><ul><li><a href="#criando-um-model">Criando um Model</a></li><li><a href="#criando-uma-migration-standalone">Criando uma Migration Standalone</a></li></ul></li><li><a href="#escrevendo-uma-migration">Escrevendo uma Migration</a><ul><li><a href="#criando-uma-tabela">Criando uma Tabela</a></li><li><a href="#mudando-tabelas">Mudando tabelas</a></li><li><a href="#helpers-especiais">Helpers especiais</a></li><li><a href="#escrevendo-seu-mtodo-down">Escrevendo seu método down</a></li></ul></li><li><a href="#executando-migraes">Executando migrações</a><ul><li><a href="#reverso">Reversão</a></li><li><a href="#especificando-uma-migration">Especificando uma migration</a></li><li><a href="#sendo-comunicativo">Sendo comunicativo</a></li></ul></li><li><a href="#usando-models-nas-suas-migraes">Usando models nas suas migrações</a><ul><li><a href="#lidando-com-mudanas-nos-modelos">Lidando com mudanças nos modelos</a></li></ul></li><li><a href="#armazenando-esquemas-e-voc">Armazenando esquemas e você</a><ul><li><a href="#quais-so-os-arquivos-do-esquema">Quais são os arquivos do esquema?</a></li><li><a href="#formas-de-armazenar-o-esquema">Formas de armazenar o esquema</a></li><li><a href="#armazenamento-de-esquema-e-controle-de-cdigo">Armazenamento de esquema e controle de código</a></li></ul></li><li><a href="#active-record-e-integridade-referencial">Active Record e Integridade Referencial</a><ul></ul></li><li><a href="#changelog">Changelog</a><ul></ul></li></ol></div>
+<li><a href="#anatomia-de-uma-migration">Anatomia de uma Migration</a><ul><li><a href="#migrations-so-classes">Migrations são classes</a></li><li><a href="#o-que-h-em-um-nome">O que há em um Nome</a></li><li><a href="#alterando-migrations">Alterando Migrations</a></li></ul></li><li><a href="#criando-uma-migration">Criando uma Migration</a><ul><li><a href="#criando-um-model">Criando um Model</a></li><li><a href="#criando-uma-migration-standalone">Criando uma Migration Standalone</a></li></ul></li><li><a href="#escrevendo-uma-migration">Escrevendo uma Migration</a><ul><li><a href="#criando-uma-tabela">Criando uma Tabela</a></li><li><a href="#alterando-tabelas">Alterando Tabelas</a></li><li><a href="#helpers-especiais--parei-aqui---adolfo-">Helpers Especiais  <b>* <span class="caps">PAREI</span> <span class="caps">AQUI</span> &#8211; Adolfo *</b></a></li><li><a href="#escrevendo-seu-mtodo-down">Escrevendo seu método down</a></li></ul></li><li><a href="#executando-migraes">Executando migrações</a><ul><li><a href="#reverso">Reversão</a></li><li><a href="#especificando-uma-migration">Especificando uma migration</a></li><li><a href="#sendo-comunicativo">Sendo comunicativo</a></li></ul></li><li><a href="#usando-models-nas-suas-migraes">Usando models nas suas migrações</a><ul><li><a href="#lidando-com-mudanas-nos-modelos">Lidando com mudanças nos modelos</a></li></ul></li><li><a href="#armazenando-esquemas-e-voc">Armazenando esquemas e você</a><ul><li><a href="#quais-so-os-arquivos-do-esquema">Quais são os arquivos do esquema?</a></li><li><a href="#formas-de-armazenar-o-esquema">Formas de armazenar o esquema</a></li><li><a href="#armazenamento-de-esquema-e-controle-de-cdigo">Armazenamento de esquema e controle de código</a></li></ul></li><li><a href="#active-record-e-integridade-referencial">Active Record e Integridade Referencial</a><ul></ul></li><li><a href="#changelog">Changelog</a><ul></ul></li></ol></div>
     </div>
   </div>
 
@@ -276,17 +276,17 @@ create_table :products, :options =&gt; &quot;ENGINE=BLACKHOLE&quot; do |t|
   t.string :name, :null =&gt; false
 end
 </code></div>
-<p>vai concatenar <tt>ENGINE=BLACKHOLE</tt> na sql usada para criar a tabela (quando se usa MySQL por padrão é usado &#8220;<span class="caps">ENGINE</span>=InnoDB&#8221;.</p>
+<p>vai concatenar <tt>ENGINE=BLACKHOLE</tt> na sql usada para criar a tabela (quando se usa MySQL por padrão é usado &#8220;<span class="caps">ENGINE</span>=InnoDB&#8221;).</p>
 <p>Os tipos que o Active Record suporta são <tt>:primary_key</tt>, <tt>:string</tt>, <tt>:text</tt>, <tt>:integer</tt>, <tt>:float</tt>, <tt>:decimal</tt>, <tt>:datetime</tt>, <tt>:timestamp</tt>, <tt>:time</tt>, <tt>:date</tt>, <tt>:binary</tt>, <tt>:boolean</tt>.</p>
-<p>Eles vão ser mapeados apropriadamente para cada banco de dados, por exemplo com MySQL <tt>:string</tt> é mapeada para <tt>VARCHAR(255)</tt>. Você pode criar colunas e tipos não suportados pelo Active Record usando uma sintaxe não sexy, por exemplo:</p>
+<p>Eles vão ser mapeados apropriadamente para cada banco de dados, por exemplo com MySQL <tt>:string</tt> é mapeada para <tt>VARCHAR(255)</tt>. Você pode criar colunas e tipos não suportados pelo Active Record usando a sintaxe não-sexy, por exemplo:</p>
 <div class="code_container"><code class="ruby">
 create_table :products do |t|
   t.column :name, 'polygon', :null =&gt; false
 end
 </code></div>
-<p>Desta forma, no entanto, dificulta a portabilidade para outros banco de dados.</p>
-<h4 id="mudando-tabelas">3.2 Mudando tabelas</h4>
-<p>O primo mais próximo de <tt>create_table</tt> é <tt>change_table</tt>. Usado para alterar tabelas existentes, é similarmente usada como o <tt>create_table</tt> mas o objeto &#8220;rendenrizado&#8221; (yielded) para o bloco conhece mais truques. Por exemplo</p>
+<p>Isto, no entanto, pode dificultar a portabilidade para outros bancos de dados.</p>
+<h4 id="alterando-tabelas">3.2 Alterando Tabelas</h4>
+<p>Um primo próximo de <tt>create_table</tt> é <tt>change_table</tt>, usado para alterar tabelas existentes. É usado de um modo parecido com o  <tt>create_table</tt> mas o objeto passado para o bloco conhece mais truques. Por exemplo</p>
 <div class="code_container"><code class="ruby">
 change_table :products do |t|
   t.remove :description, :name
@@ -295,7 +295,7 @@ change_table :products do |t|
   t.rename :upccode, :upc_code
 end
 </code></div>
-<p>remove a coluna <tt>description</tt> e <tt>name</tt>, adiciona a coluna <tt>part_number</tt> e adiciona um index nesta mesma coluna. E por ultimo altera o nome da coluna <tt>upccode</tt>. É o mesmo que fazer</p>
+<p>remove as colunas <tt>description</tt> e <tt>name</tt>, adiciona a coluna <tt>part_number</tt> e adiciona um index nesta mesma coluna. E por ultimo altera o nome da coluna <tt>upccode</tt>. É o mesmo que fazer</p>
 <div class="code_container"><code class="ruby">
 remove_column :products, :description
 remove_column :products, :name
@@ -303,8 +303,8 @@ add_column :products, :part_number, :string
 add_index :products, :part_number
 rename_column :products, :upccode, :upc_code
 </code></div>
-<p>Você não deve manter repetindo o nome da tabela e de todos os grupos de declarações relatados para modificar uma tabela em particular. Em uma transformação individual os nomes são curtos, por exemplo <tt>remove_column</tt> torna-se <tt>remove</tt> e <tt>add_index</tt> torna-se <tt>index</tt>.</p>
-<h4 id="helpers-especiais">3.3 Helpers especiais</h4>
+<p>Você não precisa ficar repetindo o nome da tabela e de seus grupos em todas as expressões relacionadas à alteração de uma tabela em particular. Os nomes individuais de alteração são também mais curtos, por exemplo, <tt>remove_column</tt> se torna somente <tt>remove</tt> e <tt>add_index</tt> se torna <tt>index</tt>.</p>
+<h4 id="helpers-especiais--parei-aqui---adolfo-">3.3 Helpers Especiais  <b>* <span class="caps">PAREI</span> <span class="caps">AQUI</span> &#8211; Adolfo *</b></h4>
 <p>O Active Record fornece alguns atalhos para as funcionalidades mais comuns. Por exemplo, é muito comum adicionar as colunas <tt>created_at</tt> e <tt>updated_at</tt> e o método que faz exatamente isso é:</p>
 <p>dirty_workaround_for_nontextile_19
 Criará uma tabela products com essas duas colunas</p>
diff --git a/railties/guides/rails_guides/generator_pt_br.rb b/railties/guides/rails_guides/generator_pt_br.rb
index 96b3334..f68f7ff 100644
--- a/railties/guides/rails_guides/generator_pt_br.rb
+++ b/railties/guides/rails_guides/generator_pt_br.rb
@@ -45,6 +45,7 @@ module RailsGuides
       File.open(file, 'w') do |f|
         @view = ActionView::Base.new(view_path)
         @view.extend(Helpers)
+        @view.extend(HelpersPtBR)
 
         if guide =~ /\.erb\.textile/
           # Generate the erb pages with textile formatting - e.g. index/authors
diff --git a/railties/guides/rails_guides_pt_br.rb b/railties/guides/rails_guides_pt_br.rb
index eccb13f..f3b63b4 100644
--- a/railties/guides/rails_guides_pt_br.rb
+++ b/railties/guides/rails_guides_pt_br.rb
@@ -21,6 +21,7 @@ module RailsGuides
   autoload :Generator, "rails_guides/generator_pt_br"
   autoload :Indexer, "rails_guides/indexer"
   autoload :Helpers, "rails_guides/helpers"
+  autoload :HelpersPtBR, "rails_guides/helpers_pt_br.rb"
   autoload :TextileExtensions, "rails_guides/textile_extensions"
 end
 
diff --git a/railties/guides/source/pt-BR/active_record_querying.textile b/railties/guides/source/pt-BR/active_record_querying.textile
index 271067e..d9d9f27 100644
--- a/railties/guides/source/pt-BR/active_record_querying.textile
+++ b/railties/guides/source/pt-BR/active_record_querying.textile
@@ -1,14 +1,14 @@
-h2. Interface de consulta do Active Record
+h2. Interface para Queries do Active Record
 
 Este guia cobre diferente maneiras de recuperar dados do bando de dados usando o Active Record. Usando este guia como referência, você será capaz de:
 
 * Encontrar registros usando uma variedade de métodos e condições
 * Especificar a ordenação, atributos retornados, agrupamento e outras propriedades dos registros encontrados
-* Utilizar eager loading para reduzir o número de consultas ao banco de dados necessárias para recuperar os dados
+* Utilizar eager loading para reduzir o número de queries ao banco de dados necessárias para recuperar os dados
 * Utilizar dynamic finders
 * Criar named scopes para adicionar comportamento de pesquisa personalizado aos seus models
 * Verificar a existência de registros específicos
-* Realaizar diversos cálculos sobre models Active Record
+* Realizar diversos cálculos sobre models Active Record
 
 endprologue.
 
@@ -52,16 +52,16 @@ class Role < ActiveRecord::Base
 end
 </ruby>
 
-O Active Record irá realizar consultas ao banco de dados para você e é compativel com a maioria dos sistemas de bancos de dados (MySQL, PostgreSQL e SQLite, entre outros). Independentemente de qual sistema de banco de dados você está usando, o formato dos métodos do Active Record será sempre o mesmo.
+O Active Record irá realizar queries ao banco de dados para você e é compativel com a maioria dos sistemas de bancos de dados (MySQL, PostgreSQL e SQLite, entre outros). Independentemente de qual sistema de banco de dados você está usando, o formato dos métodos do Active Record será sempre o mesmo.
 
 h3. Recuperando Objetos do Banco de Dados
 
-Para recuperar objetos do banco de dados, o Active Record fornece um método de classe chamado +Model.find+. Este método permite que você passe argumentos para realizar determinadas consultas ao seu banco de dados sem a necessidade de escrever SQL puro.
+Para recuperar objetos do banco de dados, o Active Record fornece um método de classe chamado +Model.find+. Este método permite que você passe argumentos para realizar determinadas queries ao seu banco de dados sem a necessidade de escrever SQL puro.
 
 A operação primária do método <tt>Model.find(options)</tt> pode ser resumida como:
 
-* Converter as opções fornecidas para uma consulta SQL equivalente.
-* Disparar a consulta e recuperar os respectivos resultados do banco de dados.
+* Converter as opções fornecidas para uma query SQL equivalente.
+* Disparar a query e recuperar os respectivos resultados do banco de dados.
 * Instanciar o objeto Ruby equivalente do model apropriado para cada linha resultante.
 * Executar callbacks +after_find+ caso exista algum.
 
@@ -204,7 +204,7 @@ User.find_each(:batch_size => 5000) do |user|
 end
 </ruby>
 
-*Iniciando uma consulta em lote a partir de uma chave primária específica*
+*Iniciando uma query em lote a partir de uma chave primária específica*
 
 Os registros são retornados em ordem crescente de chave primária, a qual deve ser um inteiro. A opção +:start+ permite que você configure o primeiro ID da sequência caso o menor não seja aquele que você precisa. Isso pode ser ũtil por exemplo para reiniciar um processo em lote interrompido caso ele salve o último ID processado.
 
@@ -298,7 +298,7 @@ Client.all(:conditions => ["created_at IN (?)",
   (params[:start_date].to_date)..(params[:end_date].to_date)])
 </ruby>
 
-Isso irá gerar a consulta apropriada a qual é ótima para pequenos intervalos mas não tão boa para intervalos maiores. Por exemplo se você passar uma sequência de datas que completem um ano serão 365 (ou possivelmente 366 dependendo do ano) strings com as quais seu campo serã comparado.
+Isso irá gerar a query apropriada a qual é ótima para pequenos intervalos mas não tão boa para intervalos maiores. Por exemplo se você passar uma sequência de datas que completem um ano serão 365 (ou possivelmente 366 dependendo do ano) strings com as quais seu campo serã comparado.
 
 <sql>
 SELECT * FROM users WHERE (created_at IN
@@ -332,7 +332,7 @@ Isso poderia fazer com que seu servidor de banco de dados lance um erro inespera
 Got a packet bigger than 'max_allowed_packet' bytes: _query_
 </shell>
 
-Onde _query_ é a consulta utilizada para provocar o erro.
+Onde _query_ é a query utilizada para provocar o erro.
 
 Neste exemplo seria melhor utilizar operadores maior-que e menor-que no SQL, como em:
 
@@ -370,7 +370,7 @@ Client.all(:conditions => { 'locked' => true })
 
 h5. Condições de intervalo
 
-A coisa boa disso é que podemos passar um intervalo para nossos campos sem que isso gere uma consulta muito grande, como visto no preâmbulo dessa seção.
+A coisa boa disso é que podemos passar um intervalo para nossos campos sem que isso gere uma query muito grande, como visto no preâmbulo dessa seção.
 
 <ruby>
 Client.all(:conditions => { :created_at => (Time.now.midnight - 1.day)..Time.now.midnight})
@@ -454,7 +454,7 @@ Por exemplo, para selecionar apenas as colunas +viewable_by+ e +locked+:
 Client.all(:select => "viewable_by, locked")
 </ruby>
 
-A consulta SQL utilizada por essa chamada ao método +find+ será algo como:
+A query SQL utilizada por essa chamada ao método +find+ será algo como:
 
 <sql>
 SELECT viewable_by, locked FROM clients
@@ -478,7 +478,7 @@ h4. Limit e Offset
 
 Para aplicar +LIMIT+ ao SQL disparado por +Model.find+, você pode especificar o +LIMIT+ utilizando as opções +:limit+ e +:offset+ sobre o +find+.
 
-Se você quiser limitar o total de registros a um certo subconjunto de registros retornado você geralmente utiliza a opção +:limit+, às vezes em conjunto com +:offset+. Limit é o número máximo de registros que serão recuperados de uma consulta, e offset é o número de registros a partir do qual ele começará a ler, em relação ao primeiro registro no conjunto. Por exemplo:
+Se você quiser limitar o total de registros a um certo subconjunto de registros retornado você geralmente utiliza a opção +:limit+, às vezes em conjunto com +:offset+. Limit é o número máximo de registros que serão recuperados de uma query, e offset é o número de registros a partir do qual ele começará a ler, em relação ao primeiro registro no conjunto. Por exemplo:
 
 <ruby>
 Client.all(:limit => 5)
@@ -621,7 +621,7 @@ Item Update (0.4ms)   UPDATE `items` SET `updated_at` = '2009-02-07 18:05:56', `
 SQL (0.8ms)   COMMIT
 </sql>
 
-Você também pode passar SQL puro para a opção +:lock+ para permitir diferentes tipos de travamentos. Por exemplo, MySQL possui uma expressão chamada +LOCK IN SHARE MODE+ onde você pode travar um registro mas ainda permitir que outras consultas o leiam. Para especificar essa expressão apenas passe-a como a opção +lock+:
+Você também pode passar SQL puro para a opção +:lock+ para permitir diferentes tipos de travamentos. Por exemplo, MySQL possui uma expressão chamada +LOCK IN SHARE MODE+ onde você pode travar um registro mas ainda permitir que outras queries o leiam. Para especificar essa expressão apenas passe-a como a opção +lock+:
 
 <ruby>
 Item.transaction do
@@ -679,7 +679,7 @@ class Guest < ActiveRecord::Base
 end
 </ruby>
 
-Agora todos os exemplos a seguir produzirão as consultas por join esperadas usando +INNER JOIN+:
+Agora todos os exemplos a seguir produzirão as queries por join esperadas usando +INNER JOIN+:
 
 h5. Realizando Join Com Uma Única Associação
 
@@ -741,9 +741,9 @@ Isso irá encontrar todos os clientes que foram criados ontem, novamente utiliza
 
 h3. Usando Eager Loading em Associações
 
-Eager loading é o mecanismo para carregar registros associados dos objetos retornados por +Model.find+ utilizando o mínimo de consultas possível.
+Eager loading é o mecanismo para carregar registros associados dos objetos retornados por +Model.find+ utilizando o mínimo de queries possível.
 
-<strong>O problema das N <plus> 1 consultas</strong>
+<strong>O problema das N <plus> 1 queries</strong>
 
 Considere o código a seguir, o qual encontra 10 clientes e imprime seus códigos postais:
 
@@ -755,11 +755,11 @@ clients.each do |client|
 end
 </ruby>
 
-Este código parece bom à primeira vista. Mas o problema está no total de consultas executadas. O código acima executa 1 (para encontrar o cliente) <plus> 10 (uma para cada cliente para carregar o endereço) = <strong>11</strong> consultas no total.
+Este código parece bom à primeira vista. Mas o problema está no total de queries executadas. O código acima executa 1 (para encontrar o cliente) <plus> 10 (uma para cada cliente para carregar o endereço) = <strong>11</strong> queries no total.
 
-<strong>Solução para o problema das N <plus> 1 consultas</strong>
+<strong>Solução para o problema das N <plus> 1 queries</strong>
 
-O Active Record permite que você especifique previamente todas as associações que serão carregadas. Isso é possível especificando-se a opção +:include+ da chamada ao método +Model.find+. Usando +:include+ o Active Record garante que todas as associações especificadas são carregadas utilizando o menor número de consultas possível.
+O Active Record permite que você especifique previamente todas as associações que serão carregadas. Isso é possível especificando-se a opção +:include+ da chamada ao método +Model.find+. Usando +:include+ o Active Record garante que todas as associações especificadas são carregadas utilizando o menor número de queries possível.
 
 Revisitando o caso acima, nós poderiamos reescrever +Client.all+ para utilizar eager loading para carregar os endereços:
 
@@ -771,7 +771,7 @@ clients.each do |client|
 end
 </ruby>
 
-O código acima irá executar apenas <strong>2</strong> consultas, ao invés de <strong>11</strong> consultas no caso anterior:
+O código acima irá executar apenas <strong>2</strong> queries, ao invés de <strong>11</strong> queries no caso anterior:
 
 <sql>
 SELECT * FROM clients
@@ -833,7 +833,7 @@ irá associar um objeto cliente existente com o nome "Ryan" com a variável loca
 
 h3. Pesquisando com SQL
 
-Se você quiser usar seu próprio SQL para encontrar registros em uma tabela você pode utilizar o método +find_by_sql+. O método +find_by_sql+ irá retornar um array de objetos mesmo que a consulta realizada retorne somente um objeto. Por exemplo você poderia executar esta consulta:
+Se você quiser usar seu próprio SQL para encontrar registros em uma tabela você pode utilizar o método +find_by_sql+. O método +find_by_sql+ irá retornar um array de objetos mesmo que a query realizada retorne somente um objeto. Por exemplo você poderia executar esta query:
 
 <ruby>
 Client.find_by_sql("SELECT * FROM clients 
@@ -853,7 +853,7 @@ Client.connection.select_all("SELECT * FROM clients WHERE id = '1'")
 
 h3. Existência de Objetos
 
-Se você quiser apenas verificar a existência de um objeto, há uma método chamado +exists?+. Este método irá consultar o banco de dados usando a mesma consulta que +find+, mas oa invés de retornar um objeto ou uma coleção de objetos ele retornará +true+ ou +false+.
+Se você quiser apenas verificar a existência de um objeto, há uma método chamado +exists?+. Este método irá consultar o banco de dados usando a mesma query que +find+, mas oa invés de retornar um objeto ou uma coleção de objetos ele retornará +true+ ou +false+.
 
 <ruby>
 Client.exists?(1)
diff --git a/railties/guides/source/pt-BR/index.erb.textile b/railties/guides/source/pt-BR/index.erb.textile
index 2cd017f..da07a55 100644
--- a/railties/guides/source/pt-BR/index.erb.textile
+++ b/railties/guides/source/pt-BR/index.erb.textile
@@ -20,7 +20,7 @@ Estes guias são desenvolvidos para trazer produtividade imediata com Rails, e a
 h3. Comece aqui
 
 <dl>
-<% guide('Começando com Rails', 'getting_started.html') do %>
+  <% guide_pt_br('Começando com Rails', 'getting_started.html', :revision_ticket => 21) do %>
   Tudo que você precisa saber para instalar o Rails e criar sua primeira aplicação.
 <% end %>
 </dl>
@@ -32,7 +32,7 @@ h3. Models
   Este guia cobre como você pode usar as migrações do Active Record para alterar seu banco de dados de uma forma organizada e estruturada.
 <% end %>
 
-<% guide("Validações e Callbacks do Active Record", 'activerecord_validations_callbacks.html', :ticket => 26) do %>
+<% guide("Validações e Callbacks do Active Record", 'activerecord_validations_callbacks.html') do %>
   Este guia explica como você pode utilizar as validações e callbacks do Active Record.
 <% end %>
 
@@ -40,7 +40,7 @@ h3. Models
   Este guia cobre todas as associações fornecidas pelo Active Record.
 <% end %>
 
-<% guide("Interface para Queries do Active Record", 'active_record_querying.html', :ticket => 16) do %>
+<% guide("Interface para Queries do Active Record", 'active_record_querying.html') do %>
   Este guia cobre como o Active Record trabalha com querys no banco de dados.
 <% end %>
 </dl>
@@ -73,7 +73,7 @@ h3. Aprofundando-se
 
 <dl>
 
-	<% guide("Rails Internationalization API", 'i18n.html', :ticket => 23) do %>
+	<% guide("API de Internacionalização do Rails", 'i18n.html') do %>
 		Este guia cobre como adicionar internacionalização em sua aplicação. Sua aplicação irá ser capaz de traduzir conteúdo para diferentes idiomas, alterar regras de pluralização, usar formatação correta de datas para cada país e muito mais.
 	<% end %>
 
@@ -105,7 +105,7 @@ h3. Aprofundando-se
 	  Este guia cobre as opções básicas de configuração para uma aplicação Rails. 
 	<% end %>
 
-	<% guide("Rails on Rack", 'rails_on_rack.html', :ticket => 58) do %>
+	<% guide("Rails on Rack", 'rails_on_rack.html') do %>
   	Este guia cobre a integração do Rails com Rack e sua interface com componentes Rack.
 	<% end %>
 
@@ -117,7 +117,7 @@ h3. Aprofundando-se
 	  Varia técnicas de caching disponibilizadas pelo Rails.
 	<% end %>
 
-	<% guide("Contributing to Rails", 'contributing.html', :ticket => 64) do %>
+	<% guide("Contributing to Rails", 'contributing.html') do %>
 		Rails não é um "framework de outra pessoa". Este guia cobre as várias formas que você possui para se involver no contínuo processo de desenvolvimento do Rails.
 	<% end %>
 </dl>
