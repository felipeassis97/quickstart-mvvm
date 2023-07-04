# Setup Android Fastlane

## Passo 1: Instalar e configurar o Fastlane

Para iniciar este processo, você deve colar toda a pasta com a configuração do fastlane juntamente com o arquivo Gemfile na raiz do seu projeto. Em caso de projetos que utilizam Flutter ou React native, o conteúdo deve ser colado na pasta "android", ou iniciar o processo do zero seguindo a documentação.
Para obter instruções de instalação do fastlane, consulte [Instalando _fastlane_](https://docs.fastlane.tools/getting-started/android/setup/).
É recomendado seguir a instalação via [_Bundler_](https://bundler.io/), além de instalar um gerenciador de versões do Ruby o [_rbenv_](https://github.com/rbenv/rbenv#readme).

## Passo 2: Inserir variáveis de ambiente
Para rodar esse projeto, você vai precisar adicionar as seguintes variáveis de ambiente no seu .env localizado dentro da pasta _fastlane_.

#### Informações do app
* `PACKAGE_NAME`
  > Identifier do app. _Ex.: br.com.example_

#### Assinatura do app
- `STORE_FILE`
  > Caminho para a keystore (.jks) do projeto.

* `STORE_PASSWORD`
  > Senha da Keystore.

* `KEY_ALIAS`
  > Key alias da keystore.

* `KEY_PASSWORD`
  > Key alias password.

* `PLAY_STORE_CONFIG_JSON`
  > Esse arquivo é um token para o CI conseguir submeter versões diretamente na Google Play.
Para obter essa chave, é necessário ser um __administrador__ da conta de desenvolvimento da Google.
	<p align="center">
  		<img src="images/google_auth.png" width="600">
	</p> 
> Você pode obter mais informações em [Fastlane Android setup](http://docs.fastlane.tools/actions/upload_to_play_store/#upload_to_play_store)
- Aqui está um exemplo da chave gerada:
 ```
{
    "type": "service_account",
    "project_id": "pc-api-5599031065322202413-580",
    "private_key_id": "cf9e2f5b13dda4d90086fdf4ecdf94cb008e1322",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjROC/pm1Sf+gE\nyYJYjnSTfaaGJQZmlo+ULRnW+fpz6ZRpagAwkHLY/jyTfL4QoId+cramOMOmdShn\n7lvzDO+S6JAdJP9It4XuIX2qR2/ocTL5AMILGe4mKjjlLlPas7SVLSFR7qc41ax5\nfIQsFpvw43tWdNmes8g80paXHLYsFWyRvrFqZ6bEqFeQUSnk2oIIbRkVGVjzaTS4\nTPuds1+2kGd/Wh9zgd2HS3K8AEYcpUWbhUMDXKwoBic4VdnzStf19s7CluCJqFcf\n4RTmPcENkebCruHTfNuKEN/f2o67hPtBTiOFhPee0iB0VcXmzxOy/Z6BOUC6A3Ll\nhxpA97pRAgMBAAECggEAGYwZk5GawmZcZ4VbYKcK1bWPLY8l7AxKsYZsXC0XiUYd\nh8gBo3PpZRkXKCEioG3bLUyp2X+SBrkuxJgXv/eZSrNX197bz4nJxV4AaU7EdqWa\n7EC4j1Tn32RppuGRTYlb6FT9ZN9l7s6eJ73mgao891Qq/in+eIePH78wbGYu2D+O\nCHkSzrUIVALASCsJUUbNoGCV2oMjugks8NcUIWbxGIQeLVd7LR23Zb85sJ7qW8tP\n6lN7+e49h/PcEJOZ3IMFhNVigWe02yzrQ+QjqwSqWTZNFs/ZayJJmp/lIHxFLV5O\n22bzdqvoAqlRsBPsK/yzvRPZj9KQp3RqsxQqoNhkbQKBgQD3kkB6+p2tFE2O6v9x\n5MSDUMfj6hVMg/FJKrE59ZEMuSJlFVWgzksT98a1Zp7Sdi8gLPYh8d7Bgz+e0EEk\nLWGvSD7QpBc2Nwq+VETbwZh8xNcAOEZJHseoVort2B82ZWZGTjMSXYy7oCxammUg\nn9XQN2lsn8sCNTpu5yUu8WtTGwKBgQDrAa20nrTYrOB9anFBJV41O6+xrBxUiN+u\n4T/74V01FuTLSQ1WfSbI4l/jzn8g6+/0GZ4GtrfuqvtryuKwshuLcR5sLaRi84ON\n2xgwsYsfUJh87s1cuo5TCPALYlhJKdUHqeUj7xtF4OzbutFlp2h4wu8cur/+TQJ8\nax5XaoxTAwKBgQDzUF/i/dBdvKiFH9yyeR3R2WC7VOJd8wb+2+CWkAxgrstpAVDI\n3DbZhxlaS2MogVLLkqTMs8Qz9+RdF1wOTDPHa3+g2sSdWfdLG9MZD+noJiUQaD5b\nus6LWZLtMw1qDro3ur9i+2JHPKKa4UcmizA+xyz+WV7pQKBgCXE\nK0ovhxibD6iYBoNVogIkCWQgKJ1dMbVE9adg3D2/5BzXLJGNo0H9PzO4560+vV0Z\nENA7ZOuyBp2YCT4kIVETaLQx0Y0lXSra3tRUc+sgZKEPL2mLgXvOn+T0dQOs+VM1\n9mED9/oO34GgUC5p7NwbV5niWSBg99lOzZ12vf5JAoGAKZII+DK8jTD0qTRvvy9M\nBuF3O2Wyd9DetnS9jwlwO4SDB5lFn7zK6huRGdeOF1XzHMRrRY+zxpHW8c8iLM4v\nxwLKymJ0RDUfN4q4eZN5lNpCuk9k7Q1AlyCW/I31oB1BWEI/JJ2MdBq2gUSs71dA\nGvOJEkwE9r1mNI/MQqs7ExQ=\n-----END PRIVATE KEY-----\n",
    "client_email": "auth-sp-suite@pc-api-5599031065322202413-999.iam.gserviceaccount.com",
    "client_id": "11414700653889411065607",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x798/auth-sp-suite%40pc-api-5599031065322202413-660.iam.gserviceaccount.com"
  }
```

---



## Passo 3: Configurar _build.grandle_
Inserir as variáveis de assinatura no arquivo _'app/build_grandle'_ conforme o exemplo abaixo:

 ```

signingConfigs {
 debug {
 	// Debug config
 }
 release {
	def keystore = System.getenv("STORE_FILE")
	def keystorePass = System.getenv("STORE_PASSWORD")
	def kAlias = System.getenv("KEY_ALIAS")
	def kPass = System.getenv("KEY_PASSWORD")
	
	storeFile file("$keystore")
	storePassword "$keystorePass"
	keyAlias  "$kAlias"
	keyPassword "$kPass"             
 	}
 }

buildTypes {
	debug {
            signingConfig signingConfigs.debug
        }
        release {
            signingConfig signingConfigs.release
 	}
 }
```

## Passo 4: Configurar pipeline

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

		-  	name: playStore
			displayName: Upload to Play Store
			type: string
			default: 'No'
			values:
			-  'Yes'
			-  'No'
```
#####  Criar .env
 ```
-  script:  |
          cd android/fastlane
          echo "SPRING_POINT_STORE_FILE=$SPRING_POINT_STORE_FILE" > .env
          echo "SPRING_POINT_STORE_PASSWORD=$SPRING_POINT_STORE_PASSWORD" >> .env
          echo "SPRING_POINT_KEY_ALIAS=$SPRING_POINT_KEY_ALIAS" >> .env
          echo "SPRING_POINT_KEY_PASSWORD=$SPRING_POINT_KEY_PASSWORD" >> .env
          echo "PLAY_STORE_CONFIG_JSON=$PLAY_STORE_CONFIG_JSON" >> .env
	displayName:  '.env fastlane file creation'
```

#####  Gerar .apk utilizando as funções disponíveis do arquivo FastFile da pasta fastlane
 ```
-  task:  Bash@3
	condition:  eq('${{ parameters.softAppDist }}', 'Yes')
	inputs:
		targetType:  'inline'
		script:  |
		        bundle install
		        bundle exec fastlane build_debug
displayName:  'Build apk (debug)'
```
#####  Enviar artefato para o Soft App Dist
 ```
-  task:  deploy-app-binary@0
	condition:  eq('${{ parameters.softAppDist }}', 'Yes')
	inputs:
		projectId:  "ID do projeto"
		apiKey:  "Key do projeto"
		filePath:  app/ios/nomeDoApp.apk (local do .apk)
	displayName:  Upload app to App Dist system
```

#####  Enviar artefato para a Play store

__Obs__.: _ A versão é setada para teste interno na Google, caso você queira mudar a faixa, basta alterar a lane "_upload_play_store_" em "_/fastlane/Fastfile_", no atributo '_track_'. As opções isponíveis são: production, beta, alpha e internal.
 ```
-  task:  Bash@3
	condition:  eq('${{ parameters.playStore }}', 'Yes')
	inputs:
		targetType:  'inline'
		script:  |
		        bundle install
		        bundle exec fastlane build_release
		        bundle exec fastlane upload_play_store
displayName:  'Build apk (release)'
```

---
 ### Funções disponíveis

* __Build Debug__
Gera um apk em debug para posteriormente enviar para o App Dist.

```bash
bundle exec fastlane build_debug
```

* __Build Release__
Gera um aab release (assinado) para posteriormente enviar para o Google Play na faixa de teste selecionada.

```bash
bundle exec fastlane build_release
```
* __Upload Play Store__
Envia o aab gerado na lane (build_release) para o Google Play na faixa selecionada.

```bash
bundle exec fastlane upload_play_store
```

## Passo 5: Executar pipeline
Para executar o pipeline, você pode ir até a área "Pipelines" no portal Azure, selecionar a branch e os atributos desejados e executar, conforme a imagem abaixo:
<p align="center">
  <img src="images/pipe-android.png" width="350">
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
