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

    #o método eval() serve pra transformar uma string em array
    ids_participantes = eval(params[:idsParticipantes])

    id_chat = next_chat_id()

    ids_participantes.each do |id_participante|
      @pessoa_chat = PessoaChat.new
      @pessoa_chat.pessoa_id = id_participante
      @pessoa_chat.chat_id = id_chat
      @pessoa_chat.save
    end

  end

  def next_chat_id

    id_chat = 1

    ultimo_chat = PessoaChat.order(:chat_id).last

    if ultimo_chat != nil
      id_chat = ultimo_chat.chat_id.next
    end

    id_chat
  end

  def list_chats
    @pessoas_chat = PessoaChat.find_all_by_pessoa_id(params[:uid])
    render :json => @pessoas_chat
  end

end