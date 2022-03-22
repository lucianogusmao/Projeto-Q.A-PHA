*** Settings ***
Documentation     Este aqui é o nosso gerenciador de dependêcias.

##################################################################
#                         Libraries                              #     
##################################################################
Library         SeleniumLibrary
Library         DebugLibrary
Library         FakerLibrary 
    
##################################################################
#                        Keywords                                #
##################################################################
Resource        ../auto/keywords/kws_pesquisa.robot

##################################################################
#                         Pages                                  #
##################################################################
Resource        ../auto/pages/page_home.robot
Resource        ../auto/pages/page_search.robot

##################################################################
#                         Rooks                                  #
##################################################################
Resource          hooks.robot
Variables         hooks.PyYaml

