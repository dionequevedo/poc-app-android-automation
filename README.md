# poc-app-android-automation
## Exemplo de automação de testes em um APP android

Para executar os testes do APP (**Android-MyDemoAppRN.1.3.0.build-244.apk**) usando **Robot Framework** e **Appium**, siga as etapas abaixo:

1. Certifique-se de ter o Robot Framework e o Appium instalados em seu ambiente de desenvolvimento.

2. Clone o repositório do projeto do aplicativo Android através do seguinte comando:
    ```
    git clone https://github.com/dione-quevedo-avanade/poc-app-android-automation.git
    ```

3. Navegue até o diretório raiz do projeto e abra um terminal.

4. Instale as dependências do projeto executando o seguinte comando:
    ```
    pip install -r requirements.txt
    ```

5. Inicie o servidor Appium executando o seguinte comando:
    ```
    npx appium
    ```
    
6. Identifique os emuladores disponíveis no ambiente através do comando:
    ```
    emulator -list-avds
    ```

7. Inicie o emulador escolhido através do comando:
    ```
    emulator -avd <nome_do_avd>
    ```

8. Abra um novo terminal e navegue até o diretório raiz do projeto de automação de testes.

9. Execute os testes **`locais`** usando o seguinte comando:
    ```
    robot -d logs/local/ tests/*-local.robot
    ```

10. Para testes _remotos_ hospedados no **`BrowserStack`** use o seguinte comando:
    ```
    browserstack-sdk robot -d logs/browserstack/ tests/*browserstack.robot
    ```

Isso executará todos os testes presentes no diretório `tests/` usando o Robot Framework e o Appium.

Certifique-se de que o dispositivo avd esteja _on-line_ e que as configurações de conexão estejam corretas no arquivo de configuração do Appium.
