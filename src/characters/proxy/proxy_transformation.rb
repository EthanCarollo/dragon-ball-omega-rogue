# Here, they are some proxy that I use when i wan't to transform the player into a SuperSayan for example

class ProxyTransformation
    def initialize(state)
        @state = state
    end

    def activate
        raise "Default proxy transformation used, shouldn't"
    end
end

class SuperSayanProxy < ProxyTransformation
    def activate
        @state.character.updateState(SSJState.new(@state.character))
        @state.character.set_max_hp(500).heal(500)
        Player.instance.window.event_manager.notify("Character transformed in Super Sayan !")
    end
end

class SuperSayanGodProxy < ProxyTransformation
    def activate
        @state.character.updateState(SSGodState.new(@state.character))
        @state.character.set_max_hp(1250).heal(1250)
        Player.instance.window.event_manager.notify("Character transformed in Super Sayan God !")
    end
end