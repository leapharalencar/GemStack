Dado("que eu tenho um email bom") do
    @email = "papito@acme.com"
end
  
Dado("acesso a pagina de login") do
    visit "https://spotlab.herokuapp.com/"
end
  
Quando("eu submeto meu email") do
    pending # Write code here that turns the phrase above into concrete actions
end
  
Então("devo ver a área de administração de spots") do
    pending # Write code here that turns the phrase above into concrete actions
end