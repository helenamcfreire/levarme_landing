class PessoaController < ApplicationController

  def db
    @db ||= ActiveRecord::Base.connection
  end

  def create

    @pessoa = Pessoa.find_by_uid(params[:uid])

    if @pessoa == nil

      @pessoa = Pessoa.new
      @pessoa.uid = params[:uid]
      @pessoa.nome = params[:nome]
      @pessoa.save
    else
      db.execute("update pessoas set registration_id = '" + params[:registrationId] + "' where uid = '" + @pessoa.uid + "'")
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

    json = {'naoFoiCadastrado' => @pessoa_chat.nil?}

    render :json => json

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

    ids_participantes = [params[:currentUserId], params[:idAmigo]]

    id_evento = params[:idEvento]

    @pessoa_chat = PessoaChat.all(:conditions => ['participante_1_id IN (?) AND participante_2_id IN (?) AND evento_id = ?' , ids_participantes, ids_participantes, id_evento])
    @pessoa = Pessoa.find_by_uid(params[:idAmigo])

    if @pessoa.nil? || @pessoa.registration_id.blank? || @pessoa.registration_id.nil?
      registration_id = ''
    else
      registration_id = @pessoa.registration_id
    end

    #render :json => @pessoa_chat

    json = @pessoa_chat.collect do |pessoa_chat|
      {'participante_1_id' => pessoa_chat.participante_1_id, 'participante_2_id' => pessoa_chat.participante_2_id, 'chat_id' => pessoa_chat.chat_id, 'registration_id' => registration_id}
    end

    render :json => json
  end

end