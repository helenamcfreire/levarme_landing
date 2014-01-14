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
    ids_participantes = ids_participantes.map(&:to_s)

    id_evento = params[:idEvento]

    @pessoa_chat_cadastrada = PessoaChat.all(:conditions => ['participante_1_id IN (?) AND participante_2_id IN (?) AND evento_id = ?' , ids_participantes, ids_participantes, id_evento])

    id_chat = next_chat_id()

    if @pessoa_chat_cadastrada.blank?

        @pessoa_chat = PessoaChat.new
        @pessoa_chat.participante_1_id = ids_participantes[0]
        @pessoa_chat.participante_2_id = ids_participantes[1]
        @pessoa_chat.evento_id = id_evento
        @pessoa_chat.chat_id = id_chat
        @pessoa_chat.save

    end

    render :nothing => true

  end

  def next_chat_id

    id_chat = 1

    ultimo_chat = PessoaChat.order(:chat_id).last

    if ultimo_chat != nil
      id_chat = ultimo_chat.chat_id.next
    end

    id_chat
  end

  def list_chat

    ids_participantes = eval(params[:idsParticipantes])
    ids_participantes = ids_participantes.map(&:to_s)

    id_evento = params[:idEvento]

    @pessoa_chat = PessoaChat.all(:conditions => ['participante_1_id IN (?) AND participante_2_id IN (?) AND evento_id = ?' , ids_participantes, ids_participantes, id_evento])

    render :json => @pessoa_chat
  end

end