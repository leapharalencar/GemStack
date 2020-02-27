#language: pt

Funcionalidade: Login
    Para que eu possa ter acesso a interface de administração de spots
    Sendo um usuário que possui um bom email
    Quero poder iniciar uma nova sessão

    @doing
    Cenario: Nova sessao

    Dado que eu tenho um email bom
    E acesso a pagina de login
    Quando eu submeto meu email
    Então devo ver a área de administração de spots

    Cenario: Email ruim

    Dado que eu tenho um email incorreto
    E acesso a pagina de login
    Quando eu submeto meu email
    Então devo ver a mensagem de alerta: "Oops. Informe um email válido!"

    Cenario: Email branco

    Dado que eu não tenho um email
    E acesso a pagina de login
    Quando eu submeto meu email
    Então devo ver a mensagem de alerta: "Oops. Informe um email válido!"