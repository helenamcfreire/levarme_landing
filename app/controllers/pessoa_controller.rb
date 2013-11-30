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

  def add_pessoa_chat

    #o método eval() serve pra transformar uma string em array
    ids_participantes = eval(params[:idsParticipantes])

    id_evento = params[:idEvento]

    ids_participantes.each do |id_participante|
      @pessoa_chat = PessoaChat.new
      @pessoa_chat.pessoa_id = id_participante
      @pessoa_chat.evento_id = id_evento
      @pessoa_chat.save
    end

  end

  def list_chat

    ids_participantes = eval(params[:idsParticipantes])
    id_evento = params[:idEvento]

    @pessoa_chat = PessoaChat.all(:conditions => ['pessoa_id IN (?) AND evento_id = ?' , ids_participantes, id_evento])

    render :json => @pessoa_chat
  end

end