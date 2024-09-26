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

### Exemplo Client-side
```lua
local sx, sy = guiGetScreenSize()
local zoom = 1
local baseX = 1920
local minZoom = 2
if sx < baseX then
    zoom = math.min(minZoom, baseX/sx)
end

function createSwitchOnCenterScreen()
    local switch = exports.Framework:createSwitch((sx - 100/zoom)/2, (sy - 50/zoom)/2, 100/zoom, 50/zoom)
end

createSwitchOnCenterScreen()
```

## destroySwitch
Destroi um switch.
``` lua
bool destroySwitch ( table/element switch )
```
### Argumentos Necessários
- **switch:** Tabela ou elemento do switch que deseja destruir.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## showSwitch
Mostrar o switch com animação de surgindo.
``` lua
bool showSwitch ( table/element switch [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Argumentos Necessários
- **switch:** Tabela ou elemento do switch que deseja mostar.

### Argumentos Opcionais
- **actionTime:** Um número em milissegundo para a animação ser concluída.
- **easing:** A [função de easing](https://wiki.multitheftauto.com/wiki/Easing) a ser usada para a animação.

## hideSwitch
Ocultar o switch com animação de sumindo.
``` lua
bool hideSwitch ( table/element switch [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Argumentos Necessários
- **switch:** Tabela ou elemento do switch que deseja mostar.

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
- **switch:** Tabela ou elemento do switch que deseja destruir.
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

### Exemplo Client-side
```lua
local sx, sy = guiGetScreenSize()
local zoom = 1
local baseX = 1920
local minZoom = 2
if sx < baseX then
    zoom = math.min(minZoom, baseX/sx)
end

function createButtonOnCenterScreen()
    local button = exports.Framework:createButton((sx - 100/zoom)/2, (sy - 50/zoom)/2, 100/zoom, 50/zoom, "Teste")
end

createButtonOnCenterScreen()
```

## destroyButton
Destroi um botão.
``` lua
bool destroyButton ( table/element button )
```
### Argumentos Necessários
- **button:** Tabela ou elemento do button que deseja destruir.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## setButtonText
Altera o texto que fica em cima do botão.
``` lua
bool setButtonText ( table/element button, string text )
```
### Argumentos Necessários
- **button:** Tabela ou elemento do button que deseja destruir.
- **text:** Uma string com o novo nome que vai ficar em cima do botão.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## getButtonText
Altera o texto que fica em cima do botão.
``` lua
bool getButtonText ( table/element button )
```
### Argumentos Necessários
- **button:** Tabela ou elemento do button que deseja destruir.

### Returns
Retorna uma `string` com o texto atual do botão.

## setButtonVisible
Aletrar a exibição do switch sem animação.
``` lua
bool setButtonVisible ( table/element button, bool isVisible)
```
### Argumentos Necessários
- **button:** Tabela ou elemento do botão que deseja destruir.
- **isVisible:** Um booleano que indica se queremos mostrar (true) ou escondê-lo (false).

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## showButton
Mostrar o botão com animação de surgindo.
``` lua
bool showButton ( table/element button [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Argumentos Necessários
- **button:** Tabela ou elemento do botão que deseja mostar.

### Argumentos Opcionais
- **actionTime:** Um número em milissegundo para a animação ser concluída.
- **easing:** A [função de easing](https://wiki.multitheftauto.com/wiki/Easing) a ser usada para a animação.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## hideButton
Ocultar o botão com animação de sumindo.
``` lua
bool hideButton ( table/element button [, float actionTime = 500, string easing = "OutQuad" ] )
```
### Argumentos Necessários
- **button:** Tabela ou elemento do botão que deseja mostar.

### Argumentos Opcionais
- **actionTime:** Um número em milissegundo para a animação ser concluída.
- **easing:** A [função de easing](https://wiki.multitheftauto.com/wiki/Easing) a ser usada para a animação.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## setButtonX
Aletrar a posição horizontal de um botão.
``` lua
bool setButtonX ( table/element button, float startX)
```
### Argumentos Necessários
- **button:** Tabela ou elemento do botão que deseja destruir.
- **startX:** Um ponto flutuante que representa a posição absoluta da origem X do retângulo, representado por pixels na tela.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.

## setButtonY
Aletrar a posição vertical de um botão.
``` lua
bool setButtonX ( table/element button, float startY)
```
### Argumentos Necessários
- **button:** Tabela ou elemento do botão que deseja destruir.
- **startY:** Um ponto flutuante que representa a posição absoluta da origem X do retângulo, representado por pixels na tela.

### Returns
Retorna `true` se a operação foi bem-sucedida, caso contrário, retorna `false`.


# Response
Esta função responsiva foi criado com o intuito de bloquear ações de um jogador em quanto ele aguarda a resposta de algum evento, bastante utilizado para comunicações entre server/client.

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



# Gui
Esta função foi feita para identificar se um GUI está aberto.

## setOpenGUI
Aplicar se um GUI está aberto ou não.
``` lua
bool setOpenGUI ( bool opened )
```
### Argumentos Necessários
- **opened:** Um booleano que indica se um GUI está aberto (true) ou não (false).

### Returns
Retorna `true` se um GUI estiver aberto, caso contrário, retorna `false`.

## canOpenGUI
Verificar se o jogador pode abrir outro GUI.
``` lua
bool canOpenGUI ( )
```
### Returns
Retorna `true` se um GUI não estiver aberto, caso contrário, retorna `false`.


# Escape
Esta função foi criada para verificar se o jogador está fora do jogo.

## setEscapeOpen
Aplicar se um jogador está fora do jogo ou não.
``` lua
bool setEscapeOpen ( bool opened )
```
### Argumentos Necessários
- **opened:** Um booleano que indica se um jogador está fora do jogo (true) ou não (false).

### Returns
Retorna `true` se o jogador estiver fora do jogo, caso contrário, retorna `false`.

## isEscapeOpen
Verificar se o jogador está fora do jogo.
``` lua
bool isEscapeOpen ( )
```
### Returns
Retorna `true` se o jogador estiver fora do jogo, caso contrário, retorna `false`.