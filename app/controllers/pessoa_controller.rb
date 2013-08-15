class PessoaController < ApplicationController

  def create

    @pessoa = Pessoa.find_by_uid(params[:uid])

    if @pessoa == nil

      @pessoa = Pessoa.new
      @pessoa.uid = params[:uid]
      @pessoa.nome = params[:nome]
      @pessoa.save

    end

  end

  def list
    @pessoas = Pessoa.all
    render :json => @pessoas
  end

  def add_pessoas_chat


  end

  def list_chats
    @pessoas_chat = PessoaChat.find_all_by_pessoa_id(params[:uid])
    render :json => @pessoas_chat
  end

end