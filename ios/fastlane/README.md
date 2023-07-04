# Setup iOS Fastlane

## Passo 1: Criar app 

Criar normalmente o projeto no portal da Apple juntamente com todos seus certificados e profiles.
- _Obs.: Sempre salvar e documentar todos os certificados na Wiki do projeto._

## Passo 2: Instalar e configurar o Fastlane
Para iniciar este processo, você deve colar toda a pasta com a configuração do fastlane juntamente com o arquivo Gemfile na raiz do seu projeto. Em caso de projetos que utilizam Flutter ou React native, o conteúdo deve ser colado na pasta "ios", ou iniciar o processo do zero seguindo a documentação.
Para obter instruções de instalação do fastlane, consulte [Instalando _fastlane_](https://docs.fastlane.tools/getting-started/ios/setup/).
É recomendado seguir a instalação via [_Bundler_](https://bundler.io/), além de instalar um gerenciador de versões do Ruby o [_rbenv_](https://github.com/rbenv/rbenv#readme).

## Passo 3: Inserir variáveis de ambiente
Para rodar esse projeto, você vai precisar adicionar as seguintes variáveis de ambiente no seu .env localizado dentro da pasta _fastlane_.

#### Informações do app
* `APP_IDENTIFIER`
Identifier do app. _Ex.: br.com.example_

- `SCHEME`
Scheme do app. _Obs.: Em apps Flutter o padrão é Runner._

* `WORKSPACE`
 Workspace do app. _Ex: Runner.xcworkspace._

- `TEAM_ID`
O ID do time pode ser encontrado no  [_Portal Apple Developer_](https://developer.apple.com/account), na sessão __Membership details__.

<p align="center">
  <img src="images/team_id.png" width="400">
</p>

- `IC_TEAM_ID`
 Essa informação pode ser um pouco difícil de encontrar, mas é possível busca-la neste [_endpoint_](https://appstoreconnect.apple.com/WebObjects/iTunesConnect.woa/ra/user/detail). Para ter acesso, é necessário estar logado na conta.
 _Obs.: A informação deve ser encontrada dentro do atributo __"contentProviderId".__ Você pode utilizar alguma ferramenta para  [_formatar JSON_](https://jsonformatter.curiousconcept.com/) visando facilitar a leitura.


* `ARTIFACT_DEV_NAME`
 Nome do arquivo .ipa de desenvolvimento. _Ex.: __nomeDoAppDev.ipa__. Este nome servirá apenas pra localizar o artefato no diretório e não interfere em nada no nome da aplicação_.

* `ARTIFACT_PROD_NAME`
 Nome do arquivo .ipa de produção. _Ex.: __nomeDoAppProd.ipa__. Este nome servirá apenas pra localizar o artefato no diretório e não interfere em nada no nome da aplicação_.

 > ---
#### Autenticação Apple
- `MATCH_PASSWORD`
Esta senha será usada pelo Fastlane para criptografar todos os certificados antes de salvar no repositório.
_Obs.: Caso o certificado (.p12) tiver uma senha, é recomendado colocar a mesma nesta variável_.

* `MATCH_KEYCHAIN_PASSWORD`
 Esta senha será usada pelo Fastlane para descriptografar quando a nossa ferramenta de CI buscar estes certificados.
  Deve ser a mesma do _MATCH_PASSWORD_

- `APP_STORE_CONNECT_APPLE_ID`
Esta informação pode ser encontrada em: ___App Store Connect > Apps > Meu App > Informações dp App > Apple ID___.

* `AUTH_APP_STORE_CONNECT_API_KEY`
Esta variável de ser preenchida com o caminho do arquivo JSON que deverá ser criado no seguinte formato:
 ```
 {
	"key_id":  "ID DA CHAVE",
	"issuer_id":  "EMISSOR DA CHAVE",
	"key":  "CONTEÚDO DA CHAVE",
	"duration":  1200, //Não é necessário mudar
	"in_house":  false //Não é necessário mudar
}
```
Para obter essa chave, é necessário ser um __administrador__ da conta de desenvolvimento da Apple.
Esta opção estará disponível em: App Store Connect -> User and Access -> Keys (Conforme a imagem abaixo).
O arquivo que é gerado é um .p8 que contém um token (É possível abrir em qualquer editor de texto) e é com ele que deverá ser preenchido o atributo ___key___ do JSON acima.
Os outros atributos são preenchidos com os valores obtidos no portal conforme a foto.

<p align="center">
  <img src="images/api_key_location.png" width="600">
</p>

  > ---

#### Variáveis Azure 
 - `URL_DOMAIN`
O valor desta variável pode ser encontrado na url do repositório do projeto (conforme foto abaixo). O valor à ser preenchido deve ser somente a string que sucede o '__@__'.
<p align="center">
  <img src="images/create_url.png" width="600">
</p>
 - `AZURE_TOKEN`
O valor desta variável pode ser encontrado no portal da Azure no caminho ilustrado na imagem abaixo
<p align="center">
  <img src="images/create_token.png" width="400">
</p>

_Exemplo de resultado:_
<p align="center">
  <img src="images/urls_result.png" width="600">
</p>


## Passo 4: Submeter certificados para o git
Ao criar o setup do projeto, deverá ser criado todos os certificados e profiles no portal developer normalmente.
Após isso, será necessário adicionar todos eles em um repositório git (pode ser o mesmo do projeto, ou o mais recomendado, que é criar um um novo só para estes arquivos), para que o fastlane (através do __match__) possa utiliza-los e gerencia-los sempre que necessário.
Para adicionar os certificados no repositório, (já com o ambiente configurado e variáveis de ambiente preenchidas), deverá ser utilizado os seguintes comandos:

```bash
bundle exec fastlane match import --skip_certificate_matching true --type appstore
```

_Obs.: O comando mostrado acima, se aplica apenas para o certificado de distribuição na appstore. O mesmo comando deve ser utilizado para os certificados de __adhoc__ e __development__, substituindo apenas o type para o correspondente._

Ao fazer isso, será necessário passar três arquivos (__.cer__, __.p12__ e __.mobileprovision__) para cada um dos três comandos (--type appstore, --type adhoc e --type development).



## Passo 5: Configurar pipeline

-   #### Preencher variáveis na Azure Dev Ops
	- Deverá ser preenchido o valor de todas as variáveis do projeto no portal da Azure em __Pipelines -> Library__

-   #### Configurar deploy

 ```
	parameters:
		-  	name: softAppDist
			displayName: Upload to Soft App Dist
			type: string
			default: 'Yes'
			values:
			-  'Yes'
			-  'No'

		-  	name: testFlight
			displayName: Upload to TestFlight
			type: string
			default: 'No'
			values:
			-  'Yes'
			-  'No'
```
#####  Criar .env
 ```
-  script:  |
			cd app/ios/fastlane #Caminho para a pasta do fastlane
			echo "URL_DOMAIN=$URL_DOMAIN" > .env
			echo "AZURE_TOKEN=$AZURE_TOKEN" >> .env
			echo "ARTIFACT_PROD_NAME=$ARTIFACT_PROD_NAME" >> .env
			echo "ARTIFACT_DEV_NAME=$ARTIFACT_DEV_NAME" >> .env
			echo "APP_IDENTIFIER=$APP_IDENTIFIER" >> .env
			echo "WORKSPACE=$WORKSPACE" >> .env
			echo "SCHEME=$SCHEME" >> .env
			echo "TEAM_ID=$TEAM_ID" >> .env
			echo "IC_TEAM_ID=$IC_TEAM_ID" >> .env
			echo "MATCH_PASSWORD=$MATCH_PASSWORD" >> .env
			echo "MATCH_KEYCHAIN_PASSWORD=$MATCH_KEYCHAIN_PASSWORD" >> .env
			echo "APP_STORE_CONNECT_APPLE_ID=$APP_STORE_CONNECT_APPLE_ID" >> .env
			echo "AUTH_APP_STORE_CONNECT_API_KEY=$AUTH_APP_STORE_CONNECT_API_KEY" >> .env
	displayName:  '.env fastlane file creation'
```

#####  Gerar .ipa utilizando as funções disponíveis do arquivo FastFile da pasta fastlane
 ```
-  task:  Bash@3
	condition:  eq('${{ parameters.softAppDist }}', 'Yes')
	inputs:
		targetType:  'inline'
		script:  |
			bundle install
			bundle exec fastlane build_distribution
displayName:  'Build iOS'
```
#####  Enviar artefato para o Soft App Dist
 ```
-  task:  deploy-app-binary@0
	condition:  eq('${{ parameters.softAppDist }}', 'Yes')
	inputs:
		projectId:  "ID do projeto"
		apiKey:  "Key do projeto"
		filePath:  app/ios/nomeDoApp.ipa (local do .ipa)
	displayName:  Upload app to App Dist system
```

#####  Enviar artefato para o Test Flight
 ```
-  task:  Bash@3
	condition:  eq('${{ parameters.testFlight }}', 'Yes')
	inputs:
		targetType:  'inline'
		script:  |
			bundle install
			bundle exec fastlane build_appStore
displayName:  'Build iOS'
```

---
 ### Funções disponíveis
 -  __Download project keys__
 Utilizado para baixar e instalar os certificados e profiles existentes no projeto.
```bash
bundle exec fastlane download_keys
```
   - __Build Distribution (AppDist, App center e Firebase)__
Função utilizada para gerar uma compilação (.ipa) do projeto utilizando o certificado de __adHoc__. Esta funcão é utilizada apenas para fazer a compilação e posteriormente ser usada pelo CI (Azure Popelines) para submissão para outras ferramentas (Soft App Distribution e Firebase App Distribution).

  -  __Algumas observações__:
Por padrão a compilação é colocada dentro da pasta do projeto e utiliza a identificação inserida na variável  "_ARTIFACT_DEV_NAME_", que está sendo utilizado no atributo "_output_name_"

```bash
bundle exec fastlane build_distribution
```

* __Build App Store (TestFlight)__
Função utilizada para gerar uma compilação (.ipa) do projeto utilizando o certificado de __appStore__. Está funcão será utilizada pelo CI (Azure DevOps) para gerar o arquivo e envia-lo para o Test Flight.

  * __Algumas observações__:
Não esqueça de versionar o app corretamente antes de submete-lo.
Por padrão a compilação é colocada dentro da pasta do projeto e utiliza a identificação inserida na variável  "_ARTIFACT_PROD_NAME_", que está sendo utilizado no atributo "_output_name_"

```bash
bundle exec fastlane build_appStore
```
## Passo 6: Executar pipeline
Para executar o pipeline, você pode ir até a área "Pipelines" no portal Azure, selecionar a branch e os atributos desejados e executar, conforme a imagem abaixo:
<p align="center">
  <img src="images/execute_pipe.png" width="600">
</p>



## Extra: Configurar projeto no App Dist
Para disponibilizar o app para testes , é necessário que o aplicativo tenha sido criado na plataforma [Soft App Distribution](https://app-dist.softdesign.com.br/) .
Aqui está um exemplo de como criar:
<p align="center">
  <img src="images/app_dist_1.png" width="370">
  <img src="images/app_dist_2.png" width="330">
  <img src="images/app_dist_3.png" width="300">
</p>



_Obs.: Os atributos sublinhados na última imagem, são utilizados na configuração da task "deploy-app-binary@0" da Azure no arquivo de review e deploy (.yaml) do projeto._ 