# Switch
Este switch ao ser criado vai ser posicionado na tela do cliente e ao ser clicado será executado uma animação no mesmo de "liga e desliga", você consegue verificar e aplicar o status de ligado/desligado além de outras funções.

## createSwitch
Criar um switch.
``` lua
element createSwitch ( float startX, float startY, float width, float height [, bool selected = false ] )
```
### Argumentos Necessários
- **startX:** Um ponto flutuante que representa a posição absoluta da origem X do retângulo, representado por pixels na tela.
- **startY:** Um ponto flutuante que representa a posição Y de origem absoluta do retângulo, representado por pixels na tela.
- **width:** Um ponto flutuante que representa a largura do retângulo, desenhado na direção certa a partir da origem.
- **height:** Um flutuador que representa a altura do retângulo, desenhado para baixo a partir da origem.

### Argumentos Opcionais
- **selected:** Um booleano que indica se o switch já vai ser criado selecionado(ligado).

### Returns
Retorna o `element` do switch se tiver sido criado com sucesso.


## destroySwitch
Destroi um switch.
``` lua
bool destroySwitch ( table/element switch )
```
### Argumentos Necessários
- **switch:** Elemento ou tabela do switch que deseja destruir.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.



## showSwitch
Mostrar o switch com animação de surgindo.
``` lua
bool showSwitch ( table/element switch [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Argumentos Necessários
- **switch:** Elemento ou tabela do switch que deseja mostar.

### Argumentos Opcionais
- **actionTime:** Um número em milissegundo para a animação ser concluída.
- **easing:** A [função de easing](https://wiki.multitheftauto.com/wiki/Easing) a ser usada para a animação.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.


## setSwitchVisible
Aletrar a exibição do switch sem animação.
``` lua
bool setSwitchVisible ( table/element switch, bool isVisible)
```
### Argumentos Necessários
- **switch:** Elemento ou tabela do switch que deseja destruir.
- **isVisible:** Um booleano que indica se queremos mostrar (true) ou escondê-lo (false).

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.


## isSwitchSelected
Verifica se o switch está ligado ou desligado.
``` lua
bool isSwitchSelected ( element switch )
```
### Argumentos Necessários
- **switch:** Elemento do switch que deseja destruir.

### Returns
Retorna `true` se o switch estiver ligado, caso contrário, retorna `false`.


## setSwitchSelected
Verifica se o switch está ligado ou desligado.
``` lua
bool setSwitchSelected ( element switch, bool selected )
```
### Argumentos Necessários
- **switch:** Elemento do switch que deseja destruir.
- **selected:** Um booleano que indica se queremos ligar (true) ou desliga-lo (false).

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.



# Button
Este botão ao ser criado vai ser posicionado na tela do cliente e ao ser clicado será executado uma animação no mesmo de "selecionado".

## createButton
Criar um botão.
``` lua
element createButton ( float startX, float startY, float width, float height [, string text = "", string color = "gray", table colorText = {255, 255, 255, 255} ] )
```
### Argumentos Necessários
- **startX:** Um ponto flutuante que representa a posição absoluta da origem X do retângulo, representado por pixels na tela.
- **startY:** Um ponto flutuante que representa a posição Y de origem absoluta do retângulo, representado por pixels na tela.
- **width:** Um ponto flutuante que representa a largura do retângulo, desenhado na direção certa a partir da origem.
- **height:** Um flutuador que representa a altura do retângulo, desenhado para baixo a partir da origem.

### Argumentos Opcionais
- **text:** Uma string com o nome que vai ficar em cima do botão.
- **color:** Uma string com a cor do botão. Cores padrões: (grey) e (green).
- **colorText:** Uma tabela com o R, G, B, A das cores em que o `text` deve ficar.

### Returns
Retorna o `element` do botão se tiver sido criado com sucesso.



# Response
Este sistema responsivo foi criado com o intuito de bloquear ações de um jogador em quanto ele aguarda a resposta de algum evento, bastante utilizado para comunicações entre server/client.

## setResponseEnabled
Aplicar se está aguardando alguma resposta ou não.
``` lua
bool setResponseEnabled ( bool response )
```
### Argumentos Necessários
- **response:** Um booleano que indica se queremos deixar aguardando uma resposta (true) ou encerra-la (false).

### Returns
Retorna `true` se a resposta estiver sendo aguardada, caso contrário, retorna `false`.


## isResponseEnabled
Verificar se está aguardando alguma resposta.
``` lua
bool isResponseEnabled ( )
```

### Returns
Retorna `true` se a resposta estiver sendo aguardada, caso contrário, retorna `false`.
