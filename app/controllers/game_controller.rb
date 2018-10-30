class GameController < ApplicationController
    def name
        cookies.delete :name
        cookies.delete :secretnum
        cookies.delete :guess
        cookies[:tries] = -1
        cookies[:name] = params[:name]
        @name = cookies[:name].to_s
        if cookies[:name] != nil
            render "try.html.erb"
        end
    end
    def try
        @guess = params[:guess].to_i

        #counter
        if cookies[:tries].to_i == nil
            cookies[:tries].to_i = 0
        else
            cookies[:tries] = cookies[:tries].to_i + 1
        end
        
        #randomizer
        if cookies[:secretnum] === nil
            cookies[:secretnum] = rand(1..100).to_i
        end
        
        #guesses
        if @guess == 0
            @guess = nil
        elsif @guess == cookies[:secretnum].to_i
            @hilo = "You guessed correctly, the secret number was #{cookies[:secretnum]}"
            # cookies[:secretnum] = rand(0..100)
        elsif @guess > cookies[:secretnum].to_i
            @hilo = "The guess is too high."
        elsif @guess < cookies[:secretnum].to_i
            @hilo = "The guess is too low."
        end
        render "try.html.erb"
    end
    def reset
        cookies.delete :name
        cookies.delete :secretnum
        cookies.delete :guess
        cookies[:tries] = 0
        redirect_to action: "name"
    end
end