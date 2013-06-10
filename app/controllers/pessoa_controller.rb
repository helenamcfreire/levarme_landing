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

end