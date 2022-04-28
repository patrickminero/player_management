module Domain
  module Player
    module Repositories
      class PlayerRepository
        def self.all(position)
          !position ? Domain::Models::Player.all : Domain::Models::Player.where(position: position)
        end

        def self.create(params)
          player = Domain::Models::Player.create(params)
          if player.valid?
            email = Domain::Team::Services::GetTeam.call(player.team_id).email
            body = {subject: "#{player.name} added to your team", email: email, player: player.to_hash}.to_json
            self.send_player_email body
          end
          player
        end

        def self.find(id)
          Domain::Models::Player.find(id)
        end

        def self.update(id, params)
          player = find(id.to_i)&.update(params)
          if player.valid?
            email = Domain::Team::Services::GetTeam.call(player.team_id).email
            body = {subject: "#{player.name} info has been updated", email: email, player: player.to_hash}.to_json
            self.send_player_email body
          end
          player
        end

        def self.destroy(id)
          player = find(id.to_i)
          player&.destroy

          if player.valid?
            email = Domain::Team::Services::GetTeam.call(player.team_id).email
            body = {subject: "#{player.name} removed your team", email: email, player: player.to_hash}.to_json
            send_player_email body
          end
          player
        end

        private

        def self.send_player_email body
          conn = Bunny.new
          conn.start

          ch = conn.create_channel
          q  = ch.queue("new_player_email")
          x  = ch.default_exchange.publish(body, :routing_key => q.name)
          conn.close
        end
      end
    end
  end
end
